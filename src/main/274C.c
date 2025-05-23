#include "common.h"
#include <kernel.h>
#include <libapi.h>
#include <libetc.h>
#include "cd/cd.h"
#include "music.h"
#include "main.h"
#include "tasks.h"
#include "spu.h"
#include "sfx.h"
#include "decode.h"
#include "sound.h"

s32 is_mono = 0;
CdlFILE D_80048068;
CdlLOC cdda_loc;

// regular task vars, they're in the assembly
extern s32 D_80047D78;
extern SpuVolume D_80047D8C;
s32 D_80047EA4;
s32 D_80047EAC;
s32 D_80047F24 = 0;

SpuVolume vol_full;

void cd_demute(void);

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
void cd_set_vol(SpuVolume *vol) {
    set_vol_scaled(vol, VOL_FULL);
    vol_full = *vol;
}

int D_800548EC;
extern int fade_out_active;
extern int fading_out;
extern int fade_in_active;
extern int fading_in;
extern s32 fade_in_step;
extern s32 fade_out_step;
extern s32 fade_out_dest;
extern s32 fade_in_dest;

s32 vol_scale = VOL_FULL;
int fade_paused = 0;
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

    cd_command(SNQ_FADE_OUT, 1, 0);
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

    cd_command(SNQ_FADE_IN, 1, 0);
    return 1;
}

void cd_fade_stop(void)
{
    cd_command(0xFA, 0, 0);
    cd_command(0xFB, 0, 0);
    cd_flush();
    fade_paused = 0;
}

// and then these functinos actually use those 4 to do stuff
u8 D_80047DA0[8] = { 8, 0, 0, 0, 0, 0, 0, 0 };
int D_80047DE4 = 1;
int D_80047DE8 = 0;
int D_80047EEC; // SpuVolume ptr?

int func_8001B94C(void)
{
    int ret;

    D_80047F24 = 3;
    D_800548EC = 0;
    ret = 0;
    if (music_state != 3) {
        cd_pause();
        cd_command(0xE, &D_80047DA0, 0);
        cd_mute();
        cd_command(0xFC, &D_80047D8C, 0);
        cd_command(0xFE, 3, 0);
        ret = cd_flush();
    }
    return ret;
}

extern s32 cd_queue_is_empty;
extern u8 D_80047D94;
extern s32 D_80047DE0;

// TODO: make an enum for these flags
// cd_flags
u32 cd_status(void)
{
    u32 ret = 0;
    if (D_80047DE0 == 1)
        ret |= 0x80000000;
    ret |= (music_state & 0x7F) << 24;
    ret |= D_80047D94 << 16;
    if (fade_out_active == 1 || fade_in_active == 1)
        ret |= 0x8000;
    if (fading_out == 1 || fading_in == 1)
        ret |= 0x4000;
    if (cd_queue_is_empty == 1)
        ret |= 0x2000;
    if (D_800548EC == 1)
        ret |= 0x1000;
    if (func_8001CE18() == 1)
        ret |= 0x0800;
    ret |= cd_last_status;
    return ret;
}

void music_stop(void)
{
    D_800548EC = 0;
    cd_command(0xFE, 0, 0);
    cd_pause();
    cd_flush();
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
    cd_flush();
    call_DrawSync(0);
    cd_demute();
    cd_command(CdlPause, 0, 0);
    cd_command(0xFE, 4, 0);
    cd_flush();
    int rc = play_movie_str(filename, args, cb);
    cd_set_stereo(is_mono);
    SpuVolume vol;
    cd_get_vol(&vol);
    cd_set_vol(&vol);
    cd_command(0xF9, D_80047EA4, 0);
    cd_command(0xFE, 0, 0);
    cd_flush();
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

// guard, just like call_ResetGraph
int D_80047E0C = 0;  // is mdec initialized?
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

// music.c

int D_80047E4C = 0;          // music should repeat?
MusicList *D_80047E50 = NULL;   // bgm_list_ptr
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


// misc

void execute_compressed(void *addr, u32 stack)
{
    EXEC header;
    __builtin_memcpy(&header, addr+16, 0x3c);
    printf("copied header.\n");
    decode_lz1(addr + 0x804, (void*) header.t_addr);
    printf("decompressed.\n");
    header.s_addr = stack;
    flush_cache_safe();
    printf("flushed. exec...\n");
    Exec(&header, 1, 0);
}

// card.h
extern int (*_mc_callback_b)();
int mc_file_read(long mtidx, char *filename, void *dst, int offset, int len);
int mc_file_write(long mtidx, char *filename, void *src, int offset, int len, char *title);
int mc_file_create(); // TODO: complete signature
int mc_file_delete(uint mtidx, char *filename);
void mc_set_callback_b(void (*fn)(void));

void misc_init(void)
{
    _mc_callback_b = 0;  // WHY DO YOU ACCESS THIS FROM HERE AAAA
    jt_set(sfx_load_vab, 0x300);
    jt_set(sfx_free_vab, 0x301);
    jt_set(snd_set_stereo, 0x302);
    jt_set(snd_get_stereo, 0x303);
    jt_set(sfx_kill_all, 0x304);
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
    jt_set(mc_file_read, 0x340);
    jt_set(mc_file_write, 0x341);
    jt_set(mc_file_create, 0x342);
    jt_set(mc_file_delete, 0x343);
    jt_set(mc_set_callback_b, 0x344);     // THERE ARE TWO CALLBACKS WTF
}