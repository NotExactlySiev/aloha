#include "common.h"
#include "main.h"

// file execute loop
INCLUDE_ASM("asm/main/nonmatchings/main", func_800188C8);

char* get_file_addr(s32 idx) {
    if (idx > 42) return 0;
    return g_Files[idx].addr;
}

s32 func_80018A6C(void) {
    return D_80047D50;
}

s32 func_80018A7C(void) {
    return D_80047D4C;
}

void func_80018A8C(s32 arg0) {
    if (arg0 != 0)
        D_80047D4C = 1;
    else
        D_80047D4C = 0;
}

// 2 very massive functions
INCLUDE_ASM("asm/main/nonmatchings/main", func_80018AB4);

INCLUDE_ASM("asm/main/nonmatchings/main", func_8001926C);

// some setup thing
INCLUDE_ASM("asm/main/nonmatchings/main", func_80019680);

// 3 timer event functions
INCLUDE_ASM("asm/main/nonmatchings/main", func_8001972C);

// NON MATCHING
s32 enable_timer3_event(void* handler) {
    s32 event;

    k_EnterCriticalSection();
    event = k_OpenEvent(0xF2000003, 2, 0x1000, handler);
    SetRCnt(0xF2000003, 1, 0x1000);
    StartRCnt(0xF2000003);
    k_EnableEvent(event);
    k_ExitCriticalSection();
    return event;
}

// NON MATCHING
void disable_timer3_event(u32 arg0) {
    k_EnterCriticalSection();
    StopRCnt(0xF2000003);
    k_CloseEvent(arg0);
    k_ExitCriticalSection();
}

void nop(void) {}

void flush_cache_safe(void) {
    k_EnterCriticalSection();
    k_FlushCache();
    k_ExitCriticalSection();
}

// NONMATCHING
void jt_clear(void) {
   
    int i;
    for (i = 0; i < 1024; i++)
    {
        jmptable[i] = KSEG0((u32) nop);
    }
    flush_cache_safe();
}

// NONMATCHING
void jt_set(void* func, s32 idx) {
    jmptable[idx] = KSEG0(func);
    flush_cache_safe();
}

// 2 timer functions
INCLUDE_ASM("asm/main/nonmatchings/main", func_80019948);

INCLUDE_ASM("asm/main/nonmatchings/main", func_80019990);

// 4 functions related to game version
INCLUDE_ASM("asm/main/nonmatchings/main", func_800199D4);

INCLUDE_ASM("asm/main/nonmatchings/main", func_800199E4);

INCLUDE_ASM("asm/main/nonmatchings/main", func_80019AE8);

INCLUDE_ASM("asm/main/nonmatchings/main", func_80019AF8);

void jt_series1(void) { // TODO: better name TODO: symbol
    ResetCallback();
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
    VSyncCallbacks(0, 0);
    D_80047E74 = func_800197C8(func_800232D4);
    func_800232C4(1);
    func_80019680();
    k_ChangeClearPAD(0);
    jt_set(jt_set, 1);
    jt_set(func_80023144, 0xE0);
    jt_set(func_800231CC, 0xE1);
    jt_set(rle_decode, 0xC0);
    jt_set(lz1_decode, 0xC1);
    jt_set(setNextFile, 3);
    jt_set(getNextFile, 4);
    jt_set(getGameConfig, 5);
    jt_set(func_800199D4, 7);
    jt_set(func_80019AE8, 8);
    jt_set(func_80018A7C, 9);
    jt_set(func_80018A8C, 0xA);
    jt_set(func_80019AF8, 0xB);
    k_memset(0x80014000, 0x4000, 0);
    func_80020F9C(5, 0);
    func_8001FBC0(0);
    func_80020000(0);
}



s32 get_D_80047E6C(void) {
    return D_80047E6C;
}

void* jt_reset(void) {
    jt_clear();
    jt_set(func_80019DCC, 0xFF);
    jt_set(get_D_80047E6C, 0x2);
    jt_set(get_file_addr, 0x6);
    return func_80019B1C;
}


INCLUDE_ASM("asm/main/nonmatchings/main", func_80019D0C); // has a loop through jt

// 2 exception functions
INCLUDE_ASM("asm/main/nonmatchings/main", func_80019D64);

INCLUDE_ASM("asm/main/nonmatchings/main", func_80019D78);

u32 func_80019DCC(void) {
  return 0x10002;
}

void setNextFile(s32 id) {
    g_NextFile = id;    
}

s32 getNextFile() {
    return g_NextFile;
}

u8* getGameConfig() { //func_80019DF8
    return g_GameConfig;
}

INCLUDE_ASM("asm/main/nonmatchings/main", main);
