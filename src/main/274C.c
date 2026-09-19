#include "cd/priv.h"
#include "libcd.h"
#include "sfx.h"
#include "spu.h"
#include "tasks.h"
#include <libetc.h>

/* US:80047F24 */ s32 D_80047F24 = 0;
/* US:80048068 */ CdlFILE D_80048068;

SpuVolume vol_full;

#define VOL_FULL 1024

// 8001A8A0
void set_vol_scaled(SpuVolume *vol, s32 scale)
{
    SpuCommonAttr attr;
    CLAMP(0, VOL_FULL, scale);
    attr.mask = SPU_COMMON_CDVOLL | SPU_COMMON_CDVOLR;
    attr.cd.volume.left = (vol->left * scale) / 1024;
    attr.cd.volume.right = (vol->right * scale) / 1024;
    SpuSetCommonAttr(&attr);
}

// this one ignores fading effects
// 8001A934
void cd_set_vol(SpuVolume *vol)
{
    set_vol_scaled(vol, VOL_FULL);
    vol_full = *vol;
}

int D_800548EC;

extern s32 fade_in_step;
extern s32 fade_out_step;
extern s32 fade_out_dest;
extern s32 fade_in_dest;

/* US: JP: */ s32 vol_scale = VOL_FULL;
/* US:80047ED4 JP: */ int fade_paused = 0;
/* US:80047EFC JP: */ s32 fade_out_task = 0;
/* US:80047F04 JP: */ s32 fade_in_task = 0;
/* US:80047F0C JP: */ int (*fade_out_callback)() = 0;
/* US:80047F14 JP: */ int (*fade_in_callback)() = 0;

// 8001A978
void fade_out_routine(void)
{
    if (fade_paused || !fading_out)
        return;
    if (vol_scale > fade_out_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale -= fade_out_step;
    } else {
        tasks_remove_reserved(fade_out_task);
        vol_scale = fade_out_dest;
        fading_out = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_out_callback != 0)
            (*fade_out_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

// 8001AA80
void fade_in_routine(void)
{
    if (fade_paused || !fading_in)
        return;
    if (vol_scale < fade_in_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale += fade_in_step;
    } else {
        tasks_remove_reserved(fade_in_task);
        vol_scale = fade_in_dest;
        fading_in = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_in_callback != 0)
            (*fade_in_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

// US: 8001AB88
// JP: 80019FC4
s32 fade_out(s32 duration, s32 dstvol, void *callback)
{
    if (fade_out_active == 1)
        return 0;

#ifdef VERSION_WORLD
    if (MODE_PAL == get_video_mode()) {
        duration = (duration * 5) / 6 - 1;
    }
#endif

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

// US: 8001AD0C
// JP: 8001A0C4
int fade_in(s32 duration, s32 dstvol, void *callback)
{
    if (fade_in_active == 1)
        return 0;

#ifdef VERSION_WORLD
    if (MODE_PAL == get_video_mode()) {
        duration = (duration * 5) / 6 - 1;
        // if (duration < 1) duration = 1;
    }
#endif

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

// 8001AE90
void cd_fade_stop(void)
{
    cd_command(0xFA, 0, 0);
    cd_command(0xFB, 0, 0);
    cd_flush();
    fade_paused = 0;
}
