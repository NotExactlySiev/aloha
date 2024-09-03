#include "common.h"
#include "cd.h"
#include <libcd.h>

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


s32 try_CdControl(u8 arg0, u8* arg1, u8* arg2) {
    while (CdControl(arg0, arg1, arg2) != 1);
    return 1;
}


s32 try_CdControlB(u8 arg0, u8* arg1, u8* arg2) {
    while (CdControlB(arg0, arg1, arg2) != 1);
    return 1;
}


s32 try_CdGetSector(void* madr, s32 size) {
    while (CdGetSector(madr, size) == 0);
    return 1;
}


s32 try_CdRead(s32 sectors, u32* buf, s32 mode) {
    while (CdRead(sectors, buf, mode) == 0);
    return 1;
}


extern s32 pvd_is_cached;
int func_8001A2C8(int mode, u8 *result)
{
    int rc;
    int ret;
    
    rc = CdReadSync(mode, result);
    ret = -1;
    if (rc == -1) {
        pvd_is_cached = 0;
        ret = sector_cache_clear();
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

int func_8001A378(void)
{
    return 0;
}

void func_8001A380(void)
{
    CdReadyCallback(cd_ready_callback);
    CdReadCallback(cd_read_callback);
}


// jmptable setter 0x100-0x140
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A3B8);

// clears all cd callbacks
void func_8001A74C(void)
{
    CdReadyCallback(0);
    CdReadCallback(0);
    CdSyncCallback(0);
}


static inline sync_and_check(void)
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
        CdControl(CdlSetloc, &pvd_loc, NULL);
        try_CdRead(1, &buf, CdlModeSpeed);
    } while (func_8001A2C8(0, NULL) == -1);
    pvd_is_cached = 0;
    sector_cache_clear();
}