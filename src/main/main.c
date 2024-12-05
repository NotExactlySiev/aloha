//#define LOG_JT

#include "common.h"
#include "main.h"
#include <kernel.h>
#include <malloc.h>
#include <stdio.h>
#include <libgpu.h>
#include <string.h>
#include <libetc.h>
#include <shared.h>
#include <libapi.h>
#include "music.h"
// stuff from 1D530.data.s
int D_80047D48 = -2;
int D_80047D4C = 0;
int D_80047D50 = 0;
int D_80047D58 = 0;
int D_80047D64 = 0;

// over

#define DMUSIC(n,i,c,...)   { .name = n, .type = 1, .id = i, .size = 0x24, .unk0 = 16, .unk1 = 0, .file = 1, .chan = c, .loc = __VA_ARGS__ }
MusicList D_80034344 = {
    .count = 66,
    .tracks = {
        DMUSIC("MUSICSYS.STR", 0x01, 0x00, { 0x02, 0x02, 0x95, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x02, 0x01, { 0x03, 0x02, 0x04, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x03, 0x07, { 0x02, 0x14, 0x91, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0xF0, 0x03, { 0x00, 0x03, 0x28, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0xF1, 0x04, { 0x00, 0x03, 0x65, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0xF2, 0x05, { 0x00, 0x09, 0x74, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0xF3, 0x06, { 0x02, 0x03, 0x80, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x20, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x21, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x22, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x23, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x24, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x25, 0x02, { 0x00, 0x13, 0x18, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x30, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x31, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x32, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x33, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x34, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSICSYS.STR", 0x35, 0x03, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x10, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x11, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x12, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x13, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x14, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x15, 0x03, { 0x00, 0x15, 0x41, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x18, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x19, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x1A, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x1B, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x1C, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x1D, 0x04, { 0x00, 0x03, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x40, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x41, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x42, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x43, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x44, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x45, 0x05, { 0x00, 0x07, 0x94, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x50, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x51, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x52, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x53, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x54, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x55, 0x06, { 0x02, 0x53, 0x93, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x60, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x61, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x62, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x63, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x64, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x65, 0x07, { 0x01, 0x00, 0x00, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x70, 0x00, { 0x03, 0x12, 0x24, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x71, 0x01, { 0x03, 0x11, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W1.STR", 0x72, 0x02, { 0x02, 0x58, 0x57, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x73, 0x00, { 0x02, 0x47, 0x69, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x74, 0x01, { 0x03, 0x23, 0x39, 0xC9 }),
        DMUSIC("MUSIC_W2.STR", 0x75, 0x02, { 0x03, 0x04, 0x90, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x76, 0x00, { 0x03, 0x03, 0x63, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x77, 0x01, { 0x03, 0x30, 0x54, 0xC9 }),
        DMUSIC("MUSIC_W3.STR", 0x78, 0x02, { 0x03, 0x03, 0x76, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x79, 0x00, { 0x02, 0x54, 0x55, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x7A, 0x01, { 0x03, 0x00, 0x18, 0xC9 }),
        DMUSIC("MUSIC_W4.STR", 0x7B, 0x02, { 0x02, 0x56, 0x66, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x7C, 0x00, { 0x03, 0x22, 0x04, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x7D, 0x01, { 0x03, 0x22, 0x14, 0xC9 }),
        DMUSIC("MUSIC_W5.STR", 0x7E, 0x02, { 0x02, 0x43, 0x26, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x7F, 0x00, { 0x03, 0x07, 0x83, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x80, 0x01, { 0x02, 0x54, 0x44, 0xC9 }),
        DMUSIC("MUSIC_W6.STR", 0x81, 0x02, { 0x03, 0x04, 0x07, 0xC9 }),
    }
};

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
s32 next_exec = 0;
s32 game_region = 0;
u32 tv_system = MODE_NTSC;
s32 g_GameIsZ = 0;

void* D_80048044;       // hold return for _start
s32 D_80047E6C;         // 80047e6c
s32 D_80047E70;         // 80047e70
s32 vblank_event;          // 80047e74
s32 exception_event;          // 80047e7c
char version_string[20];


s32     cd_file_read(const char* addr, void* buf, s32 mode);
void    wait_frame();   // TODO: args?
void    execute_compressed(u32* addr, u32 stack);
s32     execute_uncompressed(char* file, s32 param);

// boot.h
void reset(void);

void file_execute_loop(void)
{
    u32 *addr;

    while (1) {
        if (g_CurrFile == -1) g_CurrFile = 0;

        addr = g_Files[g_CurrFile].header;
        printf("now executing: %s\n", g_Files[g_CurrFile].addr);
        if (addr != NULL) {
            // if addr isn't NULL, it's compressed
            if ((u32) addr & 1) {
                addr = (u32*) ((u32) addr & ~0xF);
                while (cd_file_read(g_Files[g_CurrFile].addr, addr, 0) < 0) {
                    printf("Exec File Read Error\n");
                }

                while (addr[0] != 0x582D5350 || addr[1] != 0x45584520) {
                    cd_file_read(g_Files[g_CurrFile].addr, addr, 0);
                    printf("Exec File Read Error\n");
                }
            }
            execute_compressed(addr, 0);
        } else {
            // otherwise it's uncompressed and execute it normally
            execute_uncompressed(g_Files[g_CurrFile].addr, 0);
        }
        g_CurrFile = get_next_exec();
        
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

s32 get_D_80047D4C(void)
{
    return D_80047D4C;
}

void set_D_80047D4C(s32 arg0)
{
    if (arg0 != 0)
        D_80047D4C = 1;
    else
        D_80047D4C = 0;
}

void show_logo(void)
{
    DRAWENV drawenv;
    DISPENV dispenv;
    POLY_FT4 polys[5];
    TILE tile;
    RECT rect;
    s16 left;
    s32 i;
    s32 col;
    s32 tmp;
    s32 tex_x;
    s32 y;
    u32 h;

    // set the enviroment
    // TODO: should I get rid of the  stuff? They do nothing
    SetDefDrawEnv(&drawenv, 0, 0, 0x280, 0x1E0);
    SetDefDispEnv(&dispenv, 0, 0, 0x280, 0x1E0);
    drawenv.isbg = 0;
    drawenv.dtd = 1;
    drawenv.dfe = 1;
    dispenv.pad0 = 0;
    if (get_video_mode() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y += 24;
    }
    PutDrawEnv(&drawenv);
    PutDispEnv(&dispenv);
    DrawSync(0);
    
    // clear the screen with black
    //SetBlockFill(&tile);
    //setBlockFill(&tile);
    // switching to psyq 4.7, for some reason doesn't have this
    setlen(&tile, 3),  setcode(&tile, 0x02);

    tile.r0 = 0; tile.g0 = 0; tile.b0 = 0;
    tile.x0 = 0; tile.y0 = 0;
    tile.w = 640; tile.h = 480;
    DrawPrim(&tile);
    DrawSync(0);
    
    do {
        tmp = cd_file_read("WARNING.PRS", (u32* )0x80100000, 0); //read file
    } while (tmp == -1);

    if (tmp >= 0) {       
        // TODO: maybe a #define POLYCOUNT 4 so I don't have to 
        // repeat 4? just put POLYCOUNT in the macros 
        MAKE_QUADS(64, 0, 128, 480, 0, 0, 128, 480, 64, 4);
        LOAD_PRS(&tmpfilebuf, 256, 240);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        SetDispMask(1); // set disp mask to show it
        
        FADE_IN(4,4);
        
        DrawSync(0);
        wait_frame(0);
        
        SET_POLYS_COL(128,4);
        SLEEP_FRAMES(300);
        
        FADE_OUT(4,4);
    }
    
    wait_frame(0);
    SetDispMask(0);
    
    do {
        D_80047D48 = cd_file_read("TITLE.PRS", (u32* )0x80100000, 0);  // read file
    } while (D_80047D48 == -1);

    if (D_80047D48 == -2) {
        MAKE_QUADS(64, 192, 128, 96, 0, 0, 128, 96, 64, 4);
        LOAD_PRS(&D_80032FFC, 256, 96);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        SetDispMask(1);
        
        FADE_IN(4,4);
    } else {
        if (get_region() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        LOAD_PRS(&tmpfilebuf, 320, 240);
        SLEEP_FRAMES(10);
        
        wait_frame(0);
        SetDispMask(1);
        
        FADE_IN(4,5);
    }
}

void func_8001926C(void)
{
    DRAWENV drawenv;
    DISPENV dispenv;
    POLY_FT4 polys[5];
    s32 i;
    s32 left, tex_x;
    s32 y, h;
    u32 col;

    SetDefDrawEnv(&drawenv, 0, 0, 0x280, 0x1E0);
    SetDefDispEnv(&dispenv, 0, 0, 0x280, 0x1E0);
    drawenv.isbg = 0;
    drawenv.dtd = 1;
    drawenv.dfe = 1;
    dispenv.pad0 = 0;
    if (get_video_mode() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y = (u16) dispenv.screen.y + 0x18;
    }
    PutDrawEnv(&drawenv);
    PutDispEnv(&dispenv);

    if (D_80047D48 == -2) {
        MAKE_QUADS(64, 192, 128, 96, 0, 0, 128, 96, 64, 4);
        FADE_OUT(4,4);
    } else {
        if (get_region() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        
        MAKE_QUADS(0, y, 128, h, 0, 0, 128, 240, 64, 5);
        FADE_OUT(4,5);
    }
    
    wait_frame(0);
    SetDispMask(0);
    SetDefDrawEnv(&drawenv, 0, 0, 0x140, 0xF0);
    SetDefDispEnv(&dispenv, 0, 0, 0x140, 0xF0);
    dispenv.pad0 = 0;
    if (get_video_mode() == 1) {
        dispenv.pad0 = 1;
        dispenv.screen.y = (u16) dispenv.screen.y + 0x18;
    }
    drawenv.isbg = 1;
    drawenv.r0 = 0;
    drawenv.g0 = 0;
    drawenv.b0 = 0;

    DrawSync(0);
    wait_frame(0);
    PutDrawEnv(&drawenv);
    PutDispEnv(&dispenv);
    
    DrawSync(0);
    wait_frame(0);
    PutDrawEnv(&drawenv);
    PutDispEnv(&dispenv);
}

void init_everything(void)
{
    cd_init();
    read_version();

    wait_frame(0);
    SetVideoMode(get_video_mode() != 0);

    wait_frame(0);
    call_ResetGraph(0);
    call_SetGraphDebug(0);
    call_SetDispMask(0);

    // spu set defaults
    func_8001DD7C();

    gpu_init();
    show_logo();
    pad_init();
    mc_init();
    misc_init();
    sfx_init();
    fnt_init();
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
    CloseEvent(exception_event);
    StopRCnt(0xF2000000);
    StopRCnt(0xF2000001);
    StopRCnt(0xF2000002);
    StopRCnt(0xF2000003);
}

s32 enable_vblank_event(void* handler)
{
    s32 event;
    EnterCriticalSection();
    event = OpenEvent(RCntCNT3, EvSpINT, EvMdINTR, handler);
    SetRCnt(RCntCNT3, 1, EvMdINTR);
    StartRCnt(RCntCNT3);
    EnableEvent(event);
    ExitCriticalSection();
    return event;
}

void disable_vblank_event(s32 event)
{
    EnterCriticalSection();
    StopRCnt(RCntCNT3);
    CloseEvent(event);
    ExitCriticalSection();
}

void nop(void) {}

void flush_cache_safe(void)
{
    EnterCriticalSection();
    FlushCache();
    ExitCriticalSection();
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

void jt_set(void* func, s32 idx) {
    void** jmptable = (void**) &jt;
    jmptable[idx] = KSEG0(func);
    flush_cache_safe();
}

void vblank_disable(void)
{
    if (D_80047D64 != 1) {
        disable_vblank_event(vblank_event);
        D_80047D64 = 1;
    }
}

s32 vblank_enable(void)
{
    s32 ret = 0;
    if (D_80047D64 != 0) {
        vblank_event = enable_vblank_event(tasks_tick);
        ret = vblank_event;
        D_80047D64 = 0;
    }
    return ret;
}

s32 get_video_mode(void)
{
    return tv_system;
}

void read_version(void)
{
    int rc;
    u8 buf[1024];
    do {
        rc = cd_file_read("COUNTRY.TXT", buf, sizeof(buf));
    } while (rc == -1);
    
    game_region = 0;
    tv_system = MODE_NTSC;
    if (rc == -2)
        return;
    
    if (buf[0] == 'P')
        tv_system = MODE_PAL;
    
    if (buf[1] == 'U')
        game_region = 1;
    else if (buf[1] == 'E')
        game_region = 2;
    
    if (buf[1] == 'Z') {
        game_region = 3;
        for (int i = 0; i < 12; i++)
            version_string[i] = buf[2 + i];
        strcpy("EXACT01", &version_string[12]);
        g_GameIsZ = 1;
    }
}

s32 get_region(void)
{
    return game_region;
}

char *get_version_string(void)
{
    if (g_GameIsZ == 0)
        return 0;    
    return version_string;
}

void game_init(void)
{
    // setup events and handlers
    ResetCallback();
    StopRCnt(RCntCNT0);
    StopRCnt(RCntCNT1);
    StopRCnt(RCntCNT2);
    StopRCnt(RCntCNT3);
    VSyncCallbacks(0, 0);
    vblank_event = enable_vblank_event(tasks_tick);
    tasks_set_enabled(1);

    // subsystems
    init_everything();
    ChangeClearPAD(0);

    // basic engine calls
    jt_set(jt_set, 1);
    jt_set(tasks_add, 224);
    jt_set(tasks_remove, 225);
    jt_set(decode_rle, 192);
    jt_set(decode_lz1, 193);
    jt_set(set_next_exec, 3);
    jt_set(get_next_exec, 4);
    jt_set(globals, 5);
    jt_set(get_video_mode, 7);
    jt_set(get_region, 8);
    jt_set(get_D_80047D4C, 9);
    jt_set(set_D_80047D4C, 10);
    jt_set(get_version_string, 11);

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

    EnterCriticalSection();
    // exception event (only cause by the invalid syscall function at the start of every main)
    event = OpenEvent(0xF0000010, 0x4000, EvMdINTR, handler);
    EnableEvent(event);

    ExitCriticalSection();
    return event;
}

u32 func_80019DCC(void)
{
  return 0x10002;
}

void set_next_exec(s32 id)
{
    next_exec = id;    
}

s32 get_next_exec(void)
{
    return next_exec;
}

GlobalData *globals(void)
{
    return (GlobalData*) 0x80014000;
}

int main(int argc, char** argv)
{
    printf("MAX ADR:%x\n", malloc(4));
    D_80047E6C = 1;

    // initialization
    jt_reset();
    game_init();
    exception_event = enable_exception_event(exception_handler);
    music_set_list(&D_80034344);

    while (1) {
        int rc = cd_file_read("SYS_SE.VAB", &tmpfilebuf, 0);
        if (rc > 0 && tmpfilebuf == 0x56414270) break;
        printf("VAB file Reload\n");
    }
    sfx_load_vab(0, &tmpfilebuf, 0);
    
    // fade logo?
    func_8001926C();

    // activate debug mode? (it's actually never checked)
    if (PadRead(0) == (PADL1 | PADR2)) {
        D_80047D50 = 1;
    }

    // # custom stuff:
    globals()->debug_features = 1;
    jt_set(printf, 1001);

    // run the game
    set_next_exec(0);
    file_execute_loop();

    // shutdowns
    wait_frame(0);
    SetDispMask(0);
    func_80021600();
    game_shutdown();
    ResetGraph(3);
    reset();
}
