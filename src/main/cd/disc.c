#include "common.h"
#include "../main.h"
#include "../movie.h"
#include "../spu.h"
#include "cd.h"
#include <libcd.h>
#include <libspu.h>

s32 vblank_enable(void); // TODO: goes in a module header

// this should be cd.c, the main cd driver file

// general state
extern int D_80047DD8;

CdlLOC pvd_loc = { 0, 2, 22, 0 };

s32 cd_busy = 0;   // step1
void* cd_arg;     // param
void* cd_result;     // result
u8 cd_last_status = 0;

// update_state, gets called with the return value of CdSync(1,0)
void func_80019F4C(s32 arg0) {
    static int lock = 0;  // lock
    if (lock == 1) return;
    lock = 1;
    
    switch (arg0) {
    case CdlNoIntr:
        break;
    case CdlComplete:
        D_80047DD8 = 1;
        break;
    case CdlDiskError:
        D_80047DD8 = 2;
        break;
    }

    lock = 0;
}

//INCLUDE_ASM("asm/main/nonmatchings/274C", cd_ready_callback);
void cd_ready_callback(u8 status, u8 *result)
{
    extern s32 fe_value;
    cd_last_status = result[0];
    if ((cd_last_status & CdlStatSeek == 0) && fe_value == 1) {
        // more CD-DA stuff that's never ran
        // this break the cd queue abstraction by calling queue_add_unsafe
        NOT_IMPL("handling cd callback for CD-DA")
    }
}


int try_CdControl(u_char com, void *param, u_char *result) {
    while (CdControl(com, param, result) != 1);
    return 1;
}


int try_CdControlB(u_char com, void *param, u_char *result) {
    while (CdControlB(com, param, result) != 1);
    return 1;
}


int try_CdGetSector(void *madr, int size) {
    while (CdGetSector(madr, size) == 0);
    return 1;
}


int try_CdRead(int sectors, void *buf, int mode) {
    while (CdRead(sectors, buf, mode) == 0);
    return 1;
}


extern s32 pvd_is_cached;
int cd_verify_read(int mode, u8 *result)
{
    int rc;
    int ret;
    
    rc = CdReadSync(mode, result);
    ret = -1;
    if (rc == -1) {
        pvd_is_cached = 0;
        sector_cache_clear();
    }
    
    if (rc >= 0) {
        ret = vblank_enable();
    }
    return ret;
}


s32 try_CdMix(CdlATV* vol)
{
    while (CdMix(vol) == 0);
    return 1;
}

s32 cd_get_status(u8* result)
{
    return CdControl(CdlNop, 0, result);
}

void cd_read_callback(u8 status, u8 *result) {}

// must have been some debug thing?
// or get next free? returning 0 always clears it
int func_8001A378(CdlLOC arr[])
{
    return 0;
}

void func_8001A380(void)
{
    CdReadyCallback(cd_ready_callback);
    CdReadCallback(cd_read_callback);
}

// TODO: move these to their appropriate headers
int cd_status();
int func_8001C734();
int iso_never_called();
int music_play_cdda();
int music_play_cdda_from_loc();
int cd_play();
int cd_demute();
int cd_stop();
int cd_fade_wait();
int music_play_str();

int music_stop();
int music_pause();
int music_unpause();
int music_really_unpause();
int func_8001BB50();
int cd_status();
int func_8001CF38();
int cd_read_full();
int iso_read();
int iso_file_size();
int iso_exec();
int cd_seek_safe();
int iso_read_fast();
int iso_seek();
int fade_out();
int fade_in();
int fade_pause();
int fade_unpause();
int play_movie();
extern int D_80047EA4;
extern int D_80047E9E;

int D_80047E8C;
int D_80047D78 = 0;
int D_80047D7C = 0;
int D_80047D80 = 1;
int D_80047D84 = 1;
SpuVolume D_80047D8C = {0};

extern int bgm_paused;
extern CdlLOC D_8005475C[];
extern int sndqueue_is_running;

// cd.h
void cd_command(u8 arg0, u32 arg1, u32 arg2);
int cd_run_block(void);
int cd_flush(void);
void cd_pause(void);
void cd_mute(void);
void cd_set_vol(SpuVolume *vol);
SpuVolume *cd_get_vol(SpuVolume *vol);
int cd_set_reverb(int arg0);
void cd_fade_stop(void);

// jmptable setter 0x100-0x140
// cd_init
//INCLUDE_ASM("asm/main/nonmatchings/274C", cd_init);
// FIXME: complete this
void cd_init(void) {
    static int D_80047D74 = 0;  // cd subsystem initialized
    if (D_80047D74 == 1)
        return;

    CdInit();
    CdSetDebug(0);
    
    D_80047E8C = func_8001A378(D_8005475C);
    D_80047D74 = 1;
    D_80047D78 = 0;
    D_80047D7C = 1;
    /* TODO
    fade_out_active = 0;
    fade_in_active = 0;
    fading_out = 0;
    fading_in = 0;
    fe_value = 0;
    D_80047F24 = 0;
    D_800548EC = 0;
    fade_paused = 0;
    pvd_is_cached = 0;
    cache_epoch = 1;
    */
    sndqueue_is_running = 0;
    bgm_paused = 0;
    sector_cache_clear();
    func_8001DD7C();
    
    SpuCommonAttr attr = {
        .mask= 0x3C0,
        .cd = {
            .mix = 1,
            .reverb = 0,
            .volume = { 0x2800, 0x2800 },
        },
    };
    //vol_full = 0x2800;
    //D_80047E9E = 0x2800;
    //D_80047EA4 = 0;
    SpuSetCommonAttr(&attr);
    func_8001A380();
    sndqueue_reset();
    cd_set_stereo(0);
    jt_set(cd_status, 0x100);
    jt_set(cd_command, 0x101);
    jt_set(cd_run_block, 0x102);
    jt_set(cd_flush, 0x103);
    jt_set(func_8001C734, 0x104);
    jt_set(cd_read_full, 0x110);
    jt_set(iso_read, 0x111);
    jt_set(iso_file_size, 0x112);
    jt_set(iso_exec, 0x113);
    jt_set(cd_seek_safe, 0x114);
    jt_set(iso_read_fast, 0x115);
    jt_set(iso_seek, 0x116);
    jt_set(iso_never_called, 0x117);
    jt_set(music_play_cdda, 0x120);
    jt_set(music_play_cdda_from_loc, 0x121);
    jt_set(cd_pause, 0x122);
    jt_set(cd_play, 0x123);
    jt_set(cd_mute, 0x124);
    jt_set(cd_demute, 0x125);
    jt_set(cd_set_stereo, 0x126);
    jt_set(fade_out, 0x127);
    jt_set(fade_in, 0x128);
    jt_set(cd_set_vol, 0x129);
    jt_set(cd_get_vol, 0x12A);
    jt_set(cd_set_reverb, 0x12B);
    jt_set(cd_stop, 0x12C);
    jt_set(cd_fade_wait, 0x12D);
    jt_set(fade_pause, 0x12E);
    jt_set(fade_unpause, 0x12F);
    jt_set(music_play_str, 0x130);
    jt_set(cd_fade_stop, 0x138);
    jt_set(music_stop, 0x139);
    jt_set(music_pause, 0x13A);
    jt_set(music_unpause, 0x13B);
    jt_set(music_really_unpause, 0x13C);
    jt_set(play_movie, 0x140);      // movie_play
    jt_set(func_8001BB50, 0x150);   // movie_int_to_pos?
    jt_set(func_8001CF38, 0x151);   // movie_get_loc?
}

// clears all cd callbacks
void func_8001A74C(void)
{
    CdReadyCallback(0);
    CdReadCallback(0);
    CdSyncCallback(0);
}


static inline void sync_and_check(void)
{
    CdSync(0, NULL);
    while (cd_get_status(&cd_last_status) != 1);
}


void func_8001A77C(void)
{
    u8 buf[2048];

    sync_and_check();
    if (!(cd_last_status & CdlStatShellOpen))
        // not open, everything is fine
        return;
    
    do {
        while (cd_last_status & CdlStatShellOpen) {
            //CdSync(0, NULL);
            //CdControl(0U, NULL, &cd_last_status);
            sync_and_check();   // this is exactly the same as above
            sync_and_check();
        }
        sync_and_check();
        CdControl(CdlSetloc, (u_char*) &pvd_loc, NULL);
        try_CdRead(1, (u_long*) buf, CdlModeSpeed);
    } while (cd_verify_read(0, NULL) == -1);
    pvd_is_cached = 0;
    sector_cache_clear();
}