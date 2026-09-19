#pragma once

#include "cd.h"

// Modules in this directory that are only used by the CD subsystem.

extern SpuVolume vol_full;
extern int bgm_paused;
extern int cd_queue_is_running;
extern u32 cache_epoch;
extern int music_state;
extern int fade_out_active;
extern int fading_out;
extern int fade_in_active;
extern int fading_in;
extern int D_80047EA4;
extern s32 fade_paused;
extern s32 fade_out_task;
extern s32 fade_in_task;
extern int (*fade_out_callback)();
extern int (*fade_in_callback)();
extern s32 vol_scale;

void func_8001D104(void);
void func_8001BA50(void);
void func_8001D0AC(int delay);
int func_8001CE18(void);
void func_80019F4C(s32 arg0);
void set_vol_scaled(SpuVolume *vol, s32 scale);

// disc.c
int cd_get_status(u8 *result);
void func_8001A380(void);

// bcache.c
void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, void *data);

// iso.c
int iso_get_file(CdlFILE *file, char *filename);
int iso_never_called(void *arg0, char *filename, int arg2);
