#include "common.h"
#include <kernel.h>
#include <libapi.h>
#include <libspu.h>
#include <libcd.h>
#include <libsnd.h>

// FIXME: music suddenly cuts out. dear god what have I done

#define NCHANNELS   24

typedef struct {
    int unk0;
    u16 epoch;
    u16 unk2;
    u16 vol;
    u16 pan;
    short time;
    char unk6;
    char active;
} Channel;

extern Channel channels[NCHANNELS];
char D_800521E0[NCHANNELS];

void sfx_tick(void) {
    func_80031770(D_800521E0);
    u32 mask = 0;
    for (int i = 0; i < NCHANNELS; i++) {
        Channel *p = &channels[i];
        if (p->active != 1) continue;
        if ((u16) p->time < 0x7FFFU) {
            p->time++;    // timer
        }

        char stat = D_800521E0[i];
        if (stat == SPU_ON_ENV_OFF) {
            // envelope
            if (p->unk2++ > 8) {
                mask |= 1 << i;
            }
        } else if (p->unk2 && (stat == SPU_ON)) {
            p->unk2 = 0;
        }
    }
    
    if (mask)
        func_8001F578(mask);    // free these
    func_8001E2F4();    // is a nop
}


INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E744);

//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E790);
// static
void func_8001E790(void)
{
    func_80030E94();
}

// sfx_init
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E7B0);


typedef struct {
    VabHdr header;
    ProgAtr progattrs[128];
    VagAtr toneattrs[][16];
} VabRealHeader;

typedef struct {
    int x[2];
} P2;

typedef struct {
    VabHdr hdr;
    ProgAtr *progs;
    VagAtr  *tones;
    P2 *p2;
    u16 *offsets;
    u16 nprogs;     // real, with and without tones
    u16 ntones;
    u16 nvags;
    char a;
    char b;
} VabFile;

extern int D_80047E10;
extern int D_80047E14;
extern VabFile loaded_vabs[4];
extern int D_80047F84;
extern int D_80047F8C;
extern int D_80047F94;

extern ProgAtr *vab_progs_next;
extern VagAtr *vab_tones_next;
extern u16 *vab_offsets_next;

extern u8 D_80047F9C[8];
extern int D_80047FA4;

//INCLUDE_ASM("asm/main/nonmatchings/274C", sfx_load_vab);
// sfx_load_vab
s16 sfx_load_vab(VabRealHeader *arg, s16 idx) {
    // TODO: refactor this insanity
    u16 vagoff;
    u16 vcount;

    u16 nprogs;
    u16* vag_sizes;
    u32 j;
    u8 ntones;
    ProgAtr *progattrs;
    u32 size;

    u32 ui;

    if (idx == -1) {        
        for (int i = 0; i < 4; i++) {
            if (loaded_vabs[i].a == 0) break;
            idx = i;
        }

        if (idx == -1)
            return -1;
    }

    if (idx >= 4)
        return -1;

    if (loaded_vabs[idx].a == 1) return -1;
    if (!(arg->header.ps + D_80047F84 < 0x200U && arg->header.ts + D_80047F8C < 0x100U)) return -1;
    progattrs = arg->progattrs;
    if (arg->header.vs + D_80047F94 >= 0x100U) return -1;
    
    loaded_vabs[idx].hdr = arg->header;

    ui = arg->header.ps;
    loaded_vabs[idx].progs = vab_progs_next;
    size = arg->header.fsize;
    int tone_off = 0;
    for (int i = 0; i < ui; i++) {
        if (progattrs[i].tones == 0)    // empty ones don't count
            ui += 1;
        *vab_progs_next = progattrs[i];
        vab_progs_next->attr = 2;
        vab_progs_next->reserved2 = tone_off;    // tone accum index start thing
        tone_off += vab_progs_next->tones;
        vab_progs_next += 1;
    }        
    loaded_vabs[idx].nprogs = ui;
    D_80047F84 += ui;

    loaded_vabs[idx].tones = vab_tones_next;
    loaded_vabs[idx].ntones = arg->header.ts;
    nprogs = arg->header.ps;
    D_80047F8C += arg->header.ts;
    int real_i = 0;
    for (int i = 0; i < nprogs; i++) {
        ntones = arg->progattrs[i].tones;
        if (ntones != 0) {
            for (int j = 0; j < ntones; j++) {
                *vab_tones_next++ = arg->toneattrs[real_i][j];
            }
            real_i++;
        } else {
            nprogs += 1;
        }
    }

    vagoff = 0;    
    vcount = arg->header.vs; 
    loaded_vabs[idx].nvags = vcount;
    loaded_vabs[idx].offsets = vab_offsets_next;
    D_80047F94 += vcount;
    vag_sizes = arg->toneattrs[arg->header.ps];
    for (int i = 0; i < vcount; i++) {
        vagoff += vag_sizes[i];
        *vab_offsets_next++ = vagoff;
    }
    
    loaded_vabs[idx].a = 1;
    loaded_vabs[idx].b = 0;
    //loaded_vabs[idx].hdr.fsize -= sizeof(VabRealHeader) + (arg->header.ps) * 16 * sizeof(VagAtr);
    loaded_vabs[idx].hdr.fsize -= 0xA20 + (arg->header.ps) * 16 * sizeof(VagAtr);
    D_80047F9C[D_80047FA4++] = idx;

    return idx;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EEA4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EFAC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F17C);


// NOTE: I wouldn't bet my life on the correctness of this function. but it seems
// to be behaving just like the original as far as I can tell.
// static int play()
static int play(int channel, u16 vab_idx, u16 prog_idx, u16 tone_idx, int pan, int vol, u16 note, u16 cent)
{
    Channel *temp_s1 = &channels[channel];

    if (prog_idx >= 0x80) return -1;
    if (tone_idx >= 0x10) return -1;            
    if ((s16) vol > 255) {
        vol = 255;
    }    
    if ((s16) vol < -255) {
        vol = -255;
    }    
    if ((u8) temp_s1->active == 1) return -2;
    
    VabFile *vab = &loaded_vabs[vab_idx];
    VagAtr *vag = &vab->tones[tone_idx + vab->progs[prog_idx].reserved2];

    if (vag->vag == 0) return -1;
    
    if (pan == -1) {
        pan = (u32) vag->pan;
    }
    
    pan = (pan << 16) >> 16;

    if (pan < 0) {
        pan = 0;
    }
    if (pan > 127) {
        pan = 127;
    }
    if (note > 127)
        note = 127;
    if (cent > 127)
        cent = 127;
    if (note == 0)
        note = 60;
    if (cent > 127)
        cent = 0;
    func_8001FBE4();
    func_8003111C(D_80047E10);
    temp_s1->unk0 = D_80047E10;
    
    u32 mask = 1 << channel;
    int right = pan > 64 ? 64 : pan;
    int left = pan > 64 ? 127 - pan : 64;

    func_8001E0CC(&(SpuVoiceAttr) {
        .mask = 0x600E3,
        .note = (note << 8) | cent,
        .volume.left = left * vol * 2,
        .volume.right = right * vol * 2,
        .sample_note = vag->shift | (vag->center << 8),
        .addr = &vab->p2[vab->offsets[vag->vag - 1]],
        .adsr1 = vag->adsr1,
        .adsr2 = vag->adsr2,
        .voice = mask,
    });

    temp_s1->active = 1;
    temp_s1->time = 1;
    temp_s1->vol = vol;
    temp_s1->pan = pan;
    temp_s1->epoch = (temp_s1->epoch + 0x20) & 0x7FE0;
    func_8001E22C(mask);
    return 0;
}

void func_8001F4F0(u32 mask)
{
    for (int i = 0; i < NCHANNELS; i++) {
        Channel *p = &channels[i];
        if (mask & (1 << i)) {
            p->active = 0;
            p->time = -1;
            p->unk2 = 0;
            p->unk6 = 2;
        }
    }
    func_8001E0CC(&(SpuVoiceAttr){
        .mask = 3,
        .volume.left = 0,
        .volume.right = 0,
        .voice = mask,
    });
    func_8001E22C(mask);
}

void func_8001F578(u32 mask)
{
    for (int i = 0; i < NCHANNELS; i++) {
        Channel *p = &channels[i];
        if (mask & (1 << i)) {
            p->active = 0;
            p->time = -1;
            p->unk2 = 0;
            p->unk6 = 2;
        }
    }
    func_8001E250(mask);
}

s32 func_8001F64C(u32 arg0, s32 arg1, s16 arg2, s16 arg3, u16 arg4, s32 prio);

void func_8001F5DC(int id)
{
    func_8001F64C(id, 0x3F, 100, 0, 0, -1);
}

void func_8001F610(int id, short pan, short vol)
{
    func_8001F64C(id, pan, vol, 0x3C, 0, -1);
}

//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F64C);
// FIXME: this is not entirely correct, even though it works
int func_8001F64C(u32 id, s32 pan, s16 vol, s16 arg3, u16 arg4, s32 prio) {
    u16 var_s2;

    u32 vab_idx = id >> 0x18;
    u32 prog_idx = (id >> 8) & 0x7F;
    u32 tone_idx = id & 0xF;

    if (vab_idx >= 4) return -1;
    VabFile *vp = &loaded_vabs[vab_idx];    
    if (vp->a == 0) return -1;    
    if (vp->b == 0) return -1;
    if (prog_idx > vp->nprogs) return -1;

    ProgAtr *prog = &vp->progs[prog_idx];
    u8 ntones = prog->tones;
    if ((tone_idx >= ntones) || (ntones == 0)) return -1;
                    
    int channel = -1;

    // TODO: is just a clamp
    if (prio == -1)
        prio = prog->attr;
    else if (prio < 0)
        prio = 0;
    else if (prio > 2)
        prio = 2;        

    // look for an empty
    for (int i = 0; i < NCHANNELS; i++) {
        if (channels[i].active == 0) {
            channel = i;
            goto found;
        }
    }

    // didn't find an empty one. free the oldest effect of lower priority
    u16 max = 0;
    int max_index = -1;              
    // search through different levels (of priority?)
    for (int i = 2; (i >= (prio & 0xFFFF)) && (i != 0); i--) {
        // find the effect that's been playing the longest
        for (int j = 0; j < NCHANNELS; j++) {
            if (channels[j].unk6 != i) continue;
            u16 val = channels[j].time;
            if (max < val) {
                max = val;
                max_index = j;
            }
        }

        if (max_index == -1) continue;        
        channel = max_index;
        goto found;
    }

    // FIXME: this is uninitialized
    if (!(var_s2 & 0xFFFF)) return -1;                                    

    // screw it, look for anything
    for (int i = 0; i < NCHANNELS; i++) {
        if ((u8) channels[i].unk6 != 0) {
            channel = i;
            goto found;
        }
    }

    // can't add anywhere :(
    return -1;

found:
    if ((play(channel, vab_idx, prog_idx, tone_idx, pan, vol, arg3, arg4)) < 0)
        return -1;

    // TODO: this is confusing. is it correct??
    D_800521E0[channel] = prio;
    return channel | channels[channel].epoch;    
}


// TODO: "handle" macros
void func_8001F8D4(u32 handle)
{
    if (sfx_is_valid(handle) == -1) return;
    func_8001F4F0(1 << (handle & 0x1F));
}

void func_8001F918(u32 handle)
{
    if (sfx_is_valid(handle) == -1) return;
    func_8001F578(1 << (handle & 0x1F));
}

int sfx_set_pan(u32 handle, u16 pan)
{
    return func_8001F9EC(handle, pan, channels[handle & 0x1F].vol);
}

int sfx_set_vol(u32 handle, u16 vol)
{
    return func_8001F9EC(handle, channels[handle & 0x1F].pan, vol);
}

// private function for the two above
// static
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F9EC);

// TODO: these types are all messed up
int sfx_get_pan(uint handle)
{
    return channels[handle & 0x1F].pan;
}

int sfx_get_vol(uint handle)
{
    return channels[handle & 0x1F].vol;
}

int sfx_is_valid(u32 handle)
{
    if (channels[handle & 0x1F].active != 1) return handle;
    if (channels[handle & 0x1F].epoch == (handle & 0x7FE0)) return handle;
    return -1;
}

int func_8001FBC0(int val)
{
    int ret = D_80047E10;
    D_80047E10 = val;
    D_80047E14 = 1;
    return ret;
}

void func_8001FBE4(void)
{
    if (D_80047E14 == 1 && D_80047E10 == 1) {
        SpuSetReverb(1);
        D_80047E14 = 0;
    }
}

int sfx_is_active(u32 handle)
{
    return channels[handle & 0x1F].active == 1;
}
