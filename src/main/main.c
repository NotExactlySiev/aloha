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
#include "tasks.h"
#include "decode.h"

u32 saved_ra;

// stuff from 1D530.data.s
int D_80047D48 = -2;
int widescreen = 0;
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
s32 dev_mode = 0;

s32 D_80047E6C;         // 80047e6c
s32 D_80047E70;         // 80047e70
s32 vblank_event;          // 80047e74
s32 exception_event;          // 80047e7c
char mc_file_name[20];


s32     iso_read(const char* addr, void* buf, s32 mode);
void    wait_frame();   // TODO: args?
void    execute_compressed(u32* addr, u32 stack);
s32     iso_exec(char* file, s32 param);

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
                while (iso_read(g_Files[g_CurrFile].addr, addr, 0) < 0) {
                    printf("Exec File Read Error\n");
                }

                while (addr[0] != 0x582D5350 || addr[1] != 0x45584520) {
                    iso_read(g_Files[g_CurrFile].addr, addr, 0);
                    printf("Exec File Read Error\n");
                }
            }
            execute_compressed(addr, 0);
        } else {
            // otherwise it's uncompressed and execute it normally
            iso_exec(g_Files[g_CurrFile].addr, 0);
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

s32 get_widescreen(void)
{
    return widescreen;
}

void set_widescreen(s32 arg0)
{
    if (arg0 != 0)
        widescreen = 1;
    else
        widescreen = 0;
}

// move splash.c to another file?
static inline sleep_frames(int n)
{
    for (int i = 0; i < n; i++)
        wait_frame(0);
}

// draw_polys
static inline SET_POLYS_COL(u8 c, POLY_FT4 *p, int n)
{
    DrawSync(0);
    wait_frame(0);
    for (int i = 0; i < n; i++) {
        setRGB0(&p[i], c, c, c);
        DrawPrim(&p[i]);
    }
}

#define LOGO_FADE_STEP  4

static inline void FADE_IN(POLY_FT4 *p, int n)
{
    for (u8 col = 0; col < 128; col += LOGO_FADE_STEP) 
        SET_POLYS_COL(col, p, n);
}

static inline void FADE_OUT(POLY_FT4 *p, int n)
{
    for (u8 col = 128; col > 0; col -= LOGO_FADE_STEP) 
        SET_POLYS_COL(col, p, n);
}

static inline void MAKE_QUADS(POLY_FT4 *polys, int n, int x, int y, int w, int h, int u, int v, int tw, int th, int td)
{
    int left = x;
    int tex_x = 0x280;
    for (int i = 0; i < n; i++) { 
        SetPolyFT4(&polys[i]);
        SetShadeTex(&polys[i], 0);
        polys[i].tpage = GetTPage(1, 1, tex_x, 0);
        polys[i].clut = GetClut(0x280, 0x100);
        setUVWH(polys+i, u, v, tw, th);
        setXYWH(polys+i, left, y, w, h);
        left += w; tex_x += td;
    }
}

static inline void LOAD_PRS(u8 *dst, short w, short h)
{
    decode_lz1(dst+4, (u8* )0x80060000);
    LoadImage(&(RECT){ 640, 256, 256, 1 }, (void*) 0x80060014);
    DrawSync(0);
    LoadImage(&(RECT){ 640, 0, w, h }, (void*) 0x80060220);
    DrawSync(0);
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
        tmp = iso_read("WARNING.PRS", (u32* )0x80100000, 0); //read file
    } while (tmp == -1);

    if (tmp >= 0) {       
        // TODO: maybe a #define POLYCOUNT 4 so I don't have to 
        // repeat 4? just put POLYCOUNT in the macros 
        MAKE_QUADS(polys, 4, 64, 0, 128, 480, 0, 0, 128, 480, 64);
        LOAD_PRS(&tmpfilebuf, 256, 240);
        //SLEEP_FRAMES(10);
        sleep_frames(10);
        
        wait_frame(0);
        SetDispMask(1); // set disp mask to show it
        
        FADE_IN(polys,4);
        
        DrawSync(0);
        wait_frame(0);
        
        SET_POLYS_COL(128, polys, 4);
        sleep_frames(300);
        
        FADE_OUT(polys, 4);
    }
    
    wait_frame(0);
    SetDispMask(0);
    
    do {
        D_80047D48 = iso_read("TITLE.PRS", (u32* )0x80100000, 0);  // read file
    } while (D_80047D48 == -1);

    if (D_80047D48 == -2) {
        MAKE_QUADS(polys, 4, 64, 192, 128, 96, 0, 0, 128, 96, 64);
        LOAD_PRS(&D_80032FFC, 256, 96);
        sleep_frames(10);
        
        wait_frame(0);
        SetDispMask(1);
        
        FADE_IN(polys, 4);
    } else {
        if (get_region() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        MAKE_QUADS(polys, 5, 0, y, 128, h, 0, 0, 128, 240, 64);
        LOAD_PRS(&tmpfilebuf, 320, 240);
        sleep_frames(10);
        
        wait_frame(0);
        SetDispMask(1);
        
        FADE_IN(polys, 5);
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
        MAKE_QUADS(polys, 64, 4, 192, 128, 96, 0, 0, 128, 96, 64);
        FADE_OUT(polys, 4);
    } else {
        if (get_region() == 1) { y = 120; h = 240; } 
        else { y = 0; h = 480; }
        
        MAKE_QUADS(polys, 5, 0, y, 128, h, 0, 0, 128, 240, 64);
        FADE_OUT(polys, 5);
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
    cd_stop();
    cd_flush();
    func_8001A74C();
    mc_deinit();
    func_8001DE98();
    StopCallback();
    PadStop();
    disable_vblank_event(vblank_event);
    CloseEvent(exception_event);
    StopRCnt(RCntCNT0);
    StopRCnt(RCntCNT1);
    StopRCnt(RCntCNT2);
    StopRCnt(RCntCNT3);
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
        rc = iso_read("COUNTRY.TXT", buf, sizeof(buf));
    } while (rc == -1);
    
    game_region = REGION_JAPAN;
    tv_system = MODE_NTSC;
    if (rc == -2)
        return;
    
    if (buf[0] == 'P')
        tv_system = MODE_PAL;
    
    if (buf[1] == 'U')
        game_region = REGION_USA;
    else if (buf[1] == 'E')
        game_region = REGION_EUROPE;
    
    // in dev mode, the MC file uses a custom name read from COUNTRY.TXT
    if (buf[1] == 'Z') {
        game_region = REGION_DEBUG;
        for (int i = 0; i < 12; i++)
            mc_file_name[i] = buf[2 + i];
        strcpy("EXACT01", &mc_file_name[12]);
        dev_mode = 1;
    }
}

s32 get_region(void)
{
    return game_region;
}

// this is the save file name for the debug version
char *get_mc_file_name(void)
{
    if (dev_mode == 0)
        return 0;    
    return mc_file_name;
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
    jt_set(get_widescreen, 9);
    jt_set(set_widescreen, 10);
    jt_set(get_mc_file_name, 11);

    // clear global space
    memset((void*) 0x80014000, 0x4000, 0);

    // set reverb
    snd_set_reverb(5, 0);

    // audio stuff? no idea
    sfx_set_reverb(0);
    mc_select_slot(0);
}

s32 get_engine_running(void)
{
    return D_80047E6C;
}

void* jt_reset(void)
{
    jt_clear();
    jt_set(get_engine_version, 255);
    jt_set(get_engine_running, 2);
    jt_set(get_file_addr, 6);
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
    } else {
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

u32 get_engine_version(void)
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
        int rc = iso_read("SYS_SE.VAB", &tmpfilebuf, 0);
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
    snd_reset();
    game_shutdown();
    ResetGraph(3);
    reset();
}
