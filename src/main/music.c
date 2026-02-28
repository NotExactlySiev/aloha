#include "music.h"
#include "common.h"
#include <libspu.h>
#include <libetc.h>
#include "cd/cd.h"

extern SpuVolume D_80047D8C;
extern SpuVolume vol_full;
extern s32 D_80047F24;
extern s32 is_mono;
extern s32 D_800548EC;
extern s32 D_80047D78;
extern s32 D_80047EA4;

static s32 D_80047EAC;

int D_80047DE4 = 1;
int D_80047DE8 = 0;
int D_80047EEC; // SpuVolume ptr?
CdlLOC cdda_loc;
CdlFILTER D_80047ECC;
CdlFILE D_8004D0E0;
int music_state;
int D_80047E00 = -1;  // bgm regular task handle
static int bgm_counter;
static int bgm_target;
static int bgm_finished;

void music_really_unpause(void);

// 8001B9D8
NOT_IMPL_FN(func_8001B9D8);    // CD MUSIC
/*
void func_8001B9D8(void)
{
    func_8001D104();
    if (music_state == 3) {
        func_8001A380();
    }
    cd_pause();
    cd_command(0xFE, 1, 0);
    D_80047DE8 = 0;
    D_80047F24 = 1;
    D_800548EC = 1;
    D_80047DE4 = 1;
}
*/

extern s8 D_80047EC4[];

// 8001BA50
void func_8001BA50(void) {
    music_really_unpause();
    cd_command(0xFC, &D_80047D8C, 0);
    cd_command(0xFE, NULL, 0);
    cd_mute();
    cd_pause();
    cd_command(CdlSetmode, &D_80047EC4, 0);
    cd_command(CdlSetfilter, &D_80047ECC, 0);
    cd_command(CdlSeekL, &D_8004D0E0, 0);
    cd_command(CdlPause, NULL, 0);
    cd_command(CdlReadS, &D_8004D0E0, 0);
    cd_demute();
    cd_command(SNQ_SET_SCALED, &vol_full, 0);
    cd_command(SNQ_FUNC9, D_80047EEC, 0);
    cd_command(SNQ_SET_FE, 2, 0);
    D_80047DE4 = 1;
}

// 2 functions for converting between frame number and byte offset in videos
// I have no idea why but these actually use div for dividing by constants
// and do some other weird stuff that doesn't make any sense

static inline int bcd(int x)
{
    return ((x / 10) << 4) + (x % 10);
}

static inline int unbcd(int x)
{
    return (x >> 4) * 10 + (x & 0xF);
}

// 8001BB50
void func_8001BB50(int arg0, CdlLOC *loc) {
    int sector;
    int seconds;
    int second;

    seconds = get_video_mode() == MODE_PAL ? 203 : 200;
    sector = ((arg0 % 2048) * seconds) / 200;
    second = sector / 75;

    loc->sector = bcd(sector % 75);
    loc->minute = bcd(second / 60);
    loc->second = bcd(second % 60);
}

//INCLUDE_ASM("asm/main/nonmatchings/274C", music_play_str);
// plays background music
// 8001BD00
void music_play_str(char *filename, u8 file, u8 chan, CdlLOC *loc, int arg3, int repeat)
{
    if (music_state == 3) {
        func_8001A380();
    }

    D_80047D78 = repeat == 1;
    //printf("PLAYING %s\n", filename);

    if (cd_fs_get_file(&D_8004D0E0, filename) == 0) {
        printf("can't find file :(\n");
        // FIXME: code here
        return;
    }

    //printf("%X:%X:%X:%X\n", f.pos.track, f.pos.minute, f.pos.second, f.pos.sector);
    printf("%X:%X:%X:%X\n", loc->track, loc->minute, loc->second, loc->sector);
    D_80047F24 = 0;
    D_80047ECC.file = file;
    D_80047ECC.chan = chan;

    if (get_video_mode() == MODE_PAL) {
        unbcd(loc->minute) * 60;
        while (1);
    } else {
        int seconds = unbcd(loc->minute) * 60 + unbcd(loc->second);
        D_80047EEC = seconds * 60 + (unbcd(loc->track) * 60) / 100;
    }

    D_80047EEC *= get_video_mode() == MODE_PAL ? 203 : 200;
    D_80047EEC /= 200;
    printf("bgm is %d frames long\n", D_80047EEC);
    D_80047EC4[0] = arg3;   // mode
    cd_command(0xFB, 0, 0);
    cd_command(0xFA, 0, 0);
    func_8001BA50();
    D_80047F24 = 2;
    D_800548EC = 1;

}

// 8001C03C
NOT_IMPL_FN(music_play_cdda);  // CD MUSIC

// 8001C20C
void music_play_cdda_from_loc(CdlLOC *loc) {   // CD MUSIC
    D_80047D78 = 0;
    D_80047F24 = 0;
    cdda_loc.minute = loc->minute;
    cdda_loc.second = loc->second;
    cdda_loc.sector = loc->sector;
    D_80047EAC = CdPosToInt(loc);
    cd_command(SNQ_SET_SCALED, &D_80047D8C, 0);
    cd_command(SNQ_SET_FE, 0, 0);
    cd_demute();
    cd_command(CdlSeekP, loc, 0);
    cd_command(CdlPlay, 0, 0);
    cd_command(SNQ_FADE_OUT, 0, 0);
    cd_command(SNQ_SET_FULL, &vol_full, 0);
    func_8001B9D8();
}

// 8001C2F4
void cd_pause(void) {
    cd_command(CdlPause, 0, 0);
}

// 8001C31C
void cd_play(void) {
    cd_command(CdlPlay, 0, 0);
    cd_demute();
}

// 8001C34C
void cd_mute(void) {
    cd_command(CdlMute, 0, 0);
}

// 8001C374
void cd_demute(void) {
    cd_command(CdlDemute, 0, 0);
}

// 8001C39C
s32 cd_set_stereo(s32 arg0) {
    CdlATV vol;
    s32 ret;

    ret = is_mono;
    is_mono = arg0;

    cd_flush();

    if (arg0 == 0) {
        vol.val0 = 0x80;
        vol.val1 = 0;
        vol.val2 = 0x80;
        vol.val3 = 0;
    } else {
        vol.val0 = 0x5B;
        vol.val1 = 0x5B;
        vol.val2 = 0x5B;
        vol.val3 = 0x5B;
    }

    try_CdMix(&vol);
    return ret;
}

//INCLUDE_ASM("asm/main/nonmatchings/274C", cd_get_vol);
// TODO: the assembly for this is weird
// 8001CD0C
void cd_get_vol(SpuVolume *out)
{
    *out = vol_full;
}

// 8001CD30
s32 cd_set_reverb(s32 arg0)
{
    s32 temp_s0;

    temp_s0 = D_80047EA4;
    cd_command(SNQ_SET_REVERB, arg0, 0);
    return temp_s0;
}

// 8001CD68
void cd_stop(void)
{
    cd_command(CdlStop, 0, 0);
}

// these two are unused?
/*
// 8001CD90
s32 func_8001CD90(void) {
    s32 temp_s0;

    temp_s0 = music_state;
    cd_command(SNQ_SET_FE, 5, 0);
    return temp_s0;
}

// 8001CDC8
void func_8001CDC8(s32 arg0) {
    cd_command(SNQ_SET_FE, arg0, 0);
}
*/

// 8001CDF0
void cd_fade_wait(void) {
    cd_command(SNQ_FUNC8, 0, 0);
}

// 8001CE18
s32 func_8001CE18(void) {
    return bgm_finished;
}

// 8001CE28
void music_pause(void) {
    cd_pause();
    cd_command(SNQ_SET_PAUSED, 1, 0);
}

// 8001CE58
void music_unpause(void) {
    if (bgm_paused == 1) {
        cd_command(CdlReadS, 0, 0);
        cd_command(SNQ_SET_PAUSED, 0, 0);
    }
}

// 8001CEA0
void music_really_unpause(void) {
    cd_command(SNQ_SET_PAUSED, 0, 0);
}

// bgm_tick
// 8001CEC8
void func_8001CEC8(void)
{
    if ((bgm_finished == 0) && (bgm_paused == 0))
        bgm_counter += 1;

    //printf("%d\t/ %d\n", bgm_counter, bgm_target);
    if (bgm_counter > bgm_target)
        bgm_finished = 1;
}

// CD MUSIC
// 8001CF38
NOT_IMPL_FN(func_8001CF38) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CF38);

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
