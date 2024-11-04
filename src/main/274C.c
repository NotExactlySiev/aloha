#include "common.h"
#include <kernel.h>
#include <libapi.h>
#include <libspu.h>
#include <libetc.h>
#include "cd/cd.h"

#include "main.h"

int (*fnptr)() = 0;
s32 is_mono = 0;
CdlFILE D_80048068;
CdlLOC ww_global_loc;

s32 fe_value;


// regular task vars, they're in the assembly
extern s32 D_80047D78;
extern SpuVolume D_80047D8C;
s32 D_80047EAC;
s32 D_80047F24;
extern s32 bgm_paused;
s32 D_80047EA4;
extern s32 bgm_finished;
extern SpuVolume vol_full;


void cd_ready_callback(s32 status, u32 *result);
s32 sndqueue_add(u8 arg0, u32 arg1, u32 arg2);
void func_8001C374(void);

// functions

// FILE audio.c

#define VOL_FULL    1024

#define SNQ_FINISHED    -1
#define SNQ_SET_FE       -2  //  arg0
#define SNQ_SET_FULL       -3
#define SNQ_SET_SCALED  -4
#define SNQ_FADE_OUT       -5
#define SNQ_FADE_IN       -6
#define SNQ_SET_REVERB  -7
#define SNQ_FUNC8       -8
#define SNQ_FUNC9       -9
#define SNQ_SET_PAUSED      -10

#define CLAMP(a,b,x)    { if (x < a) x = a; if (x > b) x = b; }


// TODO: the multiplications here have the weird if statements
void set_vol_scaled(SpuVolume *vol, s32 scale)
{
    SpuCommonAttr attr;
    CLAMP(0, VOL_FULL, scale);
    attr.mask = SPU_COMMON_CDVOLL | SPU_COMMON_CDVOLR;
    attr.cd.volume.left = (vol->left * scale) >> 10;
    attr.cd.volume.right = (vol->right * scale) >> 10;
    SpuSetCommonAttr(&attr);
}

// this one ignores fading effects
void set_vol_full(SpuVolume *vol) {
    set_vol_scaled(vol, VOL_FULL);
    vol_full = *vol;
}

extern s32 D_800548EC;
extern s32 fade_out_active;
extern s32 fading_out;
extern s32 fade_in_active;
extern s32 fading_in;
extern s32 fade_in_step;
extern s32 fade_out_step;
extern s32 fade_out_dest;
extern s32 fade_in_dest;

s32 vol_scale = VOL_FULL;
s32 fade_paused = 0;
s32 fade_out_task = 0;
s32 fade_in_task = 0;
int (*fade_out_callback)() = 0;
int (*fade_in_callback)() = 0;

void fade_out_routine(void)
{
    if (fade_paused || !fading_out) return;
    if (vol_scale > fade_out_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale -= fade_out_step;
    } else {
        regular_clear_tmps(fade_out_task);
        vol_scale = fade_out_dest;
        fading_out = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_out_callback != 0) (*fade_out_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

void fade_in_routine(void)
{
    if (fade_paused || !fading_in) return;
    if (vol_scale < fade_in_dest) {
        set_vol_scaled(&vol_full, vol_scale);
        vol_scale += fade_in_step;
    } else {
        regular_clear_tmps(fade_in_task);
        vol_scale = fade_in_dest;
        fading_in = 0;
        fade_in_active = 0;
        fade_out_active = 0;
        if (fade_in_callback != 0) (*fade_in_callback)();
        set_vol_scaled(&vol_full, vol_scale);
    }
}

s32 fade_out(s32 duration, s32 dstvol, void* callback)
{
    if (fade_out_active == 1) return 0;

    if (MODE_PAL == get_tv_system()) {
        duration = (duration * 5) / 6 - 1;
    }
    fade_out_active = 1;
    CLAMP(1, 1024, duration);
    CLAMP(0, VOL_FULL, dstvol);
    fade_out_step = VOL_FULL / duration;
    fade_in_dest = dstvol;
    fade_out_callback = callback;
    fade_out_task = regular_add_tmp(fade_out_routine, 1);
    if (fade_out_task < 0) {
        fade_out_active = 0;
        fade_in_active = 0;
        return 0;
    }

    sndqueue_add_try(SNQ_FADE_OUT, 1, 0);
    return 1;
}

s32 fade_in(s32 duration, s32 dstvol, void* callback)
{
    if (fade_in_active == 1) return 0;

    if (MODE_PAL == get_tv_system()) {
        duration = (duration * 5) / 6 - 1;
        //if (duration < 1) duration = 1;
    }
    fade_in_active = 1;
    CLAMP(1, 1024, duration);
    CLAMP(0, VOL_FULL, dstvol);
    fade_in_step = VOL_FULL / duration;
    fade_in_dest = dstvol;
    fade_in_callback = callback;
    fade_in_task = regular_add_tmp(fade_in_routine, 1);
    if (fade_in_task < 0) {
        fade_out_active = 0;
        fade_in_active = 0;
        return 0;
    }

    sndqueue_add_try(SNQ_FADE_IN, 1, 0);
    return 1;
}

void func_8001AE90(void)
{
    sndqueue_add_try(0xFA, 0, 0);
    sndqueue_add_try(0xFB, 0, 0);
    sndqueue_exec_all();
    fade_paused = 0;
}

// and then these functinos actually use those 4 to do stuff
u8 D_80047DA0[8] = { 8, 0, 0, 0, 0, 0, 0, 0 };
int D_80047DE4 = 1;
int D_80047DE8 = 0;
int D_80047EEC; // SpuVolume ptr?
extern CdlFILTER D_80047ECC;
extern int D_8004D0E0;

int func_8001B94C(void)
{
    int ret;

    D_80047F24 = 3;
    D_800548EC = 0;
    ret = 0;
    if (fe_value != 3) {
        func_8001C2F4();
        sndqueue_add_try(0xE, &D_80047DA0, 0);
        func_8001C34C();
        sndqueue_add_try(0xFC, &D_80047D8C, 0);
        sndqueue_add_try(0xFE, 3, 0);
        ret = sndqueue_exec_all();
    }
    return ret;
}

void func_8001B9D8(void)
{
    func_8001D104();
    if (fe_value == 3) {
        func_8001A380();
    }
    func_8001C2F4();
    sndqueue_add_try(0xFE, 1, 0);
    D_80047DE8 = 0;
    D_80047F24 = 1;
    D_800548EC = 1;
    D_80047DE4 = 1;
}

extern s8 D_80047EC4[];

void func_8001BA50(void) {
    func_8001CEA0();
    sndqueue_add_try(0xFC, &D_80047D8C, 0);
    sndqueue_add_try(0xFE, NULL, 0);
    func_8001C34C();
    func_8001C2F4();
    sndqueue_add_try(CdlSetmode, &D_80047EC4, 0);
    sndqueue_add_try(CdlSetfilter, &D_80047ECC, 0);
    sndqueue_add_try(CdlSeekL, &D_8004D0E0, 0);
    sndqueue_add_try(CdlPause, NULL, 0);
    sndqueue_add_try(CdlReadS, &D_8004D0E0, 0);
    func_8001C374();
    sndqueue_add_try(SNQ_SET_SCALED, &vol_full, 0);
    sndqueue_add_try(SNQ_FUNC9, D_80047EEC, 0);
    sndqueue_add_try(SNQ_SET_FE, 2, 0);
    D_80047DE4 = 1;
}


// ENDOF audio.c

// bgm.c

// 2 functions for converting between frame number and byte offset in videos
// I have no idea why but these actually use div for dividing by constants
// and do some other weird stuff that doesn't make any sense

static inline int bcd(int x)
{ 
    return ((x / 10) << 4) + (x % 10);
}

static inline int unbcd(int x)
{
    return ((x >> 4)*10 + x&0xF);
}

void func_8001BB50(int arg0, CdlLOC *loc) {
    int sector;
    int seconds;
    int second;
    int minute;

    seconds = get_tv_system() == MODE_PAL ? 203 : 200;
    sector = ((arg0 % 2048) * seconds) / 200;
    second = sector / 75;
    
    loc->sector = bcd(sector % 75);
    loc->minute = bcd(second / 60);
    loc->second = bcd(second % 60);
}

// uses unbcd
//INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001BD00);
// plays background music
void func_8001BD00(char *filename, u8 file, u8 chan, CdlLOC *loc, int arg3, int repeat)
{
    if (fe_value == 3) {
        func_8001A380();
    }

    D_80047D78 = repeat == 1;
    //printf("PLAYING %s\n", filename);

    if (cd_fs_get_file(&D_8004D0E0, filename) == 0) {
        printf("can't find file :(\n");
        // FIXME: code here
        return;
    }

    //printf("%X:%X:%X:%X\n", f.pos.track, f.pos.minute, f.pos.second, f.pos.sector);
    printf("%X:%X:%X:%X\n", loc->track, loc->minute, loc->second, loc->sector);
    D_80047F24 = 0;
    D_80047ECC.file = file;
    D_80047ECC.chan = chan;
    
    if (get_tv_system() == MODE_PAL) {
        unbcd(loc->minute) * 60;
        while (1);
    } else {
        int seconds = unbcd(loc->minute) * 60 + unbcd(loc->second);
        D_80047EEC = seconds * 60 + (unbcd(loc->track) * 60) / 100;
    }

    D_80047EEC *= get_tv_system() == MODE_PAL ? 203 : 200;
    D_80047EEC /= 200;
    printf("bgm is %d frames long\n", D_80047EEC);
    D_80047EC4[0] = arg3;
    sndqueue_add_try(0xFB, 0, 0);
    sndqueue_add_try(0xFA, 0, 0);
    func_8001BA50();
    D_80047F24 = 2;
    D_800548EC = 1;

}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001C03C);

void func_8001C20C(CdlLOC* loc) {
    D_80047D78 = 0;
    D_80047F24 = 0;
    ww_global_loc.minute = loc->minute;
    ww_global_loc.second = loc->second;
    ww_global_loc.sector = loc->sector;
    D_80047EAC = CdPosToInt(loc);
    sndqueue_add_try(SNQ_SET_SCALED, &D_80047D8C, 0);
    sndqueue_add_try(SNQ_SET_FE, 0, 0);
    func_8001C374();
    sndqueue_add_try(CdlSeekP, loc, 0);
    sndqueue_add_try(CdlPlay, 0, 0);
    sndqueue_add_try(SNQ_FADE_OUT, 0, 0);
    sndqueue_add_try(SNQ_SET_FULL, &vol_full, 0);
    func_8001B9D8();
}

void func_8001C2F4(void) {
    sndqueue_add_try(CdlPause, 0, 0);
}

void func_8001C31C(void) {
    sndqueue_add_try(CdlPlay, 0, 0);
    func_8001C374();
}

void func_8001C34C(void) {
    sndqueue_add_try(CdlMute, 0, 0);
}

void func_8001C374(void) {
    sndqueue_add_try(CdlDemute, 0, 0);
}

s32 set_mono(s32 arg0) {
    CdlATV vol;
    s32 ret;
    
    ret = is_mono;
    is_mono = arg0;
    
    sndqueue_exec_all();
    
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

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CD0C);

s32 func_8001CD30(s32 arg0) {
    s32 temp_s0;

    temp_s0 = D_80047EA4;
    sndqueue_add_try(SNQ_SET_REVERB, arg0, 0);
    return temp_s0;
}

void func_8001CD68(void) {
    sndqueue_add_try(CdlStop, 0, 0);
}

s32 func_8001CD90(void) {
    s32 temp_s0;

    temp_s0 = fe_value;
    sndqueue_add_try(SNQ_SET_FE, 5, 0);
    return temp_s0;
}

void func_8001CDC8(s32 arg0) {
    sndqueue_add_try(SNQ_SET_FE, arg0, 0);
}

void func_8001CDF0(void) {
    sndqueue_add_try(SNQ_FUNC8, 0, 0);
}

s32 func_8001CE18(void) {
    return bgm_finished;
}

void func_8001CE28(void) {
    func_8001C2F4();
    sndqueue_add_try(SNQ_SET_PAUSED, 1, 0);
}

void func_8001CE58(void) {
    if (bgm_paused == 1) {
        sndqueue_add_try(CdlReadS, 0, 0);
        sndqueue_add_try(SNQ_SET_PAUSED, 0, 0);
    }
}

void func_8001CEA0(void) {
    sndqueue_add_try(SNQ_SET_PAUSED, 0, 0);
}

extern int bgm_counter;  // cntr
extern int bgm_target;  // tgt

// bgm_tick 
void func_8001CEC8(void)
{
    if ((bgm_finished == 0) && (bgm_paused == 0))
        bgm_counter += 1;

    //printf("%d\t/ %d\n", bgm_counter, bgm_target);
    if (bgm_counter > bgm_target)
        bgm_finished = 1;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CF38);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D0AC);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D104);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D13C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D248);

void fade_pause(void) {
    fade_paused = 1;
}

void fade_unpause(void) {
    fade_paused = 0;
}

#include "movie.h"
// FIXME: the world 1 intro movie doesn't play correctly
int play_movie(char *filename, MovieArgs *args, int (*cb)(void))
{
    func_8001D104();
    func_8001A77C();
    sndqueue_exec_all();
    call_DrawSync(0);
    func_8001C374();
    sndqueue_add_try(CdlPause, 0, 0);
    sndqueue_add_try(0xFE, 4, 0);
    sndqueue_exec_all();
    int rc = play_movie_str(filename, args, cb);
    set_mono(is_mono);
    SpuVolume vol;
    func_8001CD0C(&vol);
    set_vol_full(&vol);
    sndqueue_add_try(0xF9, D_80047EA4, 0);
    sndqueue_add_try(0xFE, 0, 0);
    sndqueue_exec_all();
    func_8001A380();
    return rc;
}

// trivial and caller sound functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DD7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001DE98);   // snd_mute

long call_SpuSetCommonAttr(SpuCommonAttr *attr)
{
    SpuSetCommonAttr(attr);
}

// unused?
/*
void func_8001DEF0(int val)
{
    SpuSetReverbVoice(val, 0xFFFFFF);
}
*/

// set_reverb
void func_8001DF14(long mode, short depth)
{
    SpuReverbAttr attr = {
        .mask = 7,
        .mode = mode,
        .depth.left = depth,
        .depth.right = depth,
    };
    SpuSetReverb(0);
    SpuSetReverbModeParam(&attr);
    SpuSetReverb(0);
    SpuSetReverbDepth(&attr);
    SpuSetReverb(0);
    SpuClearReverbWorkArea(mode);
}

extern int D_80047E08;

void func_8001DF78(int val)
{
    D_80047E08 = val;
}

long call_SpuMalloc(long size)
{
    return SpuMalloc(size);
}

long call_SpuMallocWithStartAddr(unsigned long addr, long size)
{
    return SpuMallocWithStartAddr(addr, size);
}

void call_SpuFree(unsigned long addr)
{
    SpuFree(addr);
}

long call_SpuIsTransferCompleted(long flag)
{
    return SpuIsTransferCompleted(flag);
}

long call_SpuGetTransferMode(void)
{
    return SpuGetTransferMode();
}

unsigned long call_SpuWrite(unsigned char *addr, unsigned long size)
{
    return SpuWrite(addr, size);
}

unsigned long call_SpuSetTransferStartAddr(unsigned long addr)
{
    return SpuSetTransferStartAddr(addr);
}

long call_SpuGetKeyStatus(unsigned long voice_bit)
{
    return SpuGetKeyStatus(voice_bit);
}

void call_SpuGetAllKeysStatus(char *status)
{
    SpuGetAllKeysStatus(status);
}

void call_SpuSetVoiceAttr(SpuVoiceAttr *attr) {
    SpuSetVoiceAttr(attr);
}

void set_voice_attr(SpuVoiceAttr *arg) {
    if (D_80047E08 == 1) {
        // make it mono
        SpuVoiceAttr attr = *arg;
        int left = attr.volume.left;
        int right = attr.volume.right;
        if (left < 0) {
            left = -left;
        }
        if (right < 0) {
            right = -right;
        }
        int val = (left + right) / 2;
        attr.volume.right = val;
        attr.volume.left = val;
        call_SpuSetVoiceAttr(&attr);
    }
    else {
        call_SpuSetVoiceAttr(arg);
    }
}

// this is almost exactly the same as the previous one
NOT_IMPL(func_8001E17C) //INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E17C);

// the rest are trivial again
void spu_set_key_on(u32 mask) {
    SpuSetKey(SPU_ON, mask);
}

void spu_set_key_off(u32 mask) {
    SpuSetKey(SPU_OFF, mask);
}

void func_8001E2F4(void) {
}

void func_8001E31C(long n_clock)
{
    SpuSetNoiseClock(n_clock);
}

u32 call_PadRead(s32 id);

void func_8001E33C(void)
{
    PadInit(0);
    jt_set(call_PadRead, 0xf0);
}

u32 call_PadRead(s32 id)
{
    return PadRead(id);
}

// FILE font.c

void func_8001E438();
void func_8001E5BC();
extern u8* font_ptr8;
extern u8* font_ptr16;

// 4 font and type functions
void func_8001E38C(void) {
    jt_set(func_8001E438, 0xD0);
    jt_set(func_8001E5BC, 0xD1);
    font_ptr8 = 0;
    font_ptr16 = 0;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E3D4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E438);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001E5BC);

extern int D_80047E0C;  // is mdec initialized?
void func_8001E608(int mode)
{
    if (mode == 0) {
        if (D_80047E0C == 0) {
            D_80047E0C = 1;
        } else {
            mode = 0;
        }
    }
    DecDCTReset(mode);
}

// trivial or easy functions related to audio
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DC4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020DE8);

extern int D_80047E20;
int func_80020E30(void)
{
    return D_80047E20;
}

void func_80020E40(void)
{
    func_8001F4F0(SPU_ALLCH);
}

void func_80020E64(void)
{
    func_8001F578(SPU_ALLCH);
}

// FIXME: the pan appears to be... backwards? sfx issue?
extern short D_80047E24;
extern short D_80047E26;
extern int D_80047E48;

void func_80020E88(void)
{
    D_80047E26 = 0;
    func_80020EF0(0, 0);
}

void func_80020EB4(void)
{
    D_80047E26 = D_80047E24;
    func_80020EF0(D_80047E24, D_80047E48);
}

// set sound mono?
void func_80020EF0(short arg0, short arg1)
{
    short val = (arg0 * arg1) / 1024;
    call_SpuSetCommonAttr(&(SpuCommonAttr) {
        .mask = 3,
        .mvol.left = val,
        .mvol.right = val,
    });
}

int func_80020F48(short val)
{
    short old = D_80047E24;
    D_80047E24 = val;
    D_80047E26 = val;
    func_80020EF0(val, D_80047E48);
    return old;
}

void func_80020F9C(long mode, short depth)
{
    func_8001DF14(mode, depth);
}

// 3 audio_list functions
extern int D_80047E50;  // is a pointer?
// audio_list_set_ptr
void func_80020FC0(int val)
{
    D_80047E50 = val;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FD0);   // audio_list_find

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021028);   // audio_list_play

//
extern int D_80047E4C;
void func_800210D4(int val)
{
    D_80047E4C = val;
}

//
INCLUDE_ASM("asm/main/nonmatchings/274C", func_800210E4);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800211F0);

extern int D_80047E54;
void func_800212FC(void)
{
    D_80047E54 = 1;
}

void func_80021310(void)
{
    D_80047E54 = 0;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021320);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021490);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021600);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021740);

void execute_compressed(void *addr, u32 stack)
{
    EXEC header;
    __builtin_memcpy(&header, addr+16, 0x3c);
    lz1_decode(addr + 0x804, (void*) header.t_addr);
    header.s_addr = stack;
    flush_cache_safe();
    Exec(&header, 1, 0);
}

void func_800218A0(void (*fn)(void))
{
    fnptr = fn;
}

void func_800218B0(void)
{
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
// first decomp the functions that are referenced
/*void func_80021D54(void)
{
    fnptr = 0;
    jt_set(&sfx_load_vab, 0x300);
    jt_set(&func_80020DC4, 0x301);
    jt_set(&func_80020DE8, 0x302);
    jt_set(&func_80020E30, 0x303);
    jt_set(&func_80020E40, 0x304);
    jt_set(&func_80020F48, 0x305);
    jt_set(&func_80020F9C, 0x307);
    jt_set(&func_80020E88, 0x308);
    jt_set(&func_80020EB4, 0x309);
    jt_set(&func_80021320, 0x30A);
    jt_set(&func_80021490, 0x30B);
    jt_set(&func_80021740, 0x30C);
    jt_set(&func_800212FC, 0x30D);
    jt_set(&func_80021310, 0x30E);
    jt_set(&func_80021600, 0x30F);
    jt_set(&execute_compressed, 0x320);
    jt_set(&func_80020FC0, 0x330);
    jt_set(&func_80021028, 0x331);
    jt_set(&func_800210D4, 0x332);
    jt_set(&func_800218DC, 0x340);
    jt_set(&func_800219DC, 0x341);
    jt_set(&func_80021BCC, 0x342);
    jt_set(&func_80021D08, 0x343);
    jt_set(&func_800218A0, 0x344);
}*/


// standard str functions
void strcpy(char *src, char *dst)
{
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}

void strcat(char *a, char *b, char *dst)
{
    char *src = a;
    while (*src)
        *dst++ = *src++;
    src = b;
    while (*src)
        *dst++ = *src++;
    *dst = 0;
}


// TODO: this is just strchr not strnchr!
int strnchr(char *str, char c)
{
    while (*str)
        if (*str++ == c)
            return 1;
    return 0;
}


void strupper(char *src, char *dst)
{
    char c;
    while (c = *src++) {
        if (c >= 'a' && c <= 'z')
            c &= ~0x20;
        *dst++ = c;
    }
    *dst = 0;
}

int strlen(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", get_path_leaf);

INCLUDE_ASM("asm/main/nonmatchings/274C", memcmp);

INCLUDE_ASM("asm/main/nonmatchings/274C", memcpy);

void memset(u8 *dst, int n, u8 c)
{
    for (int i = 0; i < n; i++)
        dst[i] = c;
}

// exactly the same as the other one. linking shenanigans?
int strlen2(char *str)
{
    int i = 0;
    while (str[i]) i++;
    return i;
}

void card_write(int port)
{
    _new_card();
    _card_write(port, 0x3F, 0);
}