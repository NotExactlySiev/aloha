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

INCLUDE_ASM("asm/main/nonmatchings/main", func_800197C8);

INCLUDE_ASM("asm/main/nonmatchings/main", func_8001983C);

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

// 1 setup function (sets up jumptable)
INCLUDE_ASM("asm/main/nonmatchings/main", func_80019B1C); // jumptable and interrupts?


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
    return &g_GameConfig;
}

INCLUDE_ASM("asm/main/nonmatchings/main", main);
