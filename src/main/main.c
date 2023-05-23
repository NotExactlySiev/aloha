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
//INCLUDE_ASM("asm/main/nonmatchings/main", func_80019680); game_bootup
// NOT MATCHING
void func_80019680(void) {
    s32 tmp;

    func_8001A3B8();
    read_version();
    tmp = 0 != get_GameNP();
    func_80022BA4(0);
    func_8002C13C(tmp);
    func_80022BA4(0);
    call_ResetGraph(0);
    func_80022BD8(0);
    func_80022C1C(0);
    func_8001DD7C();
    func_80022CF0();
    func_80018AB4();
    func_8001E33C();
    func_8002092C();
    func_80021D54();
    func_8001E7B0();
    func_8001E38C();
}


// 1 timer event function
//INCLUDE_ASM("asm/main/nonmatchings/main", func_8001972C); game_shutdown
void func_8001972C(void) {
    func_8001CD68();
    func_8001B8DC();
    func_8001A74C();
    func_80020C8C();
    func_8001DE98();
    StopCallback();
    func_8002C0EC();
    disable_timer3_event(tim3event);
    k_CloseEvent(excpevent);
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
}


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
s32 get_GameNP(void) {
    return g_GameNP;
}

// NON MATCHING (very close)
void read_version(void) {
    u8 buf[1024];
    s32 i;
    s32 tmp;
    u8 *p;

    do {
        tmp = func_8001C780("COUNTRY.TXT", (u32*) buf, 0x400);
    } while (tmp == -1);
    
    g_GameRegion = 0;
    g_GameNP = 0;
    if (tmp == -2) return; 
    
    if (buf[0] == 'P') g_GameNP = 1;
    
    if (buf[1] == 'U') {
        g_GameRegion = 1;
    }
    else if (buf[1] == 'E') {
        g_GameRegion = 2;
    }
    
    if (buf[1] == 'Z') {
        g_GameRegion = 3;
        i = 0;
        p = &buf[2];
        do {
            g_VersionStr[i] = *p;
            i += 1;
            p += 1;
        } while (i < 12);
        strcpy("EXACT01", &g_VersionStr[12]);
        g_GameIsZ = 1;
    }
}

s32 get_GameRegion(void) {
    return g_GameRegion;
}

u8* get_VersionStr(void) {
    if (g_GameIsZ == 0)
        return 0;    
    return g_VersionStr;
}

void jt_series1(void) { // TODO: better name TODO: symbol
    ResetCallback();
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
    VSyncCallbacks(0, 0);
    tim3event = func_800197C8(func_800232D4);
    func_800232C4(1);
    func_80019680();
    k_ChangeClearPAD(0);
    jt_set(jt_set, 1);
    jt_set(func_80023144, 224);
    jt_set(func_800231CC, 225);
    jt_set(rle_decode, 192);
    jt_set(lz1_decode, 193);
    jt_set(setNextFile, 3);
    jt_set(getNextFile, 4);
    jt_set(getGameConfig, 5);
    jt_set(get_GameNP, 7);
    jt_set(get_GameRegion, 8);
    jt_set(func_80018A7C, 9);
    jt_set(func_80018A8C, 0xA);
    jt_set(get_VersionStr, 0xB);
    memset(0x80014000, 0x4000, 0);
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
    return jt_series1;
}

// NON MATCHING
void func_80019D0C(void)
{
    struct {
        ExCB* excb[2];
        PCB* pcb;
        TCB* tcb;
    } *bios_tables = (void*) 0x100;
    
    TCB *tcb = bios_tables->pcb->current_tcb;
    if (D_80047D58 == 0) {
        D_80047D58 = 1;
        jt_reset();
        tcb->regs[2] = (int) jt_series1;
    }
    else
    {
        tcb->regs[2] = 0;
    }
}

void func_80019D64(void) {
    struct {
        ExCB* excb[2];
        PCB* pcb;
        TCB* tcb;
    } *bios_tables = (void*) 0x100;

    bios_tables->pcb->current_tcb->regs[2] = 0;
}

s32 enable_exception_event(void* handler) {
    s32 event;

    k_EnterCriticalSection();
    event = k_OpenEvent(0xF0000010, 0x4000, 0x1000, handler);
    k_EnableEvent(event);
    k_ExitCriticalSection();
    return event;
}


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

int main(int argc, char** argv) {
    s32 tmp;
    k_printf("MAX ADR:%x\n", k_malloc(4));
    D_80047E6C = 1;
    jt_reset();
    jt_series1();
    excpevent = enable_exception_event(func_80019D64);
    func_80020FC0(&D_80034344);

    tmp = func_8001C780(g_SysSeFile, &tmpfilebuf, 0);
    while (tmp < 0 || tmpfilebuf != 0x56414270)
    {
        tmp = func_8001C780(g_SysSeFile, &tmpfilebuf, 0);
        k_printf("VAB file Reload\n");
    }


    func_80020D5C(0, &tmpfilebuf, 0);
    func_8001926C();
    if (func_8001E36C(0) == 6) {
        D_80047D50 = 1;
    }
    setNextFile(0);
    func_800188C8();
    func_80022B54(0);
    func_80022C1C(0);
    func_80021600();
    func_8001972C();
    call_ResetGraph(3);
    reset();
    return;
}