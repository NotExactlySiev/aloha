#include "common.h"
#include "shared.h"
#include <kernel.h>

//#define LOG_JT

#define KSEG0(x)    ((void*) (((u32) (x) & 0x0FFFFFFF) | 0x80000000))

#define    SLEEP_FRAMES(f)    for (i = 0; i < f; i++) wait_frame(0);

// TODO: why are these in the header?
#define    SET_POLYS_COL(c,n)    { DrawSync(0); wait_frame(0); for (i = 0; i < n; i += 1)                     \
            { polys[i].r0 = c; polys[i].g0 = c; polys[i].b0 = c;           \
            DrawPrim(&polys[i]); } }
#define    LOAD_PRS(p,W,H)    lz1_decode(((u8*) p)+4, (u8* )0x80060000);    \
            rect.x = 640; rect.y = 256; rect.w = 256; rect.h = 1;                 \
            LoadImage(&rect, (void*) 0x80060014);  DrawSync(0);                   \
            rect.x = 640; rect.y = 0; rect.w = W; rect.h = H;                 \
            LoadImage(&rect, (void*) 0x80060220);  DrawSync(0)
#define    FADE_IN(step,n)   for (col = 0; col < 128; col += step) SET_POLYS_COL(col,n);
#define    FADE_OUT(step,n)   for (col = 128; col > 0; col -= step) SET_POLYS_COL(col,n);
#define    MAKE_QUADS(x, y, w, h, u, v, tw, th, td, n)    left = x; tex_x = 0x280;                   \
            for (i=0; i < n; i++) { SetPolyFT4(&polys[i]); SetShadeTex(&polys[i], 0);     \
            polys[i].tpage = GetTPage(1, 1, tex_x, 0); polys[i].clut = GetClut(0x280, 0x100);                \
            setUVWH(polys+i, u, v, tw, th);  \
            setXYWH(polys+i, left, y, w, h); \
            left += w; tex_x += td; }

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
void lz1_decode(void*, void*);
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
    int _pad2[9];
} TCB;

typedef struct {
    TCB* current_tcb;
} PCB;

void file_execute_loop(void);               
char* get_file_addr(s32 idx);
s32 func_80018A6C(void);
s32 func_80018A7C(void);
void func_80018A8C(s32 arg0);
void func_80018AB4(void);
void func_8001926C(void);
void func_80019680(void);
void game_shutdown(void);
s32 enable_vblank_event(void*);
void disable_vblank_event(s32);
void nop(void);
void flush_cache_safe(void);
void jt_clear(void);
#ifdef  LOG_JT
void _jt_set(void*, s32, const char*);
#define     jt_set(func, idx)   _jt_set(func, idx, #func)
#else
void jt_set(void*, s32);
#endif
void func_80019948(void);
void func_80019990(void);
s32 get_GameNP(void);
void read_version(void);
s32 get_GameRegion(void);
char *get_VersionStr(void);
void game_init(void);
s32 get_D_80047E6C(void);
void* jt_reset(void);
void func_80019D0C(void);
void exception_handler(void);
s32 enable_exception_event(void*);
u32 func_80019DCC(void);
void setNextFile(s32);
s32 getNextFile(void);
GlobalData *getGameConfig(void);
int main(int, char**);