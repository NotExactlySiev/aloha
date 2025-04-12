#include "common.h"
#include "tasks.h"
#include "spu.h"
#include "sfx.h"
#include "sound.h"

static void set_volume(short arg0, short arg1);
int D_80047E20 = 0;

int snd_set_stereo(int mono)
{
    int ret = D_80047E20;
    cd_set_stereo(mono);
    spu_set_stereo(mono);
    D_80047E20 = mono;
    return ret;
}

int snd_get_stereo(void)
{
    return D_80047E20;
}

void sfx_kill_all(void)
{
    sfx_kill_voices(SPU_ALLCH);
}

void sfx_release_all(void)
{
    sfx_release_voices(SPU_ALLCH);
}

// FIXME: the pan appears to be... backwards? sfx issue?
static short D_80047E24 = 0x3000;
static short D_80047E26 = 0x3000;
static int fade_amount = 0x400;
static int fade_paused = 0;

static int fading_out = 0;
static int fade_out_task = -1;
static void (*fade_out_callback)(void);
static int fade_out_target = 0;
static int fade_out_step = 0;

static int fading_in = 0;
static int fade_in_task = -1;
static void (*fade_in_callback)(void);
static int fade_in_target = 0x400;
static int fade_in_step = 0;


void snd_set_vol_to_min(void)
{
    D_80047E26 = 0;
    set_volume(0, 0);
}

void snd_set_vol_to_max(void)
{
    D_80047E26 = D_80047E24;
    set_volume(D_80047E24, fade_amount);
}

static void set_volume(short arg0, short arg1)
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
    set_volume(val, fade_amount);
    return old;
}

void snd_set_reverb(long mode, short depth)
{
    func_8001DF14(mode, depth);
}

static void fade_out_tick(void)
{
    if (fade_paused != 0 || fading_out != 1)
        return;
    
    if (fade_amount > fade_out_target) {
        set_volume(D_80047E26, fade_amount);
        fade_amount -= fade_out_step;
    } else {
        tasks_remove_reserved(fade_out_task);
        fade_out_task = -1;
        fade_amount = fade_out_target;
        fading_out = 0;
        fading_in = 0;
        if (fade_out_callback)
            (*fade_out_callback)();
        fade_out_callback = 0;
        set_volume(D_80047E26, fade_amount);
    }
}

static void fade_in_tick(void)
{
    if (fade_paused != 0 || fading_in != 1)
        return;
    
    if (fade_amount < fade_in_target) {
        set_volume(D_80047E26, fade_amount);
        fade_amount += fade_in_step;
    } else {
        tasks_remove_reserved(fade_in_task);
        fade_in_task = -1;
        fade_amount = fade_in_target;
        fading_in = 0;
        fading_out = 0;
        if (fade_in_callback)
            (*fade_in_callback)();
        fade_in_callback = 0;
        set_volume(D_80047E26, fade_amount);
    }
}

void snd_fade_pause(void)
{
    fade_paused = 1;
}

void snd_fade_unpause(void)
{
    fade_paused = 0;
}

int snd_fade_out(int step, int target, void *cb)
{
    if (fading_out == 1)
        return 0;
    
    if (fading_in == 1) {
        tasks_remove_reserved(fade_in_task);
        fade_in_task = -1;
        fading_in = 0;
        if (fade_in_callback)
            (*fade_in_callback)();
        fade_in_callback = 0;
    }

    step = step < 1 ? 1 : step;
    step = step > 0x400 ? 0x400 : step;
    target = target < 0 ? 0 : target;
    target = target > 0x400 ? 0x400 : target;
    fade_out_step = 0x400 / step;  // this isn't step... it's duration!
    fade_out_target = target;
    fade_out_callback = cb;
    fade_out_task = tasks_add_reserved(fade_out_tick, 1);
    if (fade_out_task < 0) {
        fade_out_task = -1;
        fading_out = 0;
        return 0;
    }

    fading_out = 1;
    return 1;
}

int snd_fade_in(int step, int target, void *cb)
{
    if (fading_in == 1)
        return 0;
    
    if (fading_out == 1) {
        tasks_remove_reserved(fade_out_task);
        fade_out_task = -1;
        fading_out = 0;
        if (fade_out_callback)
            (*fade_out_callback)();
        fade_out_callback = 0;
    }

    step = step < 1 ? 1 : step;
    step = step > 0x400 ? 0x400 : step;
    target = target < 0 ? 0 : target;
    target = target > 0x400 ? 0x400 : target;
    fade_in_step = 0x400 / step;  // this isn't step... it's duration!
    fade_in_target = target;
    fade_in_callback = cb;
    fade_in_task = tasks_add_reserved(fade_in_tick, 1);
    if (fade_in_task < 0) {
        fade_in_task = -1;
        fading_in = 0;
        return 0;
    }

    fading_in = 1;
    return 1;
}

void snd_reset(void)
{
    sfx_set_reverb(0);
    cd_set_reverb(0);
    sfx_kill_all();
    music_really_unpause();
    cd_pause();
    music_stop();
    cd_fade_stop();
    cd_flush();
    cd_mute();
    snd_set_vol_to_min();
    sfx_release_all();
    fade_paused = 0;
    if (fading_in == 1) {
        tasks_remove_reserved(fade_in_task);
        fade_in_callback = 0;
        fade_in_task = -1;
    }
    if (fading_out == 1) {
        tasks_remove_reserved(fade_out_task);
        fade_out_callback = 0;
        fade_out_task = -1;
    }
    fading_out = 0;
    fading_in = 0;
    snd_set_vol_to_max();
    fade_amount = 1024;
    set_volume(D_80047E26, fade_amount);

    SpuVolume vol;
    cd_get_vol(&vol);
    cd_set_vol(&vol);
    cd_flush();
}

u32 snd_status(void)
{
    u32 ret = 0;
    u32 cd_flags = cd_status();
    if (fading_in == 1 || fading_out == 1)
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