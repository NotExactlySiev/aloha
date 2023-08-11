#include "common.h"
#include <kernel.h>
#include <libspu.h>
#include <libcd.h>
#include <libgpu.h>

// data
// but .data is not integrated into this file yet, so they're extern
int (*fnptr)() = 0;
s32 is_mono = 0;
CdlFILE D_80048068;
CdlLOC ww_global_loc;

s32 fe_value;


// regular task vars, they're in the assembly
extern s32 D_800234B0;
extern s32 D_800234B4;
extern s32 D_80047D78;
extern SpuVolume D_80047D8C;
extern s32 D_80047EAC;
extern s32 D_80047F24;
extern s32 D_80047DEC;
extern s32 D_80047EA4;
extern s32 D_80047F54;
extern SpuVolume vol_full;


void cd_ready_callback(s32 status, u32 *result);
s32 sndqueue_add(u8 arg0, s32 arg1, s32 arg2);


// functions

#define NEXT    \
    (t = t ? t-1 : 7, c = t == 7 ? *src++ : c, (c >> t) & 1)

char* _lz1_decode(const u8 *src, u8* dst)
{
    u8 t, c;    // control bits and their counter
    s32 off;
    u32 l;
    u8* orig = src;
    u8* od = dst;
    t = 0;
    while (1)
    {
        // every NEXT macro reads one bit from the control bit
        // 0 means simply copy a byte
        while (NEXT == 0)
            *dst++ = *src++;
        
        // 1 means repeated data. we're gonna copy from output
        // buffer.
        // next bit sets if the offset is gonna be 12 bit (the
        // next 4 control bits being the lower bits of the
        // offset)
        if (NEXT == 0) {
            off = *src++ - 256;
            if (off == -0x100) return dst;  // denotes EOS
        } else {
            off = *src++ - 256;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off = (off << 1) | NEXT;
            off -= 255;
        }
    
        // now length
        l = 1;
        while (NEXT == 1)
            l = (l << 1) | NEXT;
        l += 1;

        //__builtin_memcpy(dst, dst+off, l);
        while (l--) {
            *dst = *(dst+off);
            dst += 1;
        }
    }
}

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

extern s32 D_80047EE4;

// MATCHING with 4.3 -O1   
s32 func_8001A2C8(s32 mode, u8* result) {
    s32 rc;
    s32 ret;
    
    rc = CdReadSync(mode, result);
    ret = -1;
    if (rc == -1) {
        D_80047EE4 = 0;
        ret = func_8001D414();
    }
    
    if (rc >= 0) {
        ret = func_80019990();
    }
    return ret;
}


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

void func_8001A380(void) {
    CdReadyCallback(cd_ready_callback);
    CdReadCallback(cd_read_callback);
}


// jmptable setter 0x100-0x140
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A3B8);

// clears all cd callbacks
void func_8001A74C(void) {
    CdReadyCallback(0);
    CdReadCallback(0);
    CdSyncCallback(0);
}

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001A77C);

#define VOL_FULL    1024

#define SNQ_FINISHED    -1
#define SNQ_SET_FE       -2  //  arg0
#define SNQ_FUNC3       -3
#define SNQ_FUNC4       -4
#define SNQ_FADE_OUT       -5
#define SNQ_FADE_IN       -6
#define SNQ_SET_REVERB  -7
#define SNQ_FUNC8       -8
#define SNQ_FUNC9       -9
#define SNQ_FUNC10      -10

#define CLAMP(a,b,x)    { if (x < a) x = a; if (x > b) x = b; }

typedef struct {
    u8     com;
    u32    arg0;
    u32    arg1;
} snd_task_t;

// TODO: the multiplications here have the weird if statements
void set_vol_scaled(SpuVolume* vol, s32 scale)
{
    SpuCommonAttr attr;
    CLAMP(0, VOL_FULL, scale);
    attr.mask = SPU_COMMON_CDVOLL | SPU_COMMON_CDVOLR;
    attr.cd.volume.left = (vol->left * scale) >> 10;
    attr.cd.volume.right = (vol->right * scale) >> 10;
    SpuSetCommonAttr(&attr);
}

void set_vol_full(SpuVolume* vol) {
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

    if (TV_PAL == get_GameNP()) {
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

    if (TV_PAL == get_GameNP()) {
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

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001AE90);

s8 sndqueue_com = SNQ_FINISHED;
s8 D_80047D94 = SNQ_FINISHED;
s32 D_80047DD8 = 1;  // this is still a mystery. probably enum. gets set in the first function here
s32 D_80047DE0 = 0;  // step? no idea. maybe a state machine
s32 D_80047DEC = 0;
s32 _sndqueue_empty = 0;
s32 _sndqueue_busy = 0;
u16 _sndqueue_next;
u16 _sndqueue_size;
s32 D_80047E94;      // this one just gets 0 written to it
s32 sndqueue_is_running;      // execution is in process
u16 D_80047F34;      // index of the task being executed


s32 cd_busy = 0;   // step1
void* cd_arg;     // param
void* cd_result;     // result
u8 D_80047EDC = 0;

snd_task_t _sndqueue[192];

// execute one block of command
s32 TEMP_sndqueue_exec()
{
    s32 rc;

    if (sndqueue_is_running == 1) return 0;
    sndqueue_is_running = 1;

    if (cd_busy == 1) {
        rc = CdControl(sndqueue_com, cd_arg, cd_result);
        if (rc == 1) {
            cd_busy = 1;
            sndqueue_is_running = 0;
            return 0;
        }
        cd_busy = 0;
        D_80047DE0 = 1;
        goto flush_and_flee;
    }
    // ...
    // check_fe:
    CdSync(1, 0);
    func_80019F4C(rc, 0);   // rc doesn't exist yet lolololol
    if (2 == fe_value && func_8001CE18()) {
        fe_value = 0;
        set_vol_scaled(&D_80047D8C, 0x400);
        if (1 == D_80047D78) {
            sndqueue_add(CdlPause, 0, 0);   // TODO: arguments
            sndqueue_add(CdlSetmode, 0, 0);
            sndqueue_add(CdlSetfilter, 0, 0);
            sndqueue_add(CdlSeekL, 0, 0);
            sndqueue_add(CdlPause, 0, 0);
            sndqueue_add(CdlReadS, 0, 0);
            sndqueue_add(SNQ_FUNC4, 0, 0);
            sndqueue_add(SNQ_FUNC9, 0, 0);
            sndqueue_add(SNQ_SET_FE, 2, 0);
        } else {
            sndqueue_add(CdlPause, 0, 0);
            D_800548EC = 0;
        }
    }
    // ... more shit
    // and then the actual queue
flush_and_flee: // is not exactly here
    if (1);

    snd_task_t* t;
    u32 next;

    while (1) { // i think I can break instead of return
        t = &_sndqueue[D_80047F34];
        if (t->com == SNQ_FINISHED) {
            D_80047DD8 = 0;
            sndqueue_com = CdlNop;
            cd_arg = 0;
            cd_result = &D_80047EDC;
            cd_busy = 1 != cd_get_status(&D_80047EDC);
            _sndqueue_empty = 1;
            break;
        }

        sndqueue_com = t->com;
        D_80047D94 = t->com;
        if (sndqueue_com == SNQ_SET_FE) {   // done
            s32 newval = t->arg0;
            if (fe_value == 5 && newval != 5)
                func_8001A380(); // activate ready and read callbacks
            if (newval != 2)
                func_8001D104();
            fe_value = newval;
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC3) {
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC4) {
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FADE_OUT) {
            
        } else
        if (sndqueue_com == SNQ_FADE_IN) {
        } else
        if (sndqueue_com == SNQ_SET_REVERB) {   // done
            SpuCommonAttr attr;
            attr.mask = 0x100;
            attr.cd.reverb = t->arg0;
            SpuSetCommonAttr(&attr);
            D_80047EA4 = t->arg0;
            func_8001FBE4();
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC8) {    // done
            if (fade_out_active == 1 || fade_in_active == 1) break;
            next = D_80047F34 + 1;
        } else
        if (sndqueue_com == SNQ_FUNC9) {    // done
            func_8001D0AC(t->arg0);
            next = D_80047F34 + 1;
        } else      
        if (sndqueue_com == SNQ_FUNC10) {   // done
            D_80047DEC = t->arg0;
            next = D_80047F34 + 1;
        } else {   // done
            // normal cd control functions
            D_80047DD8 = 0;

            cd_arg = t->arg0;
            cd_result = t->arg1;
            rc = CdControl(sndqueue_com, cd_arg, cd_result);
            if (rc == 1) {
                cd_busy = 0;
                D_80047E94 = 0;
                D_80047F34 = (D_80047F34 + 1) & 0xff;
                _sndqueue_size -= 1;
            } else {
                cd_busy = 1;
            }
            break;
        }
        _sndqueue_size -= 1;
        D_80047F34 = next & 0xff;
    }

    sndqueue_is_running = 0;
    return 0;
}


void sndqueue_reset(void) {
    _sndqueue_next = 0;
    D_80047F34 = 0;
    D_80047E94 = 0;
    D_80047DD8 = 1;
    _sndqueue_empty = 1;
    D_80047DE0 = 0;
    _sndqueue[0].com = -1;
    _sndqueue_size = 0;
}

s32 sndqueue_add(u8 arg0, s32 arg1, s32 arg2)
{
    u8 tmp;
    snd_task_t* task;

    task = &_sndqueue[_sndqueue_next];

    if (_sndqueue_busy == 1 || _sndqueue_size > 192) return 0;

    _sndqueue_busy = 1;
    _sndqueue[(_sndqueue_next+1)%256].com = -1;
    task->com = arg0;
    task->arg0 = arg1;
    task->arg1 = arg2;

    _sndqueue_size++;
    _sndqueue_next++;
    _sndqueue_next = (u8) _sndqueue_next;
    //_sndqueue_next = _sndqueue_next & 0xff;
    _sndqueue_empty = 0;
    _sndqueue_busy = 0;
    return 1;
}

void sndqueue_add_try(u8 arg0, s32 arg1, s32 arg2)
{
    if (sndqueue_is_running == 0) {
        while (_sndqueue_size > 192)
            sndqueue_exec();
    }
    sndqueue_add(arg0, arg1, arg2);
}

INCLUDE_ASM("asm/main/nonmatchings/274C", sndqueue_exec);

int sndqueue_exec_all(void)
{
    s32 ret;

    ret = 0;
    if (_sndqueue_empty == 0) do {
        ret = sndqueue_exec();
    } while (_sndqueue_empty == 0 && ret != -1);
    
    CdSync(0, 0);
    return ret;
}


// and then these functinos actually use those 4 to do stuff
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

// ALMOST MATCHING with 4.3 -O1, only issue is double zero
void func_8001C20C(CdlLOC* loc) {
    D_80047D78 = 0;
    D_80047F24 = 0;
    ww_global_loc.minute = loc->minute;
    ww_global_loc.second = loc->second;
    ww_global_loc.sector = loc->sector;
    D_80047EAC = CdPosToInt(loc);
    sndqueue_add_try(SNQ_FUNC4, &D_80047D8C, 0);
    sndqueue_add_try(SNQ_SET_FE, 0, 0);
    func_8001C374();
    sndqueue_add_try(CdlSeekP, loc, 0);
    sndqueue_add_try(CdlPlay, 0, 0);
    sndqueue_add_try(SNQ_FADE_OUT, 0, 0);
    sndqueue_add_try(SNQ_FUNC3, &vol_full, 0);
    func_8001B9D8();
}

// these 4 are NON MATCHING
// but only double zero
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


// NON MATCHING only 1 instruction swapped
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

// cd file management functions
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file);   // cd_fs_get_file
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file_safe);   // cd_fs_get_file_safe
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_get_file_size);   // cd_fs_get_file_size
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_seek_safe);   // cd_seek_safe
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_seek_file);   // cd_seek_file
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_read_full);   // cd_read_full

// NON MATCHING but it's only one instruction swap
s32 func_8001C734(s32 mode, u8* result) {   // pause
    s32 ret;

    ret = func_8001A2C8(mode, result);
    if (ret == 2) {
        try_CdControl(CdlPause, 0, 0);
        flush_cache_safe();
    }
    return ret;
}

// cd filesystem io
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_read);   // cd_fs_read
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_write);   // cd_fs_write
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_io);   // cd_fs_io
INCLUDE_ASM("asm/main/nonmatchings/274C", cd_fs_load_exe);   // cd_fs_load_exe

s32 execute_uncompressed(char* file, s32 param) {
    EXEC header;
    
    if (cd_fs_load_exe(file, param, &header) != 0)
        return -1;

    flush_cache_safe();
    setNextFile(0);
    k_Exec(&header, 1, 0);
    return 0;
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
    return D_80047F54;
}

void func_8001CE28(void) {
    func_8001C2F4();
    sndqueue_add_try(SNQ_FUNC10, 1, 0);
}

void func_8001CE58(void) {
    if (D_80047DEC == 1) {
        sndqueue_add_try(CdlReadS, 0, 0);
        sndqueue_add_try(SNQ_FUNC10, 0, 0);
    }
}

void func_8001CEA0(void) {
    sndqueue_add_try(SNQ_FUNC10, 0, 0);
}


// 
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001CEC8);

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

// play movie
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D2AC);

// TODO: put cache stuff in a seperate file

#define     CD_SECTOR_SIZE      0x800

#define     CACHE_ENTRIES       10
#define     CACHE_DATA_SIZE     CD_SECTOR_SIZE

typedef struct {
    u32    expire;
    CdlLOC loc;
    u8     data[CACHE_DATA_SIZE];
} cache_entry_t;

cache_entry_t cache_entries[10];

// cache handling functions (i think) and more cd stuff
INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D398);   // update

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8001D414);   // clear

s32 func_8001D440(CdlLOC* loc, u8* data) {
    s32 i;  
    u32 minidx;
    u32 minexp;

    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].expire == 0) continue;
        if (strncmp(3, loc, &cache_entries[i].loc) == 0) continue;
        // found it!
        memcpy(0x800, &cache_entries[i].data, data);
        return 1;
    }

    // it's not cached, load from disc
    CdSync(0, 0);
    do {
            try_CdControl(2, &loc->minute, 0);
            try_CdRead(1, data, 0x80);
    } while (func_8001A2C8(0, 0) == -1);
    try_CdControl(9, 0, 0); //pause

    // and then try to cache it. first look for an empty entry
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].expire == 0) {
            memcpy(0x800, data, cache_entries[i].data);
            func_8001D398(&cache_entries[i].expire);
            cache_entries[i].loc = *loc;
            return 1;
        }
    }
    
    // if not found, find the one with the closest expiry
    minexp = -1;
    
    for (i = 0; i < CACHE_ENTRIES; i++) {
        if (cache_entries[i].expire < minexp) {
            minexp = cache_entries[i].expire;
            minidx = i;
        }
    }
    memcpy(0x800, data, cache_entries[minidx].data);
    cache_entries[i].loc = *loc;
    func_8001D398(&cache_entries[i].expire);
    return 1;
}


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

void call_SpuSetVoiceAttr(SpuVoiceAttr* attr) {
    func_8002C4A8(attr);
}

extern int D_80047E08;

void func_8001E0CC(SpuVoiceAttr* arg0) {
    SpuVoiceAttr attr;
    s32 left;
    s32 right;
    u32 val;

    if (D_80047E08 == 1) {
        __builtin_memcpy(&attr, arg0, sizeof(SpuVoiceAttr));
        left = attr.volume.left;
        right = attr.volume.right;
        if (left < 0) {
            left = -left;
        }
        if (right < 0) {
            right = -right;
        }
        val = left + right;
        // what is this doing?
        val = (val + (val >> 0x1F)) >> 1;
        attr.volume.right = val;
        attr.volume.left = val;
        call_SpuSetVoiceAttr(&attr);
        return;
    }
    else
    {
        call_SpuSetVoiceAttr(arg0);
    }
}

// this is almost exactly the same as the previous one
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

void func_8001E438();
void func_8001E5BC();
extern u8* font_ptr8;
extern u8* font_ptr16;

// 4 font and type functions
//MATCHING with 4.3 -O1
void func_8001E38C(void) {
    jt_set(func_8001E438, 0xD0);
    jt_set(func_8001E5BC, 0xD1);
    font_ptr8 = 0;
    font_ptr16 = 0;
}

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

// vab functions (I'm guessing for the sound effects)
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
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020020);   // mc_addr_prefix

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800200C8);   // mc_

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002011C);   // mc_file_create

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800201A0);   // mc_file_open

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020208);   // mc_file_close

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020228);   // mc_file_delete

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002026C);   // mc_write

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202A0);   // mc_write_try

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800202FC);   //

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800203AC);   // mc_read_try

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020414);   // mc_seek

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020434);   // 

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800205C4);   // mc_file_find

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020610);   // mc_file_next

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020630);   // mc_format

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

// 3 audio_list functions
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FC0);   // audio_list_set_ptr

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80020FD0);   // audio_list_find

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021028);   // audio_list_play

//
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

void execute_compressed(u32* addr, u32 stack)
{
    EXEC header;
    EXEC* p;
    
    __builtin_memcpy(&header, addr+4, 0x3c);
    lz1_decode((u8* ) (addr + 0x201), header.t_addr);
    header.s_addr = stack;
    flush_cache_safe();
    k_Exec(&header, 1, 0);
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

// 8 loading and playing video
INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021EF4);       // vid_setup_mdec

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021F7C);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80021FD0);

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022074);       // 

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022260);       // vid_load_frame

INCLUDE_ASM("asm/main/nonmatchings/274C", func_8002237C);       // vid_decode_frame

INCLUDE_ASM("asm/main/nonmatchings/274C", func_800223EC);       // vid_wait_for_img

INCLUDE_ASM("asm/main/nonmatchings/274C", func_80022474);       // vid_play_file

// these jt ones all should be matching as they're very simple
int call_StoreImage(RECT *rect, u_long *p) {
    return StoreImage(rect, p);
}

int call_MoveImage(RECT *rect, int x, int y) {
    return MoveImage(rect, x, y);
}

DISPENV *call_GetDispEnv(DISPENV *env) {
    return GetDispEnv(env);
}

DRAWENV *call_GetDrawEnv(DRAWENV *env) {
    return GetDrawEnv(env);
}

void call_SetDrawEnv(DR_ENV *dr_env, DRAWENV *env) {
    SetDrawEnv(dr_env, env);
}

void call_SetDrawOffset(DR_OFFSET *p, u_short *ofs) {
    SetDrawOffset(p, ofs);
}

void call_SetDrawArea(DR_AREA *p, RECT *r) {
    SetDrawArea(p, r);
}

int call_GetGraphType(void) {
    return GetGraphType();
}

DISPENV *call_SetDefDispEnv(DISPENV *env, int x, int y, int w, int h) {
    return SetDefDispEnv(env, x, y, w, h);
}

DRAWENV *call_SetDefDrawEnv(DRAWENV *env, int x, int y, int w, int h) {
    return SetDefDrawEnv(env, x, y, w, h);
}

void call_SetDrawMode(DR_MODE *p, int dfe, int dtd, int tpage, RECT *tw) {
    SetDrawMode(p, dfe, dtd, tpage, tw);
}

int call_ClearImage(RECT *rect, u_char r, u_char g, u_char b) {
    return ClearImage(rect, r, g, b);
}

int call_LoadImage(RECT *rect, u_long *p) {
    return LoadImage(rect, p);
}

u_long *call_CleaOTag(u_long *ot, int n) {
    return ClearOTag(ot, n);
}

u_long *call_ClearOTagR(u_long *ot, int n) {
    return ClearOTagR(ot, n);
}

void call_DrawOTag(u_long *p) {
    DrawOTag(p);
}

DISPENV *call_PutDispEnv(DISPENV *env) {
    return PutDispEnv(env);
}

DRAWENV *call_PutDrawEnv(DRAWENV *env) {
    return PutDrawEnv(env);
}

int call_DrawSync(int mode) {
    return DrawSync(mode);
}

int call_ResetGraph(int mode) {
    return ResetGraph(mode);
}

void call_wait_frame(void) {
    wait_frame();
}

int call_VSync(int mode) {
    return VSync(mode);
}

int get_vsync_event_cnt(void) {
    return D_800234B0;
}

INCLUDE_ASM("asm/main/nonmatchings/274C", wait_frame);

int call_SetGraphDebug(int level) {
    return SetGraphDebug(level);
}

void call_SetDispMask(int mask) {
    SetDispMask(mask);
}

void call_DrawPrim(void *p) {
    DrawPrim(p);
}

u_short call_LoadClut(u_long *clut, int x, int y) {
    return LoadClut(clut, x, y);
}

u_short call_LoadTPage(u_long *pix, int tp, int abr, int x, int y, int w, int h) {
    return LoadTPage(pix, tp, abr, x, y, w, h);
}

long call_SetVideoMode(long mode) {
    return SetVideoMode(mode);
}

long call_GetVideoMode(void) {
    return GetVideoMode();
}

void jt_series_gpu(void) {
    jt_set(call_ResetGraph, 0x180);
    jt_set(call_wait_frame, 0x181);
    jt_set(call_SetGraphDebug, 0x182);
    jt_set(call_SetDispMask, 0x183);
    jt_set(get_vsync_event_cnt, 0x184);
    jt_set(call_PutDispEnv, 0x185);
    jt_set(call_PutDrawEnv, 0x186);
    jt_set(call_CleaOTag, 0x187);
    jt_set(call_ClearOTagR, 0x188);
    jt_set(call_DrawOTag, 0x189);
    jt_set(call_LoadImage, 0x18A);
    jt_set(call_ClearImage, 0x18B);
    jt_set(call_DrawSync, 0x18C);
    jt_set(call_SetDrawMode, 0x18D);
    jt_set(call_SetDefDispEnv, 0x18E);
    jt_set(call_SetDefDrawEnv, 0x18F);
    jt_set(call_GetGraphType, 0x190);
    jt_set(call_VSync, 0x191);
    jt_set(call_GetDispEnv, 0x192);
    jt_set(call_GetDrawEnv, 0x193);
    jt_set(call_SetDrawEnv, 0x194);
    jt_set(call_SetDrawOffset, 0x195);
    jt_set(call_SetDrawArea, 0x196);
    jt_set(call_StoreImage, 0x197);
    jt_set(call_MoveImage, 0x198);
    jt_set(call_DrawPrim, 0x199);
    jt_set(call_LoadTPage, 0x19A);
    jt_set(call_LoadClut, 0x19B);
    jt_set(call_SetVideoMode, 0x19C);
    jt_set(call_GetVideoMode, 0x19D);
}


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

// the variables for this one are all in the assembly file for the final one
INCLUDE_ASM("asm/main/nonmatchings/274C", regular_add);

INCLUDE_ASM("asm/main/nonmatchings/274C", regular_add_tmp);

INCLUDE_ASM("asm/main/nonmatchings/274C", regular_remove);

INCLUDE_ASM("asm/main/nonmatchings/274C", regular_clear_tmps);

void regular_active(s32 val) {
    D_800234B4 = val;
}

// this one is handwritten in assembly
INCLUDE_ASM("asm/main/nonmatchings/274C", regular_run_tasks);
