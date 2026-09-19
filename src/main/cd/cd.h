#pragma once
#include <ints.h>
#include <libcd.h>
#include <libspu.h>
#include <stddef.h>

#define SECTOR_BYTES (SECTOR_SIZE * sizeof(int))
extern CdlLOC pvd_loc;

int try_CdControl(u_char com, void *param, u_char *result);
int try_CdControlB(u_char com, void *param, u_char *result);
int try_CdGetSector(void *madr, int size);
int try_CdRead(int sectors, void *buf, int mode);
int try_CdMix(CdlATV *vol);

#ifdef VERSION_WORLD
int cd_verify_read(int mode, u8 *result);
#else
// This function doesn't exist in the Japanese version and instead the code just
// calls CdReady. This is... not correct. Oh well.
static inline int cd_verify_read(int mode, u8 *result)
{
    return CdReady(mode, result);
}
#endif

static inline int try_reading_twice(int sectors, void *buf, CdlLOC *loc)
{
    for (int i = 0; i < 2; i++) {
#ifdef VERSION_WORLD
        try_CdControl(CdlSetloc, loc, NULL);
#endif
        try_CdRead(sectors, buf, CdlModeSpeed);
        if (cd_verify_read(0, NULL) != -1)
            return 0;
    }

    return -1;
}

enum {
    SNQ_FINISHED = 0xFF,
    SNQ_SET_FE = 0xFE,
    SNQ_SET_FULL = 0xFD,
    SNQ_SET_SCALED = 0xFC,
    SNQ_FADE_OUT = 0xFB,
    SNQ_FADE_IN = 0xFA,
    SNQ_SET_REVERB = 0xF9,
    SNQ_FUNC8 = 0xF8,
    SNQ_FUNC9 = 0xF7,
    SNQ_SET_PAUSED = 0xF6,
};

// Unorganized
extern int D_80047F24;
extern int D_800548EC;
extern int pvd_is_cached;
extern u8 _cd_last_status[8];

#define cd_last_status (_cd_last_status[0])

// disc.c
void cd_init(void);
void cd_deinit(void);
void cd_check_disc_presence(void);

// queue.c
extern int D_80047D78;
extern int D_80047D7C;
extern s32 is_mono;
extern SpuVolume D_80047D8C;

void cd_clear_queue(void); // cd_queue_clear
void cd_command(u8 arg0, void *arg1, void *arg2); // cd_command
int cd_run_block(void); // cd_queue_run
int cd_flush(void); // cd_queue_flush

// fs.c
int iso_file_size();
int cd_seek_safe();
int iso_seek(char *file, uint offset);
int cd_read_full();
int func_8001C734(s32 mode, u8 *result);
int iso_read(char *filename, u8 *buf, int n);
int iso_read_fast(char *filename, u8 *buf, int n);
int cd_fs_exec(char *file, u32 stack);

// music.c
void music_play_str(char *filename, u8 file, u8 chan, CdlLOC *loc, int arg3, int repeat);
int music_play_cdda(int idx, int repeat);
void music_play_cdda_from_loc(CdlLOC *loc);

//
void func_8001BB50(int arg0, CdlLOC *loc);
void cd_pause(void);
void cd_play(void);
void cd_mute(void);
void cd_demute(void);

// cd.c / music2
void cd_get_vol(SpuVolume *vol);
int cd_set_reverb(int arg0);
void cd_stop(void);
void cd_fade_wait(void);
void music_pause(void);
void music_unpause(void);
void music_really_unpause(void);
int func_8001CF38();

// Other
void cd_set_vol(SpuVolume *vol);
void cd_fade_stop(void);
int func_8001B94C(void);
u32 cd_status(void);
void music_stop(void);

#include "movie_args.h"
int play_movie(char *filename, MovieArgs *args, int (*cb)(void));
