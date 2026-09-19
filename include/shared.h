#ifndef _JMPTABLE_H
#define _JMPTABLE_H

#include "common.h"
#include "movie_args.h"
#include <libgpu.h>
#include <libspu.h>

// clang-format off

// shared data provided by the main executable

#define UNK(a,b)    u8 unk##a[b - a + 1]
typedef struct {
    u32 best_times[6][3][3];
    UNK(0xD8, 0xDF);
    u8  unkE0;
    u8  unkE1;
    u8  unkE2;  // have we beaten the game?
    u8  unkE3;  // setting_camera_normal
    u8  unkE4;  // world?
    s8  unkE5;  // setting_pad_mode
    s8  unkE6;  // setting_sp_item
    s8  unkE7;  // setting_is_stereo
    s8  unkE8;  // played before?
    s8  unkE9;
    s8  unkEA;  // widescreen
    char signature[8];
    UNK(0xF3, 0xFB);
    u32 checksum;
} SavedData;
#undef UNK

#define UNK(a,b)    u8 unk##a[b - a + 1]
typedef struct {
    SavedData curr;
    SavedData saved[3];
    SavedData backup;
    s32 unk500;
    s32 unk504;
    s8  unk508;
    s8  unk509;
    s8  unk50A;
    s8  unk50B;
    u8  unk50C; // last slot saved to
    u8  unk50D; // last slot loaded from

    u8  intro_played;
    s8  slot_state[3];
    u8  unk512;
    u8  unk513; // index 0-69
    u8  world;
    u8  stage;  // next one to play
    s8  unk516;
    u8  debug_features;
    u8  unk518;
    s8  unk519; // unlock all levels cheat
} GlobalData;
#undef UNK

#define UNK(a,b)    void *unk##a[b - a + 1]
extern struct {
    // General Functions
    /*   0 */ void        (*nop)(void);
    /*   1 */ void        (*jt_set)(void*, s32);
    /*   2 */ s32         (*is_game_running)(void);
    /*   3 */ void        (*execs_set_next)(s32);
    /*   4 */ s32         (*execs_get_next)(void);
    /*   5 */ GlobalData* (*globals)(void);
    /*   6 */ char*       (*execs_get_path)(s32);
#ifdef VERSION_WORLD
    /*   7 */ s32         (*get_video_mode)(void);
    /*   8 */ s32         (*get_region)(void);
    /*   9 */ int         (*get_widescreen)(void);
    /*   A */ void        (*set_widescreen)(int);
    /*   B */ char*       (*get_mc_file_name)(void);
#endif
    UNK(12, 191);
    /*  C0 */ void        (*decompress_rle)(u32,void* src,void* dst);
    /*  C1 */ void        (*decompress_lz1)(void* src,void* dst);
    UNK(194, 223);
    /*  E0 */ u32         (*routine_task_add)(void* callback, u16 interval);
    /*  E1 */ void        (*routine_task_remove)(u32 taskid);
    UNK(226, 239);
    /*  F0 */ u32         (*PadRead)(int id);
    UNK(241, 254);
    /*  FF */ u32         (*get_engine_version)(void);

    // CD functions
    /* 100 */ int         (*cd_status)();
    /* 101 */ void        (*cd_command)(u8 arg0, u32 arg1, u32 arg2);
    /* 102 */ int         (*cd_run_block)(void);
    /* 103 */ int         (*cd_flush)(void);
    /* 104 */ int         (*func_8001C734)();
    UNK(261, 271);
    /* 110 */ int         (*cd_read_full)();
    /* 111 */ int         (*iso_read)(const char* addr, void* buf, s32 mode);
    /* 112 */ int         (*iso_file_size)();
    /* 113 */ int         (*cd_fs_exec)();
    /* 114 */ int         (*cd_seek_safe)();
    /* 115 */ int         (*iso_read_fast)();
    /* 116 */ int         (*iso_seek)();
#ifdef VERSION_WORLD
    /* 117 */ int         (*iso_never_called)();
#endif
    UNK(280, 287);
    /* 120 */ int         (*music_play_cdda)(int idx, int repeat);
    /* 121 */ int         (*music_play_cdda_from_loc)(CdlLOC *loc);
    /* 122 */ void        (*cd_pause)(void);
    /* 123 */ int         (*cd_play)();
    /* 124 */ void        (*cd_mute)(void);
    /* 125 */ int         (*cd_demute)();
    /* 126 */ int         (*cd_set_stereo)();
    /* 127 */ s32         (*sound_fade_out)(s32 duration, s32, s32);
    /* 128 */ s32         (*sound_fade_in)(s32 duration, s32, s32);
    /* 129 */ void        (*set_global_volume)(SpuVolume*);
    /* 12A */ void        (*get_global_volume)(SpuVolume*);
    /* 12B */ int         (*cd_set_reverb)(int arg0);
    /* 12C */ int         (*cd_stop)();
    /* 12D */ int         (*cd_fade_wait)();
    /* 12E */ int         (*fade_pause)();
    /* 12F */ int         (*fade_unpause)();
    /* 130 */ int         (*music_play_str)();
    UNK(305, 319);
    /* 140 */ s32         (*play_movie)(char *filename, MovieArgs *args, int (*cb)(void));
    UNK(321, 383);

    // GPU Functions
    /* 180 */ s32         (*ResetGraph)(s32 mode);
    /* 181 */ void        (*wait_for_vsync)(void);
    /* 182 */ void        (*SetGraphDebug)(s32 level);
    /* 183 */ void        (*SetDispMask)(s32 mask);
    /* 184 */ u32         (*get_frame_counter)(void);
    /* 185 */ DISPENV*    (*PutDispEnv)(DISPENV*);
    /* 186 */ DRAWENV*    (*PutDrawEnv)(DRAWENV*);
    /* 187 */ u32*        (*ClearOTag)(u32* ot, s32 n);
    /* 188 */ void        (*ClearOTagR)(u32* ot, s32 n);
    /* 189 */ void        (*DrawOTag)(u32* ot);
    /* 18A */ s32         (*LoadImage)(RECT*, void*);
    /* 18B */ int         (*ClearImage)(RECT*, u8, u8, u8);
    /* 18C */ s32         (*DrawSync)(s32 mode);
    /* 18D */ void        (*SetDrawMode)(DR_MODE* p, s32 dfe, s32 dtd, s32 tpage, RECT* tw);
    /* 18E */ DISPENV*    (*SetDefDispEnv)(DISPENV*, int x, int y, int w, int h);
    /* 18F */ DRAWENV*    (*SetDefDrawEnv)(DRAWENV*, int x, int y, int w, int h);
    /* 190 */ s32         (*GetGraphType)(void);  /* 400 */
    /* 191 */ s32         (*VSync)(s32 mode);
    /* 192 */ DISPENV*    (*GetDispEnv)(DISPENV*);
    /* 193 */ DRAWENV*    (*GetDrawEnv)(DRAWENV*);
    /* 194 */ void        (*SetDrawEnv)(DR_ENV* p, DRAWENV* env);
    /* 195 */ void        (*SetDrawOffset)(DR_OFFSET* p, u16* ofs);
    /* 196 */ void        (*SetDrawArea)(DR_AREA* p, RECT* r);
    /* 197 */ s32         (*StoreImage)(RECT*, u32*);
    /* 198 */ s32         (*MoveImage)(RECT* src, s32 x, s32 y);
#ifdef VERSION_WORLD
    /* 199 */ void        (*DrawPrim)(void* p);
    /* 19A */ u16         (*LoadTPage)(u32* data, s32 tp, s32 abr, s32 x, s32 y, s32 w, s32 h);
    /* 19B */ u16         (*LoadClut)(u16* data, u32 x, u32 y);
    /* 19C */ u32         (*SetVideoMode)(u32);
    /* 19D */ u32         (*GetVideoMode)(void);
#endif
    // I had to also export these three functions in addition. Since the game
    // executable was using them from its own linked libgpu which is bad.
    /* 19E */ void        (*SetSemiTrans)(void *p, int abe);
    /* 19F */ void        (*SetShadeTex)(void *p, int tge);
    /* 1A0 */ void        (*SetTexWindow)(DR_TWIN *p, RECT *tw);

    UNK(417, 511);

    // Audio Functions
    UNK(512, 639);

    // Memory Card Functions
    int         (*mc_get_event)(void);
    int         (*mc_select_slot)(int);
    int         (*mc_file_exists)(int, char *);
    int         (*mc_make_header)(void *dst, u8 flags, int size, char *title, u16 *palette, void *icon0, void *icon1, void *icon2);
    int         (*mc_unk0)();
    int         (*mc_unk1)();
    void        (*mc_set_callback_a)(void*);
    UNK(647, 655);

    int         (*mc_create)(int slot, char *filename, u32 size);
    int         (*mc_open)(int slot, char *filename, u32 mode);
    int         (*mc_close)(int fd);
    int         (*mc_read)(int fd, void *buf, int len);
    int         (*mc_write)(int fd, void *buf, int len);
    int         (*mc_seek)(int, int, int);
    int         (*mc_delete)(int slot, char *filename);
    DIRENTRY*   (*mc_firstfile)(int slot, char *filename, DIRENTRY *out);
    DIRENTRY*   (*mc_nextfile)(DIRENTRY *);
    int         (*mc_format)(int slot);
    UNK(666, 671);

    int         (*mc_read_block)(int fd, void *buf, int len);
    int         (*mc_write_block)(int fd, void *buf, int len);
    UNK(674, 767);

    // Misc. Functions
    /* 300 */ void        (*sfx_load_vab)(short index, void *header, void *data);
    /* 301 */ int         (*sfx_free_vab)(s16);
    /* 302 */ int         (*snd_set_stereo)(int);
    /* 303 */ int         (*snd_get_stereo)(void);
    /* 304 */ void        (*sfx_kill_all)(void);
    /* 305 */ s32         (*snd_set_volume)(s16);
    /* 306 */ int         (*sfx_set_reverb)(int val);
    /* 307 */ void        (*snd_set_reverb)(long mode, short depth);
    /* 308 */ void        (*snd_set_vol_to_min)(void);
    /* 309 */ void        (*snd_set_vol_to_max)(void);
    /* 30A */ int         (*snd_fade_out)(int step, int target, void *cb);
    /* 30B */ int         (*snd_fade_in)(int step, int target, void *cb);
    /* 30C */ u32         (*snd_status)(void);
    /* 30D */ void        (*snd_fade_pause)(void);
    /* 30E */ void        (*snd_fade_unpause)(void);
    /* 30F */ void        (*snd_reset)(void);
    /* 310 */ void        (*sfx_play_simple)(u32 id);
    /* 311 */ short       (*sfx_play)(u32 id, short pan, short volume);
    /* 312 */ void        (*sfx_play_modulated)(u32 id, s16 arg1, s16 arg2, s16 arg3);
    /* 313 */ void        (*sfx_kill)(u32 handle);
    /* 314 */ int         (*sfx_set_pan)(u32 handle, u16 pan);
    /* 315 */ int         (*sfx_set_vol)(u32 handle, u16 vol);
    /* 316 */ int         (*sfx_set_both)(u32 handle, u16 pan, u16 vol);
    /* 317 */ int         (*sfx_get_pan)(u32 handle);
    /* 318 */ int         (*sfx_get_vol)(u32 handle);
    /* 319 */ int         (*sfx_is_valid)(u32 handle);
    /* 31A */ void        (*sfx_release)(u32 handle);
    /* 31B */ void        (*sfx_set_prog_attr)(u32 id, int arg2);
    /* 31C */ u32         (*sfx_get_mask)(void);
    /* 31D */ long        (*call_SpuClearReverbWorkArea)(long mode);
    UNK(798, 799);
    /* 320 */ void        (*execute_compressed)(void *addr, u32 arg);
    UNK(801, 816);
    /* 331 */ int         (*music_play)(u8 id);
    /* 332 */ void        (*music_set_repeat)(int val);
    UNK(819, 831);
    int         (*mc_file_read)(int slot, char *filename, void *buf, int off, int len);
    int         (*mc_file_write)(int slot, char *filename, void *buf, int off, int len);
    int         (*mc_file_create)(int slot, char *filename, int len, char *title);
    int         (*mc_file_delete)(int slot, char *filename);
    void        (*mc_set_callback_b)(void*);
    UNK(837, 1000);

    // added block for my own new functions
    void        (*printf)(const char* fmt, ...);
    UNK(1002, 1023);
} jt;
#undef UNK

#ifdef VERSION_WORLD
    #define SOUND_FADE_TIME 12
#else
    #define SOUND_FADE_TIME 16
#endif

#endif
