#include "common.h"
#include "libapi.h"
#include "shared.h"
#include <kernel.h>

#define KSEG0(x) ((void *)(((u32)(x) & 0x0FFFFFFF) | 0x80000000))

typedef struct {
    char magic[16]; // 0x10 0x00
    EXEC header; // 0x3C 0x10
    char filler[0x7B4]; // 7B4  0x4C
    u32 expected_size; // 4    0x800
    u8 data; // ???  0x804
} compexec_t;

typedef struct {
    void *header;
    char *addr;
} file_t;

extern u32 tmpfilebuf;

// These are probably extern:
extern u8 D_80032FFC; // builtin intro prs image
extern s32 widescreen; // 80047d4c
extern s32 D_80047D50; // 80047d50
extern s32 D_80047D58; // 80047d58
extern s32 D_80047D64;
extern s32 D_80047D48;

typedef struct ExCB ExCB;
typedef struct TCB TCB;

typedef struct {
    TCB *current_thread;
} PCB;

void file_execute_loop(void);
char *get_file_addr(s32 idx);
s32 func_80018A6C(void);
s32 get_widescreen(void);
void set_widescreen(s32 arg0);
void show_logo(void);
void func_8001926C(void);
void init_everything(void);
void game_shutdown(void);
s32 enable_vblank_event(void *);
void disable_vblank_event(s32);
void nop(void);

// The Japanese version forgets to enter a critical section before flushing
// the cache. It doesn't have this function and calls FlushCache() directly.
#ifdef VERSION_WORLD
void flush_cache_safe(void);
#else
static void flush_cache_safe(void) { return FlushCache(); }
#endif

void vblank_disable(void);
s32 vblank_enable(void);
s32 get_video_mode(void);
void read_version(void);
s32 get_region(void);
char *get_mc_file_name(void);
void game_init(void);
s32 get_engine_running(void);
u32 get_engine_version(void);
void set_next_exec(s32);
s32 get_next_exec(void);
GlobalData *globals(void);
