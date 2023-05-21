#include "common.h"

#define KSEG0(x)    (((u32) (x) & 0x0FFFFFFF) | 0x80000000)

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

void func_80019B1C(void);
u32 func_80019DCC(void);
void reboot(char*, char*);



void* jmptable[1024];   // 80010000
u8 g_GameConfig[1280];  // 80014000
s32 D_80047D4C;         // 80047d4c
s32 D_80047D50;         // 80047d50

s32 g_NextFile;         // 80047d5c

s32 D_80047E6C;         // 80047e6c

file_t g_Files[42];
char kernelbuf[8]; // TODO: A000DF00
