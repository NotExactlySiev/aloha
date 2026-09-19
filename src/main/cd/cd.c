#include "../gpu.h"
#include "../movie.h"
#include "../tasks.h"
#include "priv.h"

/* US: 80047EA4 */ int D_80047EA4;

/* US: 80047E00 */ static int D_80047E00 = -1; // bgm regular task handle
/* US: 80047F44 */ static int bgm_counter;
/* US: 80047F4C */ static int bgm_target;
/* US: 80047F54 */ static int bgm_finished;

// INCLUDE_ASM("asm/main/nonmatchings/274C", cd_get_vol);
// TODO: the assembly for this is weird
// 8001CD0C
void cd_get_vol(SpuVolume *out)
{
    *out = vol_full;
}

// 8001CD30
s32 cd_set_reverb(s32 arg0)
{
    int ret = D_80047EA4;
    cd_command(SNQ_SET_REVERB, arg0, 0);
    return ret;
}

// 8001CD68
void cd_stop(void)
{
    cd_command(CdlStop, 0, 0);
}

// Unused
// 8001CD90
int func_8001CD90(void)
{
    int ret = music_state;
    cd_command(SNQ_SET_FE, 5, 0);
    return ret;
}

// Unused
// 8001CDC8
void func_8001CDC8(s32 arg0)
{
    cd_command(SNQ_SET_FE, arg0, 0);
}

// 8001CDF0
void cd_fade_wait(void)
{
    cd_command(SNQ_FUNC8, 0, 0);
}

// 8001CE18
int func_8001CE18(void)
{
    return bgm_finished;
}

// 8001CE28
void music_pause(void)
{
    cd_pause();
    cd_command(SNQ_SET_PAUSED, 1, 0);
}

// 8001CE58
void music_unpause(void)
{
    if (bgm_paused == 1) {
        cd_command(CdlReadS, 0, 0);
        cd_command(SNQ_SET_PAUSED, 0, 0);
    }
}

// 8001CEA0
void music_really_unpause(void)
{
    cd_command(SNQ_SET_PAUSED, 0, 0);
}

// music_tick
// 8001CEC8
void func_8001CEC8(void)
{
    if ((bgm_finished == 0) && (bgm_paused == 0))
        bgm_counter += 1;

    // printf("%d\t/ %d\n", bgm_counter, bgm_target);
    if (bgm_counter > bgm_target)
        bgm_finished = 1;
}

// CD MUSIC
// 8001CF38
NOT_IMPL_FN(func_8001CF38)

// 8001D0AC
void func_8001D0AC(int delay)
{
    bgm_counter = 0;
    bgm_finished = 0;
    bgm_target = delay;
    if (D_80047E00 < 0) {
        D_80047E00 = tasks_add_reserved(func_8001CEC8, 0);
    }
}

// 8001D104
void func_8001D104(void)
{
    if (D_80047E00 > -1) {
        tasks_remove_reserved(D_80047E00);
        D_80047E00 = -1;
    }
}

extern s32 cd_queue_is_empty;
extern u8 D_80047D94;
extern s32 D_80047DE0;

// TODO: make an enum for these flags
// cd_flags
// 8001D13C
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

// 8001D248
void music_stop(void)
{
    D_800548EC = 0;
    cd_command(0xFE, 0, 0);
    cd_pause();
    cd_flush();
}

// 8001D288
void fade_pause(void)
{
    fade_paused = 1;
}

// 8001D29C
void fade_unpause(void)
{
    fade_paused = 0;
}

// FIXME: the world 1 intro movie doesn't play correctly
// 8001D2AC
int play_movie(char *filename, MovieArgs *args, int (*cb)(void))
{
    func_8001D104();
    cd_check_disc_presence();
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
