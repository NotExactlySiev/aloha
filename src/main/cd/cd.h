#pragma once
#include <libcd.h>
#define SECTOR_BYTES     (SECTOR_SIZE * sizeof(int))
extern CdlLOC pvd_loc;
void cd_ready_callback(u8 status, u8 *result);

int try_CdControl(u_char com, void *param, u_char *result);
int try_CdControlB(u_char com, void *param, u_char *result);
int try_CdGetSector(void *madr, int size);
int try_CdRead(int sectors, void *buf, int mode);
int cd_verify_read(int mode, u8 *result);

void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, u8 *data);

enum {
    SNQ_FINISHED =    0xFF,
    SNQ_SET_FE =      0xFE,
    SNQ_SET_FULL =    0xFD,
    SNQ_SET_SCALED =  0xFC,
    SNQ_FADE_OUT =    0xFB,
    SNQ_FADE_IN =     0xFA,
    SNQ_SET_REVERB =  0xF9,
    SNQ_FUNC8 =       0xF8,
    SNQ_FUNC9 =       0xF7,
    SNQ_SET_PAUSED =  0xF6,
};

extern u8 _cd_last_status[8];
#define cd_last_status (_cd_last_status[0])
