#ifndef _JMPTABLE_H
#define _JMPTABLE_H

#include <libgpu.h>
#include <libspu.h>
#include "common.h"

// shared data provided by the main executable


#define UNK(a,b)    u8 unk##a[b - a + 1]
typedef struct {
    UNK(0, 0xE3);
    s8  unkE4;
    s8  unkE5;
    s8  unkE6;
    s8  unkE7;
    s8  unkE8;  // played before?
    s8  unkE9;
    UNK(0xEA, 0x4FF);
    s32  unk500;
    s32  unk504;
    s8   unk508;
    s8   unk509;
    s8   unk50A;
    s8   unk50B;
    UNK(0x50C, 0x513);
    s8  world;
    s8  stage;  // next one to play
    s8  unk516;
    s8  debug_features;
    s8  unk519; // have beaten the game?
} GlobalData;
#undef UNK

#define UNK(a,b)    void* unk##a[b - a + 1]
extern struct {
    void        (*nop)(void);
    void        (*jt_set)(void*, s32);
    s32         (*is_game_running)(void);
    void        (*execs_set_next)(s32);
    s32         (*execs_get_next)(void);
    GlobalData* (*global_ptr)(void);       // TODO: this should be a struct
    char*       (*execs_get_path)(s32);
    s32         (*get_tv_system)(void);
    s32         (*get_region)(void);
    void        (*printf)(const char* fmt, ...);    // I ADDED THIS MYSELF
    UNK(10, 10);
    //UNK(9, 10);
    char*       (*get_version_string)(void);
    UNK(12, 191);
    void        (*decompress_rle)(u32,void* src,void* dst);
    void        (*decompress_lz1)(void* src,void* dst);
    UNK(194, 223);
    u32         (*routine_task_add)(void* callback, u16 interval);
    void        (*routine_task_remove)(u32 taskid);
    UNK(226, 239);
    u32         (*PadRead)();    
    UNK(241, 257);
    s32         (*snd_queue_exec)(void);
    UNK(259, 272);
    s32         (*cd_fs_read)(const char* addr, void* buf, s32 mode);
    UNK(274, 294);
    s32         (*sound_fade_out)(s32 duration, s32, s32);
    s32         (*sound_fade_in)(s32 duration, s32, s32);
    void        (*set_global_volume)(SpuVolume*);
    void        (*get_global_volume)(SpuVolume*);
    UNK(299, 319);
    s32         (*play_movie)(char*, void*, void* callback);
    UNK(321, 383);
    s32         (*ResetGraph)(s32 mode);
    void        (*wait_for_vsync)(void);
    void        (*SetGraphDebug)(s32 level);
    void        (*SetDispMask)(s32 mask);
    u32         (*get_frame_counter)(void); 
    DISPENV*    (*PutDispEnv)(DISPENV*);
    DRAWENV*    (*PutDrawEnv)(DRAWENV*);
    u32*        (*ClearOTag)(u32* ot, s32 n);
    void        (*ClearOTagR)(u32* ot, s32 n);
    void        (*DrawOTag)(u32* ot);
    s32         (*LoadImage)(RECT*, void*);
    int         (*ClearImage)(RECT*, u8, u8, u8);
    s32         (*DrawSync)(s32 mode);
    void        (*SetDrawMode)(DR_MODE* p, s32 dfe, s32 dtd, s32 tpage, RECT* tw);
    DISPENV*    (*SetDefDispEnv)(DISPENV*, int x, int y, int w, int h);
    DRAWENV*    (*SetDefDrawEnv)(DRAWENV*, int x, int y, int w, int h);
    s32         (*GetGraphType)(void);
    s32         (*VSync)(s32 mode);
    DISPENV*    (*GetDispEnv)(DISPENV*);
    DRAWENV*    (*GetDrawEnv)(DRAWENV*);
    void        (*SetDrawEnv)(DR_ENV* p, DRAWENV* env);
    void        (*SetDrawOffset)(DR_OFFSET* p, u16* ofs);
    void        (*SetDrawArea)(DR_AREA* p, RECT* r);
    s32         (*StoreImage)(RECT*, u32*);
    s32         (*MoveImage)(RECT* src, s32 x, s32 y);
    void        (*DrawPrim)(void* p);
    u16         (*LoadTPage)(u32* data, s32 tp, s32 abr, s32 x, s32 y, s32 w, s32 h);
    u16         (*LoadClut)(u16* data, u32 x, u32 y);
    u32         (*SetVideoMode)(u32);
    u32         (*GetVideoMode)(void);
    UNK(414, 767);
    void (*play_vab)(s32, void*, s32);  // audio play by addr? play file?
    UNK(769, 772);
    s32         (*audio_unk_volume)(s16);
    UNK(774, 779);
    u32         (*unk_flags)(void);
    void        (*audio_unk_set)(void);
    void        (*audio_unk_reset)(void);
    void        (*audio_unk2)(void);
    void        (*execute_compressed)(void* addr, u32 arg);
    void        (*audio_unk0)(s32 arg0, s16 arg1, s16 arg2);
    void        (*audio_unk1)(s32 arg0, s16 arg1, s16 arg2, s16 arg3);
    UNK(787, 816);
    s32         (*audio_play_by_id)(s32);
    void        (*audio_unk3)(s32);
    UNK(819, 1023);
} jt;
#undef UNK


// TODO: this is stupid, move it
// DON'T include this header in main, or this macro breaks things
#define GetGraphType()  jt.GetGraphType()

#endif