#pragma once
#include <ints.h>
#include <libcd.h>
#include <libspu.h>

#define SECTOR_BYTES (SECTOR_SIZE * sizeof(int))
extern CdlLOC pvd_loc;

void cd_init(void);
void cd_ready_callback(u8 status, u8 *result);

int try_CdControl(u_char com, void *param, u_char *result);
int try_CdControlB(u_char com, void *param, u_char *result);
int try_CdGetSector(void *madr, int size);
int try_CdRead(int sectors, void *buf, int mode);

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

void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, u8 *data);

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

extern u8 _cd_last_status[8];
#define cd_last_status (_cd_last_status[0])

void cd_command(u8 arg0, u32 arg1, u32 arg2);
int cd_run_block(void);
int cd_flush(void);
void cd_pause(void);
void cd_mute(void);
void cd_set_vol(SpuVolume *vol);
void cd_get_vol(SpuVolume *vol);
int cd_set_reverb(int arg0);
void cd_fade_stop(void);
void cd_stop(void);
void cd_check_disc_presence(void);
