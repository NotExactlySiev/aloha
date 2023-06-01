#include "common.h"

#define CdlNop		0x01	
#define CdlSetloc	0x02	
#define CdlPlay		0x03	
#define CdlForward	0x04	
#define CdlBackward	0x05
#define CdlReadN	0x06
#define CdlStandby	0x07
#define CdlStop		0x08
#define CdlPause	0x09
#define CdlReset	0x0a
#define CdlMute		0x0b
#define CdlDemute	0x0c
#define CdlSetfilter	0x0d
#define CdlSetmode	0x0e
#define CdlGetparam	0x0f
#define CdlGetlocL	0x10
#define CdlGetlocP	0x11
#define CdlSeekL	0x15
#define CdlSeekP	0x16
#define CdlReadS	0x1B

/*
 *	Location
 */
typedef struct {
	u8 minute;		/* minute (BCD) */
	u8 second;		/* second (BCD) */
	u8 sector;		/* sector (BCD) */
	u8 track;		/* track (void) */
} CdlLOC;

/*
 *	ADPCM Filter
 */
typedef struct {
	u8	file;		/* file ID (always 1) */
	u8	chan;		/* channel ID */
	u16	pad;
} CdlFILTER;

/*
 *	Attenuator
 */
typedef struct {
	u8	val0;		/* volume for CD(L) -> SPU (L) */
	u8	val1;		/* volume for CD(L) -> SPU (R) */
	u8	val2;		/* volume for CD(R) -> SPU (L) */
	u8	val3;		/* volume for CD(R) -> SPU (R) */
} CdlATV;	


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

// data
// but .data is not integrated into this file yet, so they're extern
extern s32 is_mono;             // 80047D88
extern CdlLOC ww_global_loc;
extern void (*fnptr)(void);


void cd_ready_callback(s32 status, u32 *result);
void ww_try_add(u8, void*, s32);




INCLUDE_ASM("asm/main/nonmatchings/274C", func_80019F4C);

INCLUDE_ASM("asm/main/nonmatchings/274C", cd_ready_callback);

s32 try_CdControl(u8 arg0, u8* arg1, u8* arg2) {
    while (CdControl(arg0, arg1, arg2) != 1);
    return 1;
}

s32 try_CdControlB(u8 arg0, u8* arg1, u8* arg2) {
    while (CdControlB(arg0, arg1, arg2) != 1);
    return 1;
}

s32 try_CdGetSector(void* madr, s32 size) {
    while (CdGetSector(madr, size) == 0);
    return 1;
}

s32 try_CdRead(s32 sectors, u32* buf, s32 mode) {
    while (CdRead(sectors, buf, mode) == 0);
    return 1;
}


INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A2C8);   

s32 try_CdMix(CdlATV* vol) {
    while (CdMix(vol) == 0);
    return 1;
}

s32 cd_get_status(u8* result) {
    return CdControl(CdlNop, 0, result);
}

void cd_read_callback(void) {
}

int func_8001A378(void) {
    return 0;
}


// matching on 4.3 with -O1 and -fPIC
void func_8001A380(void) {
    CdReadyCallback(cd_ready_callback);
    CdReadCallback(cd_read_callback);
}


// jmptable setter 0x100-0x140
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A3B8);

// clears all cd callbacks
// matching on 4.3 with -O1
void func_8001A74C(void) {
    CdReadyCallback(0);
    CdReadCallback(0);
    CdSyncCallback(0);
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A77C);

// sound related functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A8A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A934);

// these 2 are almost identical, only vars are different
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A978);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AA80);

// same for these 2
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AB88);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AD0C);

// and then we just have 12array stuff
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AE90);

// 4 functions for actually accessing 12array (prefix with ww_)
INCLUDE_ASM("asm/main/nonmatchings/274C", ww_reset);

INCLUDE_ASM("asm/main/nonmatchings/274C", ww_add);

INCLUDE_ASM("asm/main/nonmatchings/274C", ww_try_add);

INCLUDE_ASM("asm/main/nonmatchings/274C", ww_process);

// and then these functinos actually use those 4 to do stuff
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B8DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B94C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001B9D8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BA50);

// 2 functions for converting between frame number and byte offset in videos
// I have no idea why but these actually use div for dividing by constants
// and do some other weird stuff that doesn't make any sense
#define     BCD(x)    (((x / 10) << 4) + (x % 10))
#define     UNBCD(x)    ((x >> 4)*10 + x&0xF)
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BB50);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BD00);


INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C03C);

extern s32 D_80047D78;
extern u8 D_80047D8C;
extern u8 D_80047E9C;
extern s32 D_80047EAC;
extern s32 D_80047F24;

// ALMOST MATCHING with 4.3 -O1, only issue is double zero
void func_8001C20C(CdlLOC* loc) {
    D_80047D78 = 0;
    D_80047F24 = 0;
    ww_global_loc.minute = loc->minute;
    ww_global_loc.second = loc->second;
    ww_global_loc.sector = loc->sector;
    D_80047EAC = CdPosToInt(loc);
    ww_try_add(0xFCU, &D_80047D8C, 0);
    ww_try_add(0xFEU, NULL, 0);
    func_8001C374();
    ww_try_add(0x16U, loc, 0);
    ww_try_add(3U, NULL, 0);
    ww_try_add(0xFBU, NULL, 0);
    ww_try_add(0xFDU, &D_80047E9C, 0);
    func_8001B9D8();
}

// these 4 are NON MATCHING
// but only double zero
void func_8001C2F4(void) {
    ww_try_add(9, 0, 0);
}

void func_8001C31C(void) {
    ww_try_add(3, 0, 0);
    func_8001C374();
}

void func_8001C34C(void) {
    ww_try_add(0xB, 0, 0);
}

void func_8001C374(void) {
    ww_try_add(0xC, 0, 0);
}

s32 set_mono(s32 arg0) {
    CdlATV vol;
    s32 ret;
    
    ret = is_mono;
    is_mono = arg0;
    
    func_8001B8DC();
    
    if (arg0 == 0) {
        vol.val0 = 0x80;
        vol.val1 = 0;
        vol.val2 = 0x80;
        vol.val3 = 0;
    } else {
        vol.val0 = 0x5B;
        vol.val1 = 0x5B;
        vol.val2 = 0x5B;
        vol.val3 = 0x5B;
    }
    
    try_CdMix(&vol);
    return ret;
}

// cd file management functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C418);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C4F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C564);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C5BC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C5F4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C670);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C734);   // pause

// cd filesystem io
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C780);   // read

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C7B4);   // write

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C7E8);   // command

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CA84);   // load exe

s32 execute_uncompressed(char* file, s32 param) {
    EXEC header;
    
    if (func_8001CA84(file, param, &header) != 0)
        return -1;

    flush_cache_safe();
    setNextFile(0);
    k_Exec(&header, 1, 0);
    return 0;
}


INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD0C);

// 9 more trivial functions related to 12array
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD30);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD68);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD90);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CDC8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CDF0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE18);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE28);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CE58);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CEA0);

// 
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CEC8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CF38);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D0AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D104);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D13C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D248);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D288);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D29C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D2AC);

// cache handling functions (i think) and more cd stuff
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D398);   // update

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D414);   // clear

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D440);   // load from cache

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D67C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D6AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D740);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D780);

INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_root);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D8B0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DA00);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DB04);

// trivial and caller sound functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DD7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DE98);   // snd_mute

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DED0);   // call_SpuSetCommonAttr

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DEF0);   // call_***

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF14);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF78);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DF8C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFAC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFCC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DFEC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E00C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E02C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E04C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E06C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E08C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E0AC);   // call_SpuSetVoiceAttr

// these 2 are bigger memcpy functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E0CC);
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E17C);

// the rest are trivial again
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E22C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E250);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E274);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E294);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2B4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2D4);

void func_8001E2F4(void) {
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E2FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E31C);

// 2 trivial pad functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E33C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E36C);

// 4 font and type functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E38C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E3D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E438);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E5BC);

// 
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E608);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E654);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E744);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E790);

// jmptable setter 0x306-0x320 (overlap with the other one)
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E7B0);

// complex and trivial functions jumbled together
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E998);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EEA4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001EFAC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F17C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F200);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F4F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F578);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F5DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F610);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F64C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F8D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F918);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F95C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F9A4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001F9EC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB38);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB58);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FB78);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FBC0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FBE4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FC34);

// 3 event test functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FC5C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FCF4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FD8C);

// 1 big function related to memory card
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FDF4);

// 3 trivial functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FFC4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001FFD4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020000);

// 15 memory card file system functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020020);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800200C8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002011C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800201A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020208);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020228);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002026C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202A0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800203AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020414);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020434);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800205C4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020610);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020630);

// 2 big almost identical functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800206E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020808);

// init memory card (events and jmptable)
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002092C);

// close memory card events
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020C8C);

// play audio?
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020D5C);

// trivial or easy functions related to audio
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DC4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DE8);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E30);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E40);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E64);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020E88);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020EB4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020EF0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020F48);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020F9C);

// 4 functions related to some sort of list
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FC0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FD0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021028);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210D4);

//
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800211F0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800212FC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021310);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021320);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021490);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021600);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021740);

// ALMOST MATCHING, regallock on 4.3 -O1, return delay slot in 4.0 -O1 
void execute_compressed(u32* addr, u32 stack) {
    EXEC header;
    EXEC* p;
    
    __builtin_memcpy(&header, addr+4, 0x3c);
    lz1_decode((u8* ) (addr + 0x201), header.t_addr);
    header.s_addr = stack;
    flush_cache_safe();
    k_Exec(&header, 1, 0);
}

// MATCHING
void func_800218A0(void (*fn)(void)) {
    fnptr = fn;
}

// matching with 4.3 -O2
void func_800218B0(void) {
    if (fnptr != 0) {
        (*fnptr)();
    }
}

// 6 memory card functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800218DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800219DC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021BCC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021D08);

// jmptable setter 0x300-0x344
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021D54);

// 8 loading and playing video
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021EF4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021F7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021FD0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022074);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022260);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002237C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800223EC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022474);

// indirect calls
INCLUDE_ASM("asm/main/nonmatchings/274C", call_StoreImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_MoveImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawOffset);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawArea);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetGraphType);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDefDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDefDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDrawMode);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ClearImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadImage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_CleaOTag);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ClearOTagR);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawOTag);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_PutDispEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_PutDrawEnv);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawSync);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_ResetGraph);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_wait_one);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_VSync);

INCLUDE_ASM("asm/main/nonmatchings/274C", get_tim3_counter);

INCLUDE_ASM("asm/main/nonmatchings/274C", wait_one);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetGraphDebug);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetDispMask);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_DrawPrim);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadClut);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_LoadTPage);

INCLUDE_ASM("asm/main/nonmatchings/274C", call_SetVideoMode);       // call_SetVideoMode

INCLUDE_ASM("asm/main/nonmatchings/274C", call_GetVideoMode);       // call_GetVideoMode

// jmptable setter 0x180-0x19d
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022CF0); 


// standard str functions
INCLUDE_ASM("asm/main/nonmatchings/274C", strcpy);

INCLUDE_ASM("asm/main/nonmatchings/274C", strcat);

INCLUDE_ASM("asm/main/nonmatchings/274C", strnchr);

INCLUDE_ASM("asm/main/nonmatchings/274C", strupper);

INCLUDE_ASM("asm/main/nonmatchings/274C", strlen);

INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_leaf);

INCLUDE_ASM("asm/main/nonmatchings/274C", strncmp);

INCLUDE_ASM("asm/main/nonmatchings/274C", memcpy);

INCLUDE_ASM("asm/main/nonmatchings/274C", memset);

INCLUDE_ASM("asm/main/nonmatchings/274C", strlen2);

INCLUDE_ASM("asm/main/nonmatchings/274C", card_write);

// 5 task queue functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023144);   

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023188);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800231CC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80023260);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800232C4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800232D4);
