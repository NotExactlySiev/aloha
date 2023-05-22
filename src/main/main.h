#include "common.h"

#define KSEG0(x)    ((void*) (((u32) (x) & 0x0FFFFFFF) | 0x80000000))

typedef struct {                   
    u32 pc0;      
    u32 gp0;      
    u32 t_addr;   
    u32 t_size;   
    u32 d_addr;   
    u32 d_size;   
    u32 b_addr;   
    u32 b_size;   
	u32 s_addr;
	u32 s_size;
	u32 sp,fp,gp,ret,base;
} EXEC;

typedef struct {
    char magic[16];     // 0x10 0x00
    EXEC header;        // 0x3C 0x10
    char filler[0x7B4]; // 7B4  0x4C
    u32 unk;            // 4    0x800
    u8 data;            // ???  0x804
} compexec_t;


typedef struct {
    void* header;
    char* addr;
} file_t;


void nop(void);
void flush_cache_safe(void);
void jt_clear(void);
void jt_set(void*, s32);

void jt_series1(void);
void func_80023144(void);
void func_800231CC(void);
void func_800232D4(void);
void rle_decode(s32, u8*, u8*);
void lz1_decode(u8*, u8*);
void setNextFile(s32);
s32 getNextFile(void);
u8* getGameConfig(void);
s32 func_800199D4(void);
s32 func_80019AE8(void);
u8* func_80019AF8(void);
void func_80019D64(void);
s32 func_8001C780(char*, u32*, s32);


u32 func_80019DCC(void);
void reboot(char*, char*);



void* jmptable[1024];   // 80010000
u8 g_GameConfig[1280];  // 80014000
file_t g_Files[42];     // 800318b8
s32 D_80034344;         // 80034344
u32 g_GameNP;           // 80047d44

s32 D_80047D4C;         // 80047d4c
s32 D_80047D50;         // 80047d50
s32 g_GameIsZ;          // 80047d54
s32 D_80047D58;         // 80047d58
s32 g_NextFile;         // 80047d5c

s32 g_GameRegion;       // 80047d64
s32 D_80047E6C;         // 80047e6c
s32 tim3event;          // 80047e74
s32 excpevent;          // 80047e7c
u8 g_VersionStr[20];    // 80048048
u32 tmpfilebuf;         // 80100000

char kernelbuf[8]; // TODO: A000DF00

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

