//#define LOG_JT

#include "common.h"
#include "main.h"
#include <kernel.h>
#include <libgpu.h>
#include <shared.h>


#define DFILE(ptr, name)    { (void*) (ptr | 1), name }
file_t g_Files[42] = {
    DFILE(0x80060000, "TITLE.PEX"),
    DFILE(0x80060000, "SELECT.PEX"),
    DFILE(0x80080000, "JM1\\MAIN.PEX"),
    DFILE(0x80080000, "JM1\\MAIN.PEX"),
    DFILE(0x80080000, "JM1\\MAIN.PEX"),
    DFILE(0x80080000, "JM2\\MAIN.PEX"),
    DFILE(0x80080000, "JM2\\MAIN.PEX"),
    DFILE(0x80080000, "JM2\\MAIN.PEX"),
    DFILE(0x80080000, "JM3\\MAIN.PEX"),
    DFILE(0x80080000, "JM3\\MAIN.PEX"),
    DFILE(0x80080000, "JM3\\MAIN.PEX"),
    DFILE(0x80080000, "JM4\\MAIN.PEX"),
    DFILE(0x80080000, "JM4\\MAIN.PEX"),
    DFILE(0x80080000, "JM4\\MAIN.PEX"),
    DFILE(0x80080000, "JM5\\MAIN.PEX"),
    DFILE(0x80080000, "JM5\\MAIN.PEX"),
    DFILE(0x80080000, "JM5\\MAIN.PEX"),
    DFILE(0x80080000, "JM6\\MAIN.PEX"),
    DFILE(0x80080000, "JM6\\MAIN.PEX"),
    DFILE(0x80080000, "JM6\\MAIN.PEX"),
    DFILE(0x80080000, "JM1\\MAIN.PEX"),
    DFILE(0x80080000, "JM2\\MAIN.PEX"),
    DFILE(0x80080000, "JM3\\MAIN.PEX"),
    DFILE(0x80080000, "GAMEOVER.PEX"),
    DFILE(0x80080000, "JM1B\\MAIN.PEX"),
    DFILE(0x80080000, "JM1B\\MAIN.PEX"),
    DFILE(0x80080000, "JM1B\\MAIN.PEX"),
    DFILE(0x80080000, "JM2B\\MAIN.PEX"),
    DFILE(0x80080000, "JM2B\\MAIN.PEX"),
    DFILE(0x80080000, "JM2B\\MAIN.PEX"),
    DFILE(0x80080000, "JM3B\\MAIN.PEX"),
    DFILE(0x80080000, "JM3B\\MAIN.PEX"),
    DFILE(0x80080000, "JM3B\\MAIN.PEX"),
    DFILE(0x80080000, "JM4B\\MAIN.PEX"),
    DFILE(0x80080000, "JM4B\\MAIN.PEX"),
    DFILE(0x80080000, "JM4B\\MAIN.PEX"),
    DFILE(0x80080000, "JM5B\\MAIN.PEX"),
    DFILE(0x80080000, "JM5B\\MAIN.PEX"),
    DFILE(0x80080000, "JM5B\\MAIN.PEX"),
    DFILE(0x80080000, "JM6B\\MAIN.PEX"),
    DFILE(0x80080000, "JM6B\\MAIN.PEX"),
    DFILE(0x80080000, "JM6B\\MAIN.PEX"),
};

s32 g_CurrFile = 0;
s32 g_NextFile = 0;
s32 g_GameRegion = 0;
u32 g_GameNP = TV_NTSC;
s32 g_GameIsZ = 0;

// .bss
void* D_80048044;       // hold return for _start
s32 D_80047E6C;         // 80047e6c
s32 D_80047E70;         // 80047e70
s32 vblank_event;          // 80047e74
s32 exception_event;          // 80047e7c
char g_VersionStr[20];



void file_execute_loop(void)
{
    s32 *addr;
    s32 tmp;

    while (1) {
        if (g_CurrFile == -1) g_CurrFile = 0;

        addr = g_Files[g_CurrFile].header;
        k_printf("now executing: %s\n", g_Files[g_CurrFile].addr);
        if (addr != NULL) {
            // if addr isn't NULL, it's compressed
            if ((s32) addr & 1) {
                addr = (s32) addr & ~0xF;
                while (cd_fs_read(g_Files[g_CurrFile].addr, addr, 0) < 0) {
                    k_printf("Exec File Read Error\n");
                }

                while (addr[0] != 0x582D5350 || addr[1] != 0x45584520) {
                    cd_fs_read(g_Files[g_CurrFile].addr, addr, 0);
                    k_printf("Exec File Read Error\n");
                }
            }
            execute_compressed(addr, 0);
        } else {
            // otherwise it's uncompressed and execute it normally
            execute_uncompressed(g_Files[g_CurrFile].addr, 0);
        }
        g_CurrFile = getNextFile();
        
    }
}

char* get_file_addr(s32 idx)
{
    if (idx > 42) return 0;
    return g_Files[idx].addr;
}

s32 func_80018A6C(void)
{
    return D_80047D50;
}

s32 func_80018A7C(void)
{
    return D_80047D4C;
}

void func_80018A8C(s32 arg0)
{
    if (arg0 != 0)
        D_80047D4C = 1;
    else
        D_80047D4C = 0;
}

void func_80018AB4(void)
{
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
        tmp = cd_fs_read("WARNING.PRS", (u32* )0x80100000, 0); //read file
    } while (tmp == -1);

    if (tmp >= 0) {       
        // TODO: maybe a #define POLYCOUNT 4 so I don't have to 
        // repeat 4? just put POLYCOUNT in the macros 
        MAKE_QUADS(64, 0, 128, 480, 0, 0, 128, 480, 64, 4);
        LOAD_PRS(&tmpfilebuf, 256, 240);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        call_SetDispMask(1); // set disp mask to show it
        
        FADE_IN(4,4);
        
        DrawSync(0);
        wait_frame(0);
        
        SET_POLYS_COL(128,4);
        SLEEP_FRAMES(300);
        
        FADE_OUT(4,4);
    }
    
    wait_frame(0);
    call_SetDispMask(0);
    
    do {
        D_80047D48 = cd_fs_read("TITLE.PRS", (u32* )0x80100000, 0);  // read file
    } while (D_80047D48 == -1);

    if (D_80047D48 == -2) {
        MAKE_QUADS(64, 192, 128, 96, 0, 0, 128, 96, 64, 4);
        LOAD_PRS(&D_80032FFC, 256, 96);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        call_SetDispMask(1);
        
        FADE_IN(4,4);
    } else {
        if (get_GameRegion() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        LOAD_PRS(&tmpfilebuf, 320, 240);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        call_SetDispMask(1);
        
        FADE_IN(4,5);
    }
}

void func_8001926C(void)
{
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
        FADE_OUT(4,4);
    } else {
        if (get_GameRegion() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        FADE_OUT(4,5);
    }
    
    call_wait_frame(0);
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
    call_wait_frame(0);
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);
    
    call_DrawSync(0);
    call_wait_frame(0);
    call_PutDrawEnv(&drawenv);
    call_PutDispEnv(&dispenv);
}

// setup_thing (setup_video?)
void func_80019680(void)
{
    // setup audio and cd
    func_8001A3B8();

    // set tv system
    read_version();
    wait_frame(0);
    SetVideoMode(get_GameNP() != 0);
    wait_frame(0);

    // setup graphics
    call_ResetGraph(0);
    call_SetGraphDebug(0);
    call_SetDispMask(0);

    // spu set default
    func_8001DD7C();

    // gpu jt stuff
    jt_series_gpu();

    // show logo
    func_80018AB4();
    
    // init pad
    func_8001E33C();

    // init mc
    func_8002092C();

    // init playing audio effects and control
    func_80021D54();

    // jt vab stuff?
    func_8001E7B0();

    // init font and characters
    func_8001E38C();
}

void game_shutdown(void)
{
    func_8001CD68();
    sndqueue_exec_all();
    func_8001A74C();
    func_80020C8C();
    func_8001DE98();
    StopCallback();
    PadStop();
    disable_vblank_event(vblank_event);
    k_CloseEvent(exception_event);
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
}

s32 enable_vblank_event(void* handler)
{
    s32 event;
    k_EnterCriticalSection();
    event = k_OpenEvent(RCntCNT3, EvSpINT, EvMdINTR, handler);
    SetRCnt(RCntCNT3, 1, EvMdINTR);
    StartRCnt(RCntCNT3);
    k_EnableEvent(event);
    k_ExitCriticalSection();
    return event;
}

void disable_vblank_event(s32 event)
{
    k_EnterCriticalSection();
    StopRCnt(RCntCNT3);
    k_CloseEvent(event);
    k_ExitCriticalSection();
}

void nop(void) {}

void flush_cache_safe(void)
{
    k_EnterCriticalSection();
    k_FlushCache();
    k_ExitCriticalSection();
}

void jt_clear(void)
{
    void** jmptable = (void**) 0x80010000;
    int i;

    for (i = 0; i < 1024; i++) {
        *jmptable++ = KSEG0(nop);
    }
    flush_cache_safe();
}


#ifdef LOG_JT

#undef jt_set
void jt_set(void* func, s32 idx)
{
    _jt_set(func, idx, "UNK");
}
#define jt_set(func, idx)   _jt_set(func, idx, #func)

void _jt_set(void* func, s32 idx, const char* name)
#else
void jt_set(void* func, s32 idx)
#endif
{
#ifdef LOG_JT
    k_printf("Set %X (%d) to %08X: %s\n", idx, idx, func, name);
#endif
    void** jmptable = (void**) &jt;
    jmptable[idx] = KSEG0(func);
    flush_cache_safe();
}

void func_80019948(void)
{
    if (D_80047D64 != 1) {
        disable_vblank_event(vblank_event);
        D_80047D64 = 1;
    }
}

void func_80019990(void)
{
    if (D_80047D64 != 0) {
        vblank_event = enable_vblank_event(regular_run_tasks);
        D_80047D64 = 0;
    }
}

s32 get_GameNP(void)
{
    return g_GameNP;
}

void read_version(void)
{
    u8 buf[1024];
    s32 i;
    s32 tmp;
    u8 *p;

    do {
        tmp = cd_fs_read("COUNTRY.TXT", (u32*) buf, 0x400);
    } while (tmp == -1);
    
    g_GameRegion = 0;
    g_GameNP = TV_NTSC;
    if (tmp == -2) return; 
    
    if (buf[0] == 'P') g_GameNP = TV_PAL;
    
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

s32 get_GameRegion(void)
{
    return g_GameRegion;
}

u8* get_VersionStr(void)
{
    if (g_GameIsZ == 0)
        return 0;    
    return g_VersionStr;
}

void game_init(void)
{
    // setup events and handlers
    ResetCallback();
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
    VSyncCallbacks(0, 0);
    vblank_event = enable_vblank_event(regular_run_tasks);
    regular_active(1);

    // setup IO
    func_80019680();
    k_ChangeClearPAD(0);

    // set basic jt functions
#ifdef LOG_JT
    jt_set(_jt_set, 1);
#else
    jt_set(jt_set, 1);
#endif
    jt_set(regular_add, 224);
    jt_set(regular_remove, 225);
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

    // clear global space
    memset((void*) 0x80014000, 0x4000, 0);

    // set reverb
    func_80020F9C(5, 0);

    // audio stuff? no idea
    func_8001FBC0(0);
    func_80020000(0);
}

s32 get_D_80047E6C(void)
{
    return D_80047E6C;
}

void* jt_reset(void)
{
    jt_clear();
    jt_set(func_80019DCC, 0xFF);
    jt_set(get_D_80047E6C, 0x2);
    jt_set(get_file_addr, 0x6);
    return game_init;
}

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
        tcb->regs[2] = (int) game_init;
    }
    else
    {
        tcb->regs[2] = 0;
    }
}

void exception_handler(void)
{
    struct {
        ExCB *excb;
        u32 excb_size;
        PCB *pcb;
        u32 pcb_size;
        TCB (*tcb)[4];   // usually 4?
        u32 tcb_size;
    } *bios_tables = (void*) 0x100;

   // when the exception returns, if v0 is not 0 the exception generating
   // function jumps to it
    bios_tables->pcb->current_tcb->regs[2] = 0;
}

s32 enable_exception_event(void* handler)
{
    s32 event;

    k_EnterCriticalSection();
    // exception event (only cause by the invalid syscall function at the start of every main)
    event = k_OpenEvent(0xF0000010, 0x4000, 0x1000, handler);
    k_EnableEvent(event);
    k_ExitCriticalSection();
    return event;
}

u32 func_80019DCC(void)
{
  return 0x10002;
}

void setNextFile(s32 id)
{
    g_NextFile = id;    
}

s32 getNextFile()
{
    return g_NextFile;
}

u8* getGameConfig()
{
    return 0x80014000;
}

int main(int argc, char** argv)
{
    s32 pad[22];
    s32 rc;
    
    k_printf("MAX ADR:%x\n", k_malloc(4));
    D_80047E6C = 1;

    // initialization
    jt_reset();
    game_init();
    exception_event = enable_exception_event(exception_handler);
    func_80020FC0(&D_80034344);

    // play some sound
    //rc = cd_fs_read("SYS_SE.VAB", &tmpfilebuf, 0);
    while (1) {
        rc = cd_fs_read("SYS_SE.VAB", &tmpfilebuf, 0);
        if (rc > 0 && tmpfilebuf == 0x56414270) break;
        k_printf("VAB file Reload\n");
    }

    //while (1) {
        rc = func_80020D5C(0, &tmpfilebuf, 0);
        //k_printf("RET %d\n", rc);
    //}

    // fade logo?
    func_8001926C();

    // activate debug mode? (it's actually never checked)
    if (call_PadRead(0) == 6) {
        D_80047D50 = 1;
    }

    // # custom stuff:
    // debug mode
    //getGameConfig()[0x517] = 1;
    // give printf
    //jt_set(k_printf, 9);

    // run the game
    setNextFile(0);
    file_execute_loop();

    // shutdowns
    call_wait_frame(0);
    call_SetDispMask(0);
    func_80021600();
    game_shutdown();
    call_ResetGraph(3);
    reset();
    return;
}