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


void* jmptable[1024];   // 80010000
u8 g_GameConfig[1280];  // 80014000
s32 D_80047D4C;         // 80047d4c
s32 D_80047D50;         // 80047d50

s32 g_NextFile;         // 80047d5c

s32 D_80047E6C;         // 80047e6c


file_t g_Files[42];




// 2 file execute functions (loop and get address)
INCLUDE_ASM("asm/nonmatchings/10C8", func_800188C8); // execute loop

char* get_file_addr(s32 idx) {
    if (idx > 42) return 0;
    return g_Files[idx].addr;
}

s32 func_80018A6C(void) {
    return D_80047D50;
}

s32 func_80018A7C(void) {
    return D_80047D4C;
}

void func_80018A8C(s32 arg0) {
    if (arg0 != 0)
        D_80047D4C = 1;
    else
        D_80047D4C = 0;
}


// 2 very massive functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80018AB4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001926C);

// some setup thing
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019680);

// 3 timer event functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001972C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800197C8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001983C);


void nop(void) {}

void flush_cache_safe(void) {
    k_EnterCriticalSection();
    k_FlushCache();
    k_ExitCriticalSection();
}


// NONMATCHING
void jt_clear(void) {
   
    int i;
    for (i = 0; i < 1024; i++)
    {
        jmptable[i] = KSEG0((u32) nop);
    }
    flush_cache_safe();
}

// NONMATCHING
void jt_set(void* func, s32 idx) {
    jmptable[idx] = KSEG0(func);
    flush_cache_safe();
}

// 2 timer functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019948);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80019990);

// 4 functions related to game version
INCLUDE_ASM("asm/nonmatchings/10C8", func_800199D4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800199E4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80019AE8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80019AF8);

// 1 setup function (sets up jumptable)
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019B1C); // jumptable and interrupts?


s32 get_D_80047E6C(void) {
    return D_80047E6C;
}

void* jt_reset(void) {
    jt_clear();
    jt_set(func_80019DCC, 0xFF);
    jt_set(get_D_80047E6C, 0x2);
    jt_set(get_file_addr, 0x6);
    return func_80019B1C;
}

INCLUDE_ASM("asm/nonmatchings/10C8", func_80019D0C); // has a loop through jt

// 2 exception functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019D64);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80019D78);

u32 func_80019DCC(void) {
  return 0x10002;
}

void setNextFile(s32 id) {
    g_NextFile = id;    
}

s32 getNextFile() {
    return g_NextFile;
}

u8* getGameConfig() { //func_80019DF8
    return &g_GameConfig;
}

// main
INCLUDE_ASM("asm/nonmatchings/10C8", main);



// 1 non obvious function
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019F4C);

// 1 array12 function that also does CD stuff
INCLUDE_ASM("asm/nonmatchings/10C8", func_80019FB8);

// 6 "keep trying" versions of CD functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A16C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A1CC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A22C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A270);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A2C8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A318);

// 4 basic functions related to CD
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A348);

void func_8001A370(void) {
}

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A378);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A380);

// 1 jumptable function set 0x100 to 0x150 (CD stuff)
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A3B8);

// 2 CD functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A74C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A77C);

// 2 unknown functions maybe related to sound?
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A8A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A934);

// 2 almost identical functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001A978);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AA80);

// 2 almost identical functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AB88);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AD0C);

// 9 array12 functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AE90);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AED8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001AF28);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001B020);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001B0A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001B8DC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001B94C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001B9D8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001BA50);

// 2 mathematical timing array12 cd things
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001BB50);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001BD00);

// 2 array12 CD shit functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C03C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C20C);

// 4 array12 basic functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C2F4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C31C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C34C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C374);

// 1 unknown calls other array12 functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C39C);

//// THESE are ALL CD functions in some way
// 10 CD functions based on LIBCD
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C418);    // complete file path and pass

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C4F0);    // get_file_loc

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C564);    // get_file_size

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C5BC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C5F4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C670);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C734);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C780);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C7B4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001C7E8);    // ww_command?

// 2 execution functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CA84);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CCC0);

// 1 basic function
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CD0C);

// 9 array12 functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CD30);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CD68);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CD90);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CDC8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CDF0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CE18);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CE28);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CE58);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CEA0);

// 80047Fxx functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CEC8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001CF38);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D0AC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D104);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D13C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D248);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D288);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D29C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D2AC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D398);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D414);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D440);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D67C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D6AC);

// weird pointer manipulation thing
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D740);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D780);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D840);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001D8B0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DA00);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DB04);

//// CD functions are over

// 1 with a very massive struct
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DD7C);


// 4 simple functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DE98);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DED0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DEF0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DF14);

// 11 basic functions. sound maybe?
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DF78);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DF8C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DFAC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DFCC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001DFEC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E00C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E02C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E04C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E06C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E08C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E0AC);

// 2 almost identical functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E0CC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E17C);

// 9 basic functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E22C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E250);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E274);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E294);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E2B4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E2D4);

void func_8001E2F4(void) {
}

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E2FC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E31C);

// 3 PAD functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E33C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E36C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E38C);

// TODO
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E3D4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E438);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E5BC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E608);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E654);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E744);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E790);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E7B0);

// 1 very massive function
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001E998);

// TODO: don't know what these exactly are but the mess around a lot with data
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001EEA4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001EFAC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F17C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F200);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F4F0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F578);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F5DC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F610);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F64C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F8D4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F918);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F95C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F9A4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001F9EC);

// 6 global var functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FB38);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FB58);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FB78);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FBC0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FBE4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FC34);

// 7 memory card event functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FC5C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FCF4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FD8C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FDF4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FFC4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8001FFD4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020000);

// 17 main memory card functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80020020);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800200C8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8002011C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800201A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020208);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020228);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8002026C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800202A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800202FC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800203AC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020414);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020434);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800205C4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020610);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020630);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800206E4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020808);

// set jumptable and events for memory card stuff 0x280 to 0x2A1
INCLUDE_ASM("asm/nonmatchings/10C8", func_8002092C);

// 2 memory card functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80020C8C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020D5C);

// 11 pretty basic functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80020DC4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020DE8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020E30);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020E40);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020E64);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020E88);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020EB4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020EF0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020F48);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020F9C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80020FC0);

// 2 linked list functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80020FD0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021028);

// 1 global setter function
INCLUDE_ASM("asm/nonmatchings/10C8", func_800210D4);

// 2 almost identical functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_800210E4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800211F0);

// 2 basic global setters
INCLUDE_ASM("asm/nonmatchings/10C8", func_800212FC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021310);

// 2 almost identical functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80021320);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021490);

// 2 very unknown functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80021600);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021740);

void execute_compressed(compexec_t* buf, u32 stack) {
    EXEC header;
    __builtin_memcpy(&header, buf+4, sizeof header);
    lz1_decode(&buf->data, header.t_addr);
    flush_cache_safe();
    header.s_addr = stack;
    k_Exec(&header, 1, 0);
}


// 6 memory card functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_800218A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800218B0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800218DC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800219DC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021BCC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021D08);

// 1 set some jumptable memory card stuff 0x300 to 0x344
INCLUDE_ASM("asm/nonmatchings/10C8", func_80021D54);

// 3 don't really know what these do, probably not standard library
INCLUDE_ASM("asm/nonmatchings/10C8", func_80021EF4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021F7C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80021FD0);

// 5 GPU ish functions I'm pretty sure but also have cd stuff
INCLUDE_ASM("asm/nonmatchings/10C8", func_80022074);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022260);

INCLUDE_ASM("asm/nonmatchings/10C8", func_8002237C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800223EC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022474);

// 31 mostly basic redirect GPU functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80022854);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022874);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022894);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800228B4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800228D4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800228F4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022914);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022934);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022954);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800229B0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800229D4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800229F8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022A20);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022A40);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022A60);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022A80);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022AA0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022AC0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022AE0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022B00);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022B54);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022B74);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022B94);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022BA4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022BD8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022C1C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022C3C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022C5C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022C7C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022CB0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022CD0);

// 1 jumptable set GPU functions 0x180 to 0x1A0
INCLUDE_ASM("asm/nonmatchings/10C8", func_80022CF0);

// 11 string functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80022EE8); // strcpy

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022F14); // strcat

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022F64); // strnchr

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022F9C);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80022FDC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80023004);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80023060);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800230A0);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800230C8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800230E8);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80023110);

// 6 timer register functions
INCLUDE_ASM("asm/nonmatchings/10C8", func_80023144);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80023188);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800231CC);

INCLUDE_ASM("asm/nonmatchings/10C8", func_80023260);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800232C4);

INCLUDE_ASM("asm/nonmatchings/10C8", func_800232D4);
