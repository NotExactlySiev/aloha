#include "sound.h"
#include "include_asm.h"
#include "math.h"
#include "shared.h"
#include <libspu.h>

// TODO: Make these all static when module is fully decompiled.

SpuVolume D_801026CC = {
    .left = 0x7fff,
    .right = 0x7fff,
};

/* US:80102904 JP: */ short D_80102904;
/* US:8010290C JP: */ int D_8010290C; // sfx_queue_count
/* US:80102914 JP: */ int D_80102914 = 0;
/* US:8010291C JP: */ int D_8010291C = 0;
/* US:80102924 JP: */ int D_80102924 = 0;
/* US:8010292C JP: */ SpuVolume D_8010292C = { 0 };
/* US:80102934 JP: */ int D_80102934 = 0;
/* US:8010293C JP: */ int D_8010293C = 0;

#define NCHANNELS 24

typedef struct {
    s16 id;
    u16 vol;
    u16 pan;
    u16 prio;
    int *handle;
} Channel;

extern Channel D_80106DA8[NCHANNELS];

void func_800CE098(int a, int b)
{
    u32 part = (D_80102904 + ((a & 0xf0) >> 4));
    jt.sfx_set_prog_attr((part << 24) | (a & 0xff0f), b);
}

void func_800CE0E4(int v)
{
    D_8010291C = v & 1;
}

int func_800CE0F8(void)
{
    return D_8010291C;
}

void func_800CE108(void)
{
    D_8010290C = 0;
    func_800CE098(0x1700, 2);
    func_800CE098(0x900, 2);
    func_800CE098(0x1500, 2);
    func_800CE098(0x4d11, 2);
}

void func_800CE158(int v)
{
    D_80102914 = v;
}

INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CE168);

void func_800CE2E0(short a, int vol, short pan, int *p)
{
    func_800CE168(a, vol, pan, p, -1);
}

void func_800CE304(short a, int vol, short pan)
{
    func_800CE2E0(a, vol, pan, NULL);
}

void func_800CE324(int handle, int vol, int pan)
{
    if (handle < 0)
        return;

    if (!(handle & 0x8000)) {
        jt.sfx_set_both(handle & 0x7fff, pan, vol);
    } else {
        int index = handle & 0x7fff;
        D_80106DA8[index].vol = vol;
        D_80106DA8[index].pan = pan;
    }
}

// sfx_is_valid
// Or perhaps sfx_validate_handle is a better name
int func_800CE3A8(int handle)
{
    if (handle < 0)
        return -1;

    if (!(handle & 0x8000))
        return jt.sfx_is_valid(handle);

    return handle;
}

void func_800CE3F4(int handle)
{
    if (handle < 0)
        return;

    // This sound effect is managed by the main executable.
    if (!(handle & 0x8000)) {
        jt.sfx_kill(handle);
        return;
    }

    // It's managed by us.
    handle &= 0x7fff;
    D_80106DA8[handle].handle = NULL;
    D_80106DA8[handle].id = -0x8000;
    D_80106DA8[handle].prio = 2;
}

void func_800CE484(void)
{
    if (D_80102904 >= 0 && D_8010291C) {
        for (int i = 0; i < D_8010290C; i++) {
            Channel *ch = &D_80106DA8[i];
            if (ch->id & 0x8000)
                continue;

            s16 note = 60;
            if (ch->id == 0x2f16) {
                note = 48;
            }

            int id = (D_80102904 + ((ch->id & 0xf0) >> 4)) << 24;
            id |= ch->id & 0xff0f;
            short handle = jt.sfx_play_modulated(id, ch->pan, ch->vol, note, 0, ch->prio);
            if (ch->handle) {
                *ch->handle = handle;
            }
        }
    }

    func_800CE108();
    D_8010292C.left = D_801026CC.left * D_80102934 / ONE;
    D_8010292C.right = D_801026CC.right * D_80102934 / ONE;
    jt.set_global_volume(&D_8010292C);
    jt.cd_run_block();
}

int func_800CE658(void)
{
    return D_80102934;
}

void func_800CE668(int v)
{
    D_80102934 = v;
    CLAMP(0, ONE, D_80102934);
}

void func_800CE69C(int v)
{
    D_8010293C = v;
}

void func_800CE6AC(void)
{
    D_80102934 += D_8010293C;
    CLAMP(0, ONE, D_80102934);
}

void func_800CE6FC(int v)
{
    jt.snd_set_reverb(5, v);
    jt.sfx_set_reverb(!!v);
}

void func_800CE77C(void)
{
    D_80102934 = 0x1000;
    D_8010293C = 0;
    D_80102914 = 1;
    D_8010291C = 1;
    D_80102924 = 0;
    func_800CE108();
    jt.sfx_kill_all();
    jt.snd_reset();
    jt.snd_set_vol_to_max();
}

void func_800CE820(void)
{
    D_80102904 = -1;
    jt.snd_set_reverb(5, 0x1000);
    jt.sfx_set_reverb(1);
    jt.set_global_volume(&D_801026CC);
    D_80102904 = 0;
    func_800CE77C();
}

void func_800CE8A8(void)
{
    jt.cd_pause();
}

void func_800CE8D8(int arg)
{
    if (arg) {
        if (!D_80102924) {
            jt.snd_fade_pause();
            jt.snd_set_vol_to_min();
            D_80102924 = 1;
        }
    } else {
        if (D_80102924) {
            jt.snd_set_vol_to_max();
            jt.snd_fade_unpause();
            D_80102924 = 0;
        }
    }
}

int func_800CE9A8(void)
{
    return D_80102924;
}

u32 func_800CE9B8(void)
{
    if (func_800CE9A8() != 0)
        return 0;

    u32 status = jt.snd_status();
    if (!(status & 8))
        return 0;

    return status & 1;
}

int func_800CEA14(void)
{
    return jt.snd_fade_out(0x30, 0, 0);
}

int func_800CEA48(void)
{
    return jt.snd_fade_in(0x30, 0x400, 0);
}

int func_800CEA7C(int v)
{
    return jt.snd_set_stereo(v);
}

int func_800CEAAC(void)
{
    return jt.snd_get_stereo();
}

void func_800CEADC(int id, int repeat)
{
    jt.music_set_repeat(repeat);
    jt.music_play(id);
}

int func_800CEB2C(void)
{
    return (jt.snd_status() & 8) != 0;
}

// calculate_sound_pan
INCLUDE_ASM("asm/jm1/nonmatchings/173B4", func_800CEB6C);

// calculate_sound_volume
int func_800CEC30(int val, int x, int y, int z)
{
    SVECTOR *camera_pos = SCRTCHPAD(0x3C8);
    int distance = SquareRoot0(vector_mag2(
        x - camera_pos->vx,
        y - camera_pos->vy,
        z - camera_pos->vz
    ));
    distance -= 0x300;
    CLAMP(0, 4096, distance);
    return (val * (0x1000 - distance)) >> 12;
}

// end of sound.c
