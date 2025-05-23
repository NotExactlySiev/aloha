#include "common.h"
#include <libspu.h>
#include <libsnd.h>
#include "main.h"
#include "tasks.h"
#include "spu.h"
#include "sfx.h"

#define NCHANNELS   24

#define MAX_VABS    4
#define MAX_PROGS   512
#define MAX_TONES   256
#define MAX_VAGS    256

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

struct VabRealHeader {
    VabHdr header;
    ProgAtr progattrs[128];
    VagAtr toneattrs[][16];
};

typedef struct {
    VabHdr hdr;
    ProgAtr *progs;
    VagAtr  *tones;
    u32 p2;     // spu_addr
    u16 *offsets;
    u16 nprogs;
    u16 ntones;
    u16 nvags;
    char a;
    char b;
} VabFile;

static Channel channels[NCHANNELS];
static char D_800521E0[NCHANNELS];
static int tick_task;

static VabFile loaded_vabs[MAX_VABS];
static ProgAtr loaded_progs[MAX_PROGS];
static VagAtr loaded_tones[MAX_TONES];
static u16 loaded_offsets[MAX_VAGS];

static ProgAtr *vab_progs_next;
static VagAtr *vab_tones_next;
static u16 *vab_offsets_next;

static int vabs_count;
static int progs_count;
static int tones_count;
static int vags_count;

int D_80047E10 = 0;
int D_80047E14 = 1;

u8 D_80047F9C[4];

static void sfx_tick(void) {
    SpuGetAllKeysStatus(D_800521E0);
    u32 mask = 0;
    for (int i = 0; i < NCHANNELS; i++) {
        Channel *p = &channels[i];
        if (p->active != 1) {
            //printf("|    ");
            continue;
        }

        //printf("| %02d ", p->time);
        if ((u16) p->time < 0x7FFFU) {
            p->time++;
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
    //printf("\n");
    if (mask)
        sfx_release_voices(mask);
    //func_8001E2F4();    // is a nop
}

u32 sfx_get_mask(void)
{
    u32 ret = 0;
    for (int i = 0; i < NCHANNELS; i++) {
        if (channels[i].active)
            ret |= 1 << i;
    }
    return ret;
}

long call_SpuClearReverbWorkArea(long mode)
{
    return SpuClearReverbWorkArea(mode);
}

void sfx_init(void)
{
    vab_progs_next = &loaded_progs[0];
    vab_tones_next = &loaded_tones[0];
    vab_offsets_next = &loaded_offsets[0];
    tones_count = 0;
    progs_count = 0;
    vags_count = 0;
    vabs_count = 0;
    
    for (int i = 0; i < MAX_VABS; i++) {
        loaded_vabs[i].a = 0;
        loaded_vabs[i].b = 0;
    }
    
    for (int i = 0; i < NCHANNELS; i++) {
        channels[i].active = 0;
        channels[i].epoch = 0;
        channels[i].unk0 = 0;
    }

    jt_set(sfx_set_reverb, 0x306);  // deferred (why?)
    jt_set(sfx_play_simple, 0x310);
    jt_set(sfx_play, 0x311);
    jt_set(sfx_play_modulated, 0x312);
    jt_set(sfx_kill, 0x313);
    jt_set(sfx_set_pan, 0x314);
    jt_set(sfx_set_vol, 0x315);
    jt_set(sfx_set_both, 0x316);
    jt_set(sfx_get_pan, 0x317);
    jt_set(sfx_get_vol, 0x318);
    jt_set(sfx_is_valid, 0x319);
    jt_set(sfx_release, 0x31A);
    jt_set(sfx_set_prog_attr, 0x31B);
    jt_set(sfx_get_mask, 0x31C);
    jt_set(call_SpuClearReverbWorkArea, 0x31D); // oh wait this isn't private?
    tick_task = tasks_add_reserved(sfx_tick, 1);
}

static s16 load_metadata(VabRealHeader *arg, s16 idx) {
    // TODO: refactor this insanity
    u16 vagoff;
    u16 vcount;

    u16 nprogs;
    u16* vag_sizes;
    u8 ntones;
    ProgAtr *progattrs;

    u32 ui;

    if (idx == -1) {        
        for (int i = 0; i < MAX_VABS; i++) {
            if (loaded_vabs[i].a == 0) break;
            idx = i;
        }

        if (idx == -1)
            return -1;
    }

    if (idx >= MAX_VABS)
        return -1;

    if (loaded_vabs[idx].a == 1) return -1;
    if (arg->header.ps + progs_count >= MAX_PROGS) return -1;
    if (arg->header.ts + tones_count >= MAX_TONES) return -1;
    progattrs = arg->progattrs;
    if (arg->header.vs + vags_count >= MAX_VAGS) return -1;
    
    loaded_vabs[idx].hdr = arg->header;

    ui = arg->header.ps;
    loaded_vabs[idx].progs = vab_progs_next;
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
    progs_count += ui;

    loaded_vabs[idx].tones = vab_tones_next;
    loaded_vabs[idx].ntones = arg->header.ts;
    nprogs = arg->header.ps;
    tones_count += arg->header.ts;
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
    vags_count += vcount;
    vag_sizes = (u16*) arg->toneattrs[arg->header.ps];  // over tone attrs
    for (int i = 0; i < vcount; i++) {
        vagoff += vag_sizes[i];
        *vab_offsets_next++ = vagoff;
    }
    
    loaded_vabs[idx].a = 1;
    loaded_vabs[idx].b = 0;
    loaded_vabs[idx].hdr.fsize -= sizeof(VabRealHeader) 
                                + sizeof(VagAtr[16]) * arg->header.ps
                                + sizeof(u16[256]);
    D_80047F9C[vabs_count++] = idx;

    return idx;
}

// upload_vab
int func_8001EEA4(VabRealHeader *header, void *data, short idx)
{
    if (data == 0) {
        data = &header->toneattrs[header->header.ps];
        data += 512;    // past the sizes
    }
    VabFile *v = &loaded_vabs[idx];
    if (v->a == 0)  // not in the array
        return -2;
    if (v->b == 1)  // already uploaded
        return 1;
    
    u32 ptr = SpuMalloc(v->hdr.fsize);
    if (ptr == -1)
        return -1;
    v->p2 = ptr; // TODO: this field is the spu address
    call_SpuSetTransferStartAddr(ptr);
    call_SpuWrite(data, v->hdr.fsize);
    call_SpuIsTransferCompleted(1);
    v->b = 1;   // TODO: this field is is_uploaded
    return 0;

}

// free_vab
int func_8001EFAC(s16 idx)
{
    if (vabs_count == 0) return -1;
    if (idx == -1)
        idx = D_80047F9C[vabs_count-1];
    if (idx != D_80047F9C[vabs_count-1]) return -2; // huh?

    VabFile *v = &loaded_vabs[idx];
    if (v->a == 0) return -1;
    if (v->b == 1) {
        call_SpuFree((u32) v->p2);
        vags_count -= v->nvags;
        vab_offsets_next -= v->nvags;
    }
    vab_progs_next -= v->nprogs;
    progs_count -= v->nprogs;
    vabs_count -= 1;
    tones_count -= v->ntones;
    vab_tones_next -= v->ntones;
    v->a = 0;
    v->b = 0;
    return idx;
}

void sfx_set_prog_attr(u32 id, int attr)
{
        if (attr < 0)
            attr = 0;
        else if (attr > 2)
            attr = 2;
        
        u32 vab_idx = id >> 0x18;
        u32 prog_idx = (id >> 8) & 0x7F;

        if (vab_idx >= MAX_VABS) return;
        VabFile *vab = &loaded_vabs[vab_idx];
        
        if (vab->a == 0) return;
        if (prog_idx >= vab->nprogs) return;
        
        vab->progs[prog_idx].attr = attr;
}

// NOTE: I wouldn't bet my life on the correctness of this function. but it seems
// to be behaving just like the original as far as I can tell.
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
    u32 mask = 1 << channel;
    SpuSetReverbVoice(D_80047E10, mask);
    temp_s1->unk0 = D_80047E10;
    
    int right = pan > 64 ? 64 : pan;
    int left = pan > 64 ? 127 - pan : 64;

    set_voice_attr(&(SpuVoiceAttr) {
        .mask = 0x600E3,
        .note = (note << 8) | cent,
        .volume.left = left * vol * 2,
        .volume.right = right * vol * 2,
        .sample_note = vag->shift | (vag->center << 8),
        .addr = vab->p2 + 8 * vab->offsets[vag->vag - 1],
        .adsr1 = vag->adsr1,
        .adsr2 = vag->adsr2,
        .voice = mask,
    });

    temp_s1->active = 1;
    temp_s1->time = 1;
    temp_s1->vol = vol;
    temp_s1->pan = pan;
    temp_s1->epoch = (temp_s1->epoch + 0x20) & 0x7FE0;
    spu_set_key_on(mask);
    return 0;
}

void sfx_kill_voices(u32 mask)
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
    set_voice_attr(&(SpuVoiceAttr){
        .mask = 3,
        .volume.left = 0,
        .volume.right = 0,
        .voice = mask,
    });
    spu_set_key_on(mask);
}

void sfx_release_voices(u32 mask)
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
    spu_set_key_off(mask);
}

int sfx_play_modulated(u32 arg0, s32 arg1, s16 arg2, s16 arg3, u16 arg4, s32 prio);

void sfx_play_simple(int id)
{
    sfx_play_modulated(id, 0x3F, 100, 0, 0, -1);
}

void sfx_play(int id, short pan, short vol)
{
    sfx_play_modulated(id, pan, vol, 0x3C, 0, -1);
}

//INCLUDE_ASM("asm/main/nonmatchings/274C", sfx_play_modulated);
// FIXME: this is not entirely correct, even though it works
int sfx_play_modulated(u32 id, s32 pan, s16 vol, s16 arg3, u16 arg4, s32 prio) {
    u32 vab_idx = id >> 0x18;
    u32 prog_idx = (id >> 8) & 0x7F;
    u32 tone_idx = id & 0xF;

    if (vab_idx >= MAX_VABS) return -1;
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

    // FIXME: this is uninitialized. where did it come from?
    //if (!(var_s2 & 0xFFFF)) return -1;                                    

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
void sfx_kill(u32 handle)
{
    if (sfx_is_valid(handle) == -1) return;
    sfx_kill_voices(1 << (handle & 0x1F));
}

void sfx_release(u32 handle)
{
    if (sfx_is_valid(handle) == -1) return;
    sfx_release_voices(1 << (handle & 0x1F));
}

int sfx_set_pan(u32 handle, u16 pan)
{
    return sfx_set_both(handle, pan, channels[handle & 0x1F].vol);
}

int sfx_set_vol(u32 handle, u16 vol)
{
    return sfx_set_both(handle, channels[handle & 0x1F].pan, vol);
}

int sfx_set_both(u32 handle, u16 pan, u16 vol)
{
    int idx = handle & 0x1F;
    if (channels[idx].active == 0) return -1;
    if (channels[idx].epoch != (handle & 0x7FE0)) return -1;

    // why are these constants so weird
    const u16 MIDDLE = 126/2-1;

    if ((s16) pan < 0)
        pan = 0;
    if ((s16) pan > 126)
        pan = 126;

    s16 vol_ = vol;

    if (vol_ > 127)
        vol_ = 127;
    if (vol_ < -127)
        vol_ = -127;

    channels[idx].vol = vol_;
    channels[idx].pan = pan;

    u16 right = pan > MIDDLE ? MIDDLE : pan;
    u16 left = pan < MIDDLE ? MIDDLE : (126 - pan);
    
    set_voice_attr(&(SpuVoiceAttr){
        .voice = 1 << idx,
        .mask = 3,
        .volume = {
            .left = 2 * left * vol_,
            .right = 2 * right * vol_,
        },
    });

    return handle;
}

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

int sfx_set_reverb(int val)
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

int sfx_load_vab(short index, VabRealHeader *header, void *data)
{
    index = load_metadata(header, index);
    if (index == -1)
        return -1;

    return func_8001EEA4(header, data, index);
}