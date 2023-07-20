#include "common.h"
#include <kernel.h>

//#define EXTRA_FEATURES

#define KSEG0(x)    ((void*) (((u32) (x) & 0x0FFFFFFF) | 0x80000000))

#define    SLEEP_FRAMES(f)    for (i = 0; i < f; i++) wait_frame(0);
#define    SET_POLYS_COL(c)    { DrawSync(0); wait_frame(0); for (i = 0; i < 4; i += 1)                     \
            { polys[i].r0 = c; polys[i].g0 = c; polys[i].b0 = c;           \
            DrawPrim(&polys[i]); } }
#define    LOAD_PRS(p,W,H)    lz1_decode(p+4, (u8* )0x80060000);    \
            rect.x = 640; rect.y = 256; rect.w = 256; rect.h = 1;                 \
            LoadImage(&rect, (void*) 0x80060014);  DrawSync(0);                   \
            rect.x = 640; rect.y = 0; rect.w = W; rect.h = H;                 \
            LoadImage(&rect, (void*) 0x80060220);  DrawSync(0)
#define    FADE_IN(step)   for (col = 0; col < 128; col += step) SET_POLYS_COL(col);
#define    FADE_OUT(step)   for (col = 128; col > 0; col -= step) SET_POLYS_COL(col);
#define    MAKE_QUADS(x, y, w, h, u, v, tw, th, td, n)    left = x; rght = x + w; tex_x = 0x280;                   \
            for (i=0; i < n; i++) { SetPolyFT4(&polys[i]); SetShadeTex(&polys[i], 0);     \
            polys[i].tpage = GetTPage(1, 1, tex_x, 0); polys[i].clut = GetClut(0x280, 0x100);                \
            polys[i].u0 = u; polys[i].v0 = v; polys[i].u1 = u+tw; polys[i].v1 = v;                            \
            polys[i].u2 = u; polys[i].v2 = v+th; polys[i].u3 = u+tw; polys[i].v3 = v+th;                     \
            polys[i].x0 = left; polys[i].y0 = y; polys[i].x1 = rght; polys[i].y1 = y;                        \
            polys[i].x2 = left; polys[i].y2 = y+h; polys[i].x3 = rght; polys[i].y3 = y+h;                \
            rght += w; left += w; tex_x += td; }

typedef struct {
    char magic[16];     // 0x10 0x00
    EXEC header;        // 0x3C 0x10
    char filler[0x7B4]; // 7B4  0x4C
    u32 expected_size;  // 4    0x800
    u8 data;            // ???  0x804
} compexec_t;


typedef struct {
    void* header;
    char* addr;
} file_t;

// TODO: these should be in headers for their own files
void regular_add(void);
void regular_remove(void);
void regular_run_tasks(void);
void rle_decode(s32, u8*, u8*);
void lz1_decode(const u8*, u8*);
void reboot(char*, char*);

extern u32 tmpfilebuf;
extern u8 kernelbuf[8];
extern void* jmptable[1024];
extern u8 g_GameConfig[1280];

// These are probably extern:
extern u8 D_80032FFC;          // builtin intro prs image
extern u8 D_80033000;          // builtin logo data, const
extern s32 D_80034344;         // 80034344
extern s32 D_80047D4C;         // 80047d4c
extern s32 D_80047D50;         // 80047d50
extern s32 D_80047D58;         // 80047d58
extern s32 D_80047D64;
extern s32 D_80047D48;

// .data

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
u32 g_GameNP = 0;
s32 g_GameIsZ = 0;

// .bss
void* D_80048044;       // hold return for _start
s32 D_80047E6C;         // 80047e6c
s32 D_80047E70;         // 80047e70
s32 tim3event;          // 80047e74
s32 excpevent;          // 80047e7c
char g_VersionStr[20];



typedef struct {
    int* elements;
    int _pad;
} ExCB;

typedef struct {
    int status;
    int _pad;
    int regs[32];
    int epc;
    int hi, lo;
    int sr;
    int cause;
    int _pad2;
} TCB;

typedef struct {
    TCB* current_tcb;
} PCB;

void func_800188C8(void);               
char* get_file_addr(s32 idx);
s32 func_80018A6C(void);
s32 func_80018A7C(void);
void func_80018A8C(s32 arg0);
void func_80018AB4(void);
void func_8001926C(void);
void func_80019680(void);
void game_shutdown(void);
s32 enable_timer3_event(void*);
void disable_timer3_event(s32);
void nop(void);
void flush_cache_safe(void);
void jt_clear(void);
#ifdef  EXTRA_FEATURES
void jt_set(void*, s32, char*);
#define   jt_set(func, idx)   jt_set(func, idx, #func)
#else
void jt_set(void*, s32);
#endif
void func_80019948(void);
void func_80019990(void);
s32 get_GameNP(void);
void read_version(void);
s32 get_GameRegion(void);
u8* get_VersionStr(void);
void jt_series1(void);
s32 get_D_80047E6C(void);
void* jt_reset(void);
void func_80019D0C(void);
void func_80019D64(void);
s32 enable_exception_event(void*);
u32 func_80019DCC(void);
void setNextFile(s32);
s32 getNextFile();
u8* getGameConfig();
int main(int, char**);