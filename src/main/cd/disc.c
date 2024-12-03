#include "common.h"
#include "../main.h"
#include "../movie.h"
#include "cd.h"
#include <libcd.h>
#include <libspu.h>

s32 vblank_enable(void); // TODO: goes in a module header


// general state
extern int D_80047DD8;

CdlLOC pvd_loc = { 0, 2, 22, 0 };

s32 cd_busy = 0;   // step1
void* cd_arg;     // param
void* cd_result;     // result
u8 cd_status = 0;

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


// this break the cd queue abstraction by calling queue_add_unsafe
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_ready_callback);


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

void cd_read_callback(void) {}

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
int func_8001D13C();
int func_8001C734();
int func_8001DB04();
int music_play_cdda();
int func_8001C20C();
int func_8001C2F4();
int func_8001C31C();
int func_8001C34C();
int func_8001C374();
int func_8001CD0C();
int func_8001CD30();
int func_8001CD68();
int func_8001CDF0();
int music_play_str();
int func_8001AE90();
int func_8001D248();
int func_8001CE28();
int func_8001CE58();
int func_8001CEA0();
int func_8001BB50();
int func_8001D13C();
int func_8001CF38();
int sndqueue_add_try();
int sndqueue_exec();
int sndqueue_exec_all();
int cd_read_full();
int cd_file_read();
int cd_fs_get_file_size();
int execute_uncompressed();
int cd_seek_safe();
int cd_file_read_fast();
int cd_seek_file();
int fade_out();
int fade_in();
int set_vol_full();
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
    
    D_80047E8C = func_8001A378(&D_8005475C);
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
    set_mono(0);
    jt_set(&func_8001D13C, 0x100);
    jt_set(&sndqueue_add_try, 0x101);
    jt_set(&sndqueue_exec, 0x102);
    jt_set(&sndqueue_exec_all, 0x103);
    jt_set(&func_8001C734, 0x104);
    jt_set(&cd_read_full, 0x110);
    jt_set(&cd_file_read, 0x111);
    jt_set(&cd_fs_get_file_size, 0x112);
    jt_set(&execute_uncompressed, 0x113);
    jt_set(&cd_seek_safe, 0x114);
    jt_set(&cd_file_read_fast, 0x115);
    jt_set(&cd_seek_file, 0x116);
    jt_set(&func_8001DB04, 0x117);
    jt_set(&music_play_cdda, 0x120);
    jt_set(&func_8001C20C, 0x121);
    jt_set(&func_8001C2F4, 0x122);
    jt_set(&func_8001C31C, 0x123);
    jt_set(&func_8001C34C, 0x124);
    jt_set(&func_8001C374, 0x125);
    jt_set(set_mono, 0x126);
    jt_set(&fade_out, 0x127);
    jt_set(&fade_in, 0x128);
    jt_set(&set_vol_full, 0x129);
    jt_set(&func_8001CD0C, 0x12A);
    jt_set(&func_8001CD30, 0x12B);
    jt_set(&func_8001CD68, 0x12C);
    jt_set(&func_8001CDF0, 0x12D);
    jt_set(&fade_pause, 0x12E);
    jt_set(&fade_unpause, 0x12F);
    jt_set(&music_play_str, 0x130);
    jt_set(&func_8001AE90, 0x138);
    jt_set(&func_8001D248, 0x139);
    jt_set(&func_8001CE28, 0x13A);
    jt_set(&func_8001CE58, 0x13B);
    jt_set(&func_8001CEA0, 0x13C);
    jt_set(&play_movie, 0x140);
    jt_set(&func_8001BB50, 0x150);
    jt_set(&func_8001CF38, 0x151);
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
    while (cd_get_status(&cd_status) != 1);
}


void func_8001A77C(void)
{
    u8 buf[2048];

    sync_and_check();
    if (!(cd_status & CdlStatShellOpen))
        // not open, everything is fine
        return;
    
    do {
        while (cd_status & CdlStatShellOpen) {
            //CdSync(0, NULL);
            //CdControl(0U, NULL, &cd_status);
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