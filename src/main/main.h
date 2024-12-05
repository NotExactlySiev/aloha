#include "common.h"
#include "shared.h"
#include <kernel.h>

#define KSEG0(x)    ((void*) (((u32) (x) & 0x0FFFFFFF) | 0x80000000))

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
void reboot(char*, char*);
long call_SpuMalloc(long size);
long call_SpuMallocWithStartAddr(unsigned long addr, long size);
void call_SpuFree(unsigned long addr);
void set_voice_attr(SpuVoiceAttr* arg0);

extern u32 tmpfilebuf;
extern u8 kernelbuf[8];
extern void* jmptable[1024];
extern u8 g_GameConfig[1280];

// These are probably extern:
extern u8 D_80032FFC;          // builtin intro prs image
extern u8 D_80033000;          // builtin logo data, const
extern s32 D_80047D4C;         // 80047d4c
extern s32 D_80047D50;         // 80047d50
extern s32 D_80047D58;         // 80047d58
extern s32 D_80047D64;
extern s32 D_80047D48;

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
s32 get_D_80047D4C(void);
void set_D_80047D4C(s32 arg0);
void show_logo(void);
void func_8001926C(void);
void init_everything(void);
void game_shutdown(void);
s32 enable_vblank_event(void*);
void disable_vblank_event(s32);
void nop(void);
void flush_cache_safe(void);
void jt_clear(void);
void jt_set(void*, s32);
void vblank_disable(void);
s32 vblank_enable(void);
s32 get_video_mode(void);
void read_version(void);
s32 get_region(void);
char *get_version_string(void);
void game_init(void);
s32 get_engine_running(void);
void* jt_reset(void);
void func_80019D0C(void);
void exception_handler(void);
s32 enable_exception_event(void*);
u32 get_engine_version(void);
void set_next_exec(s32);
s32 get_next_exec(void);
GlobalData *globals(void);
int main(int, char**);
