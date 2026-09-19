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

// disc.c
int cd_get_status(u8 *result);

// bcache.c
void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, void *data);

// fs.c
int cd_fs_get_file(CdlFILE *file, char *filename); // iso_find

// iso.c
int iso_get_file(CdlFILE *file, char *filename);
int iso_never_called(void *arg0, char *filename, int arg2);
