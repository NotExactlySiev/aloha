#include "common.h"
#include <kernel.h>
#include <libapi.h>
#include <libspu.h>
#include <libetc.h>
#include "cd/cd.h"
#include "music.h"
#include "main.h"
#include "tasks.h"
#include "spu.h"
#include "sfx.h"
#include "decode.h"

s32 is_mono = 0;
CdlFILE D_80048068;
CdlLOC cdda_loc;

// regular task vars, they're in the assembly
extern s32 D_80047D78;
extern SpuVolume D_80047D8C;
s32 D_80047EA4;
s32 D_80047EAC;
s32 D_80047F24;


SpuVolume vol_full;


void cd_ready_callback(s32 status, u32 *result);
s32 sndqueue_add(u8 arg0, u32 arg1, u32 arg2);
void func_8001C374(void);

// functions

// module cd_

#define VOL_FULL    1024

#define CLAMP(a,b,x)    { if (x < a) x = a; if (x > b) x = b; }


// TODO: the multiplications here have the weird if statements
void set_vol_scaled(SpuVolume *vol, s32 scale)
{
    SpuCommonAttr attr;
    CLAMP(0, VOL_FULL, scale);
    attr.mask = SPU_COMMON_CDVOLL | SPU_COMMON_CDVOLR;
    attr.cd.volume.left = (vol->left * scale) >> 10;
    attr.cd.volume.right = (vol->right * scale) >> 10;
    SpuSetCommonAttr(&attr);
}

// this one ignores fading effects
void set_vol_full(SpuVolume *vol) {
    set_vol_scaled(vol, VOL_FULL);
    vol_full = *vol;
}

extern s32 D_800548EC;
extern s32 fade_out_active;
extern s32 fading_out;
extern s32 fade_in_active;
extern s32 fading_in;
extern s32 fade_in_step;
extern s32 fade_out_step;
extern s32 fade_out_dest;
extern s32 fade_in_dest;

s32 vol_scale = VOL_FULL;
s32 fade_paused = 0;
s32 fade_out_task = 0;
s32 fade_in_task = 0;
int (*fade_out_callback)() = 0;
int (*fade_in_callback)() = 0;

void fade_out_routine(void)
{
    if (fade_paused || !fading_out) return;
    if (vol_scale > fade_out_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale -= fade_out_step;
    } else {
        tasks_remove_reserved(fade_out_task);
        vol_scale = fade_out_dest;
        fading_out = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_out_callback != 0) (*fade_out_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

void fade_in_routine(void)
{
    if (fade_paused || !fading_in) return;
    if (vol_scale < fade_in_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale += fade_in_step;
    } else {
        tasks_remove_reserved(fade_in_task);
        vol_scale = fade_in_dest;
        fading_in = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_in_callback != 0) (*fade_in_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

s32 fade_out(s32 duration, s32 dstvol, void* callback)
{
    if (fade_out_active == 1) return 0;

    if (MODE_PAL == get_video_mode()) {
        duration = (duration * 5) / 6 - 1;
    }
    fade_out_active = 1;
    CLAMP(1, 1024, duration);
    CLAMP(0, VOL_FULL, dstvol);
    fade_out_step = VOL_FULL / duration;
    fade_in_dest = dstvol;
    fade_out_callback = callback;
    fade_out_task = tasks_add_reserved(fade_out_routine, 1);
    if (fade_out_task < 0) {
        fade_out_active = 0;
        fade_in_active = 0;
        return 0;
    }

    sndqueue_add_try(SNQ_FADE_OUT, 1, 0);
    return 1;
}

s32 fade_in(s32 duration, s32 dstvol, void* callback)
{
    if (fade_in_active == 1) return 0;

    if (MODE_PAL == get_video_mode()) {
        duration = (duration * 5) / 6 - 1;
        //if (duration < 1) duration = 1;
    }
    fade_in_active = 1;
    CLAMP(1, 1024, duration);
    CLAMP(0, VOL_FULL, dstvol);
    fade_in_step = VOL_FULL / duration;
    fade_in_dest = dstvol;
    fade_in_callback = callback;
    fade_in_task = tasks_add_reserved(fade_in_routine, 1);
    if (fade_in_task < 0) {
        fade_out_active = 0;
        fade_in_active = 0;
        return 0;
    }

    sndqueue_add_try(SNQ_FADE_IN, 1, 0);
    return 1;
}

void func_8001AE90(void)
{
    sndqueue_add_try(0xFA, 0, 0);
    sndqueue_add_try(0xFB, 0, 0);
    sndqueue_exec_all();
    fade_paused = 0;
}

// and then these functinos actually use those 4 to do stuff
u8 D_80047DA0[8] = { 8, 0, 0, 0, 0, 0, 0, 0 };
int D_80047DE4 = 1;
int D_80047DE8 = 0;
int D_80047EEC; // SpuVolume ptr?
extern CdlFILTER D_80047ECC;
extern int D_8004D0E0;

int func_8001B94C(void)
{
    int ret;

    D_80047F24 = 3;
    D_800548EC = 0;
    ret = 0;
    if (fe_value != 3) {
        func_8001C2F4();
        sndqueue_add_try(0xE, &D_80047DA0, 0);
        func_8001C34C();
        sndqueue_add_try(0xFC, &D_80047D8C, 0);
        sndqueue_add_try(0xFE, 3, 0);
        ret = sndqueue_exec_all();
    }
    return ret;
}

extern s32 _sndqueue_empty;
extern u8 D_80047D94;
extern s32 D_80047DE0;
extern u8 cd_status;

// TODO: make an enum for these flags
// cd_flags
u32 func_8001D13C(void)
{
    u32 ret = 0;
    if (D_80047DE0 == 1)
        ret |= 0x80000000;
    ret |= (fe_value & 0x7F) << 24;
    ret |= D_80047D94 << 16;
    if (fade_out_active == 1 || fade_in_active == 1)
        ret |= 0x8000;
    if (fading_out == 1 || fading_in == 1)
        ret |= 0x4000;
    if (_sndqueue_empty == 1)
        ret |= 0x2000;
    if (D_800548EC == 1)
        ret |= 0x1000;
    if (func_8001CE18() == 1)
        ret |= 0x0800;
    ret |= cd_status;
    return ret;
}

void func_8001D248(void)
{
    D_800548EC = 0;
    sndqueue_add_try(0xFE, 0, 0);
    func_8001C2F4();
    sndqueue_exec_all();
}

void fade_pause(void)
{
    fade_paused = 1;
}

void fade_unpause(void)
{
    fade_paused = 0;
}

#include "movie.h"
// FIXME: the world 1 intro movie doesn't play correctly
int play_movie(char *filename, MovieArgs *args, int (*cb)(void))
{
    func_8001D104();
    func_8001A77C();
    sndqueue_exec_all();
    call_DrawSync(0);
    func_8001C374();
    sndqueue_add_try(CdlPause, 0, 0);
    sndqueue_add_try(0xFE, 4, 0);
    sndqueue_exec_all();
    int rc = play_movie_str(filename, args, cb);
    set_mono(is_mono);
    SpuVolume vol;
    func_8001CD0C(&vol);
    set_vol_full(&vol);
    sndqueue_add_try(0xF9, D_80047EA4, 0);
    sndqueue_add_try(0xFE, 0, 0);
    sndqueue_exec_all();
    func_8001A380();
    return rc;
}

// end of cd_ stuff

u32 call_PadRead(s32 id);

void pad_init(void)
{
    PadInit(0);
    jt_set(call_PadRead, 0xf0);
}

u32 call_PadRead(s32 id)
{
    return PadRead(id);
}

extern int D_80047E0C;  // is mdec initialized?
void func_8001E608(int mode)
{
    if (mode == 0) {
        if (D_80047E0C == 0) {
            D_80047E0C = 1;
        } else {
            mode = 0;
        }
    }
    DecDCTReset(mode);
}

// trivial or easy functions related to audio
int sfx_free_vab(s16 idx)
{
    return func_8001EFAC(idx);
}

extern int D_80047E20;

int snd_set_stereo(int mono)
{
    int ret = D_80047E20;
    set_mono(mono);
    func_8001DF78(mono);
    D_80047E20 = mono;
    return ret;
}

int snd_get_stereo(void)
{
    return D_80047E20;
}

void func_80020E40(void)
{
    sfx_kill_voices(SPU_ALLCH);
}

void func_80020E64(void)
{
    sfx_release_voices(SPU_ALLCH);
}

// FIXME: the pan appears to be... backwards? sfx issue?
extern short D_80047E24;
extern short D_80047E26;
extern int D_80047E48;

void snd_set_vol_to_min(void)
{
    D_80047E26 = 0;
    func_80020EF0(0, 0);
}

void snd_set_vol_to_max(void)
{
    D_80047E26 = D_80047E24;
    func_80020EF0(D_80047E24, D_80047E48);
}

// set_master_volume
void func_80020EF0(short arg0, short arg1)
{
    short val = (arg0 * arg1) / 1024;
    call_SpuSetCommonAttr(&(SpuCommonAttr) {
        .mask = SPU_COMMON_MVOLL | SPU_COMMON_MVOLR,
        .mvol.left = val,
        .mvol.right = val,
    });
}

int snd_set_volume(short val)
{
    short old = D_80047E24;
    D_80047E24 = val;
    D_80047E26 = val;
    func_80020EF0(val, D_80047E48);
    return old;
}

void snd_set_reverb(long mode, short depth)
{
    func_8001DF14(mode, depth);
}

// music.c

extern int D_80047E4C;          // music should repeat?
extern MusicList *D_80047E50;   // bgm_list_ptr
// audio_list_set_ptr
void music_set_list(MusicList *val)
{
    D_80047E50 = val;
}

// static
MusicTrack *get_track_by_id(u8 id)
{
    u16 count = D_80047E50->count;
    MusicTrack *p = &D_80047E50->tracks[0];
    while (count--) {
        if (p->id == id)
            return p;
        p = &p->name[p->size - 22];  // why is the next one there?
    }
    return NULL;
}

int music_play(u8 id)
{
    if (D_80047E50 == NULL)
        return 0;

    MusicTrack *t = get_track_by_id(id);
    if (t == NULL)
        return 0;
    
    switch (t->type) {
    case MUSIC_TYPE_CDDA:
        music_play_cdda(t->file, D_80047E4C);
        return 1;

    case MUSIC_TYPE_STR:
        music_play_str(t->name, t->file, t->chan, &t->loc, t->loc.track, D_80047E4C);
        return 1;

    default:
        return 0;
    }
}

//
void music_set_repeat(int val)
{
    D_80047E4C = val;
}

// volume tween stuff 
NOT_IMPL(func_800210E4) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210E4);
NOT_IMPL(func_800211F0) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_800211F0);

extern int D_80047E54;
void snd_fade_pause(void)
{
    D_80047E54 = 1;
}

void snd_fade_unpause(void)
{
    D_80047E54 = 0;
}

// TODO: these are required
NOT_IMPL(snd_fade_out) //INCLUDE_ASM("asm/main/nonmatchings/274C", snd_fade_out);
NOT_IMPL(snd_fade_in) //INCLUDE_ASM("asm/main/nonmatchings/274C", snd_fade_in);

extern int D_80047E28;
extern int D_80047E30;

extern int D_8004800C;
extern int D_80047E34;
extern int D_80048004;
extern int D_80047E2C;
// defult sound
//INCLUDE_ASM("asm/main/nonmatchings/274C", snd_reset);
void snd_reset(void)
{
    sfx_set_reverb(0);
    func_8001CD30(0);
    func_80020E40();
    func_8001CEA0();
    func_8001C2F4();
    func_8001D248();
    func_8001AE90();
    sndqueue_exec_all();
    func_8001C34C();
    snd_set_vol_to_min();
    func_80020E64();
    D_80047E54 = 0;
    if (D_80047E30 == 1) {
        tasks_remove_reserved(D_80047E34);
        D_8004800C = 0;
        D_80047E34 = -1;
    }
    if (D_80047E28 == 1) {
        tasks_remove_reserved(D_80047E2C);
        D_80048004 = 0;
        D_80047E2C = -1;
    }
    D_80047E28 = 0;
    D_80047E30 = 0;
    snd_set_vol_to_max();
    D_80047E48 = 1024;
    func_80020EF0(D_80047E26, D_80047E48);

    SpuVolume vol;
    func_8001CD0C(&vol);
    set_vol_full(&vol);
    sndqueue_exec_all();
}


// audio_flags
u32 snd_status(void)
{
    u32 ret = 0;
    u32 cd_flags = func_8001D13C();
    if (D_80047E30 == 1 || D_80047E28 == 1)
        ret |= 1 << 0;
    if (cd_flags & 0x1000)
        ret |= 1 << 3;
    if (cd_flags & 0x8000)
        ret |= 1 << 1;
    
    for (int i = 0; i < 24; i++) {
        if (sfx_is_active(i)) {
            ret |= 1 << 2;
            break;
        }
    }
    return ret;
}

void execute_compressed(void *addr, u32 stack)
{
    EXEC header;
    __builtin_memcpy(&header, addr+16, 0x3c);
    decode_lz1(addr + 0x804, (void*) header.t_addr);
    header.s_addr = stack;
    flush_cache_safe();
    Exec(&header, 1, 0);
}

// card.h
extern int (*_mc_callback)();
int func_800218DC(long mtidx, char *filename, void *dst, int offset, int len);
int func_800219DC(long mtidx, char *filename, void *src, int offset, int len, char *title);
int func_80021BCC(); // TODO: complete signature
int func_80021D08(uint mtidx, char *filename);
void mc_set_callback(void (*fn)(void));

void misc_init(void)
{
    _mc_callback = 0;  // WHY DO YOU ACCESS THIS FROM HERE AAAA
    jt_set(sfx_load_vab, 0x300);
    jt_set(sfx_free_vab, 0x301);
    jt_set(snd_set_stereo, 0x302);
    jt_set(snd_get_stereo, 0x303);
    jt_set(func_80020E40, 0x304);
    jt_set(snd_set_volume, 0x305);
    jt_set(snd_set_reverb, 0x307);
    jt_set(snd_set_vol_to_min, 0x308);
    jt_set(snd_set_vol_to_max, 0x309);
    jt_set(snd_fade_out, 0x30A);
    jt_set(snd_fade_in, 0x30B);
    jt_set(snd_status, 0x30C);
    jt_set(snd_fade_pause, 0x30D);
    jt_set(snd_fade_unpause, 0x30E);
    jt_set(snd_reset, 0x30F);
    jt_set(execute_compressed, 0x320);
    jt_set(music_set_list, 0x330);
    jt_set(music_play, 0x331);
    jt_set(music_set_repeat, 0x332);
    jt_set(func_800218DC, 0x340);
    jt_set(func_800219DC, 0x341);
    jt_set(func_80021BCC, 0x342);
    jt_set(func_80021D08, 0x343);
    jt_set(mc_set_callback, 0x344);
}