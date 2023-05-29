#include "common.h"
#include "main.h"
#include "libgpu.h"

// file execute loop
void func_800188C8(void) {
    s32 *addr;
    s32 tmp;
    file_t *p = (file_t*) g_Files->addr;

    while (1) {
        if (g_CurrFile == -1) {
            g_CurrFile = 0;
        }
        addr = g_Files[g_CurrFile].header;
        if (addr != NULL) {
            // if addr isn't NULL, it's compressed
            if ((s32) addr & 1) {
                addr = (s32) addr & ~0xF;
                while (func_8001C780(g_Files[g_CurrFile].addr, addr, 0) < 0) {
                    k_printf("Exec File Read Error\n");
                }

                while (addr[0] != 0x582D5350 || addr[1] != 0x45584520) {
                    func_8001C780(g_Files[g_CurrFile].addr, addr, 0);
                    k_printf("Exec File Read Error\n");
                }    
            }
            execute_compressed(addr, 0);
        } else {
            // otherwise it's uncompressed and execute it normally
            func_8001CCC0(g_Files[g_CurrFile].addr, 0);
        }
        g_CurrFile = getNextFile();
    }
}


INCLUDE_ASM("asm/main/nonmatchings/main", get_file_addr);   
//char* get_file_addr(s32 idx) {
//    if (idx > 42) return 0;
//    return g_Files[idx].addr;
//}

// MATCHING trivial
s32 func_80018A6C(void) {
    return D_80047D50;
}

// MATCHING trivial
s32 func_80018A7C(void) {
    return D_80047D4C;
}

// NON MATCHING but I think can be fixed
void func_80018A8C(s32 arg0) {
    if (arg0 != 0)
        D_80047D4C = 1;
    else
        D_80047D4C = 0;
}

s32 D_80047D48;
const u8 D_80033000; // builtin logo data, const

// NON MATCHING
void func_80018AB4(void) {
    DRAWENV drawenv;
    DISPENV dispenv;
    POLY_FT4 polys[5];
    TILE tile;
    RECT rect;
    s16 left;
    s16 rght;
    s32 i;
    s32 col;
    s32 tmp;
    s32 tex_x;
    s32 y;
    u32 h;

    // set the enviroment
    call_SetDefDrawEnv(&drawenv, 0, 0, 0x280, 0x1E0);
    call_SetDefDispEnv(&dispenv, 0, 0, 0x280, 0x1E0);
    drawenv.isbg = 0;
    drawenv.dtd = 1;
    drawenv.dfe = 1;
    dispenv.pad0 = 0;
    if (get_GameNP() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y += 24;
    }
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);
    DrawSync(0);
    
    // clear the screen with black
    SetBlockFill(&tile);
    tile.r0 = 0; tile.g0 = 0; tile.b0 = 0;
    tile.x0 = 0; tile.y0 = 0;
    tile.w = 640; tile.h = 480;
    DrawPrim(&tile);
    DrawSync(0);
    
    do {
        tmp = func_8001C780("WARNING.PRS", (u32* )0x80100000, 0); //read file
    } while (tmp == -1);

    if (tmp >= 0) {        
        MAKE_QUADS(64, 0, 128, 480, 0, 0, 128, 480, 64, 4);
        LOAD_PRS(&tmpfilebuf, 256, 240);
        SLEEP_FRAMES(10);
        
        func_80022BA4(0);
        call_SetDispMask(1); // set disp mask to show it
        
        FADE_IN(4);
        
        DrawSync(0);
        func_80022BA4(0);
        
        SET_POLYS_COL(128);
        SLEEP_FRAMES(300);
        
        FADE_OUT(4);
    }
    
    func_80022BA4(0);
    call_SetDispMask(0);
    
    do {
        D_80047D48 = func_8001C780("TITLE.PRS", (u32* )0x80100000, 0);  // read file
    } while (D_80047D48 == -1);

    if (D_80047D48 == -2) {
        MAKE_QUADS(64, 192, 128, 96, 0, 0, 128, 96, 64, 4);
        LOAD_PRS(&D_80032FFC, 256, 96);
        SLEEP_FRAMES(10);
        
        func_80022BA4(0);
        call_SetDispMask(1);
        
        FADE_IN(4);
    } else {
        if (get_GameRegion() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        LOAD_PRS(&tmpfilebuf, 320, 240);
        SLEEP_FRAMES(10);
        
        func_80022BA4(0);
        call_SetDispMask(1);
        
        FADE_IN(4);
    }
}

#define DrawSync        call_DrawSync
#define func_80022BA4   func_80022B54
void func_8001926C(void) {
    DRAWENV drawenv;
    DISPENV dispenv;
    POLY_FT4 polys[5];
    s32 i;
    s32 left, rght, tex_x;
    s32 y, h;
    u32 col;

    call_SetDefDrawEnv(&drawenv, 0, 0, 0x280, 0x1E0);
    call_SetDefDispEnv(&dispenv, 0, 0, 0x280, 0x1E0);
    drawenv.isbg = 0;
    drawenv.dtd = 1;
    drawenv.dfe = 1;
    dispenv.pad0 = 0;
    if (get_GameNP() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y = (u16) dispenv.screen.y + 0x18;
    }
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);

    if (D_80047D48 == -2) {
        MAKE_QUADS(64, 192, 128, 96, 0, 0, 128, 96, 64, 4);
        FADE_OUT(4);
    } else {
        if (get_GameRegion() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        FADE_OUT(4);
    }
    
    func_80022B54(0);
    call_SetDispMask(0);
    call_SetDefDrawEnv(&drawenv, 0, 0, 0x140, 0xF0);
    call_SetDefDispEnv(&dispenv, 0, 0, 0x140, 0xF0);
    dispenv.pad0 = 0;
    if (get_GameNP() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y = (u16) dispenv.screen.y + 0x18;
    }
    drawenv.isbg = 1;
    drawenv.r0 = 0;
    drawenv.g0 = 0;
    drawenv.b0 = 0;
    
    call_DrawSync(0);
    func_80022B54(0);
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);
    
    call_DrawSync(0);
    func_80022B54(0);
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);
}
#undef DrawSync
#undef func_80022BA4


// NON MATCHING but mostly close 
void func_80019680(void) { // game_bootup
    s32 tmp;

    func_8001A3B8();
    read_version();
    tmp = get_GameNP();
    if (tmp != 0) tmp = 1;
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

// MATCHING with psyq4.3/aspsx and -O1
void func_8001972C(void) { // game_shutdown
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


// NON MATCHING but with -O2 only two instruction are swapped
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

// MATCHING with psyq4.3/aspsx and -O1
void disable_timer3_event(s32 arg0) {
    k_EnterCriticalSection();
    StopRCnt(0xF2000003);
    k_CloseEvent(arg0);
    k_ExitCriticalSection();
}

// MATCHING trivial
void nop(void) {}

// MATCHING with psyq4.3/aspsx and -O1
void flush_cache_safe(void) {
    k_EnterCriticalSection();
    k_FlushCache();
    k_ExitCriticalSection();
}

// NON MATCHING but matches with -O2
void func_800198B4(void) {
    void** jmptable = (void**) 0x80010000;
    int i;

    for (i = 0; i < 1024; i++) {
        *jmptable++ = KSEG0(nop);
    }
    flush_cache_safe();
}
// NON MATCHING but only regalloc
void func_80019908(void* func, u32 idx) {
    void** jmptable = (void**) 0x80010000;
    jmptable[idx] = KSEG0(func);
    flush_cache_safe();
}

// NON MATCHING
void func_80019948(void) {
    if (D_80047D64 != 1) {
        disable_timer3_event(tim3event);
        D_80047D64 = 1;
    }
}

// NON MATCHING
void func_80019990(void) {
    if (D_80047D64 != 0) {
        tim3event = enable_timer3_event(func_800232D4);
        D_80047D64 = 0;
    }
}

// MATCHING with psyq4.3/aspsx and -O1
s32 get_GameNP(void) {
    return g_GameNP;
}

// NON MATCHING, much closer on 3.5
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
        strcpy(EXACT01_str, &g_VersionStr[12]); // TODO: this string is actually extern
        g_GameIsZ = 1;
    }
}

// MATCHING with psyq4.3/aspsx and -O1
s32 get_GameRegion(void) {
    return g_GameRegion;
}

// NON MATCHING but the same size
u8* get_VersionStr(void) {
    if (g_GameIsZ == 0)
        return 0;    
    return g_VersionStr;
}

// NON MATCHING but almost perfect with 3.5
void jt_series1(void) { // TODO: better name TODO: symbol
    ResetCallback();
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
    VSyncCallbacks(0, 0);
    tim3event = enable_timer3_event(func_800232D4);
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
    jt_set(func_80018A8C, 10);
    jt_set(get_VersionStr, 11);
    memset((void*) 0x80014000, 0x4000, 0);
    func_80020F9C(5, 0);
    func_8001FBC0(0);
    func_80020000(0);
}

// MATCHING with psyq4.3/aspsx and -O1
s32 get_D_80047E6C(void) {
    return D_80047E6C;
}

// MATCHING with psyq4.3/aspsx and -O1
void* jt_reset(void) {
    jt_clear();
    jt_set(func_80019DCC, 0xFF);
    jt_set(get_D_80047E6C, 0x2);
    jt_set(get_file_addr, 0x6);
    return jt_series1;
}

// NON MATCHING, but very close with -O2, and even closer with 4.5
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

// MATCHING with psyq4.3/aspsx and -O1
void func_80019D64(void) {
    struct {
        ExCB* excb[2];
        PCB* pcb;
        TCB* tcb;
    } *bios_tables = (void*) 0x100;

    bios_tables->pcb->current_tcb->regs[2] = 0;
}

// MATCHING with psyq4.3/aspsx and -O1
s32 enable_exception_event(void* handler) {
    s32 event;

    k_EnterCriticalSection();
    event = k_OpenEvent(0xF0000010, 0x4000, 0x1000, handler);
    k_EnableEvent(event);
    k_ExitCriticalSection();
    return event;
}

// MATCHING with psyq4.3/aspsx and -O1
u32 func_80019DCC(void) {
  return 0x10002;
}

// MATCHING with psyq4.3/aspsx and -O1
void setNextFile(s32 id) {
    g_NextFile = id;    
}

// MATCHING with psyq4.3/aspsx and -O1
s32 getNextFile() {
    return g_NextFile;
}

// MATCHING with psyq4.3/aspsx and -O1
u8* getGameConfig() {
    //return g_GameConfig;
    return 0x80014000;
}

int main(int argc, char** argv) {
    s32 pad[22];
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
    call_SetDispMask(0);
    func_80021600();
    func_8001972C();
    call_ResetGraph(3);
    reset();
    return;
}