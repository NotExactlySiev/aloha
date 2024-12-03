#include <libcd.h>
#define SECTOR_BYTES     (SECTOR_SIZE * sizeof(int))
extern CdlLOC pvd_loc;
void cd_ready_callback(s32 status, u32 *result);

int try_CdControl(u_char com, void *param, u_char *result);
int try_CdControlB(u_char com, void *param, u_char *result);
int try_CdGetSector(void *madr, int size);
int try_CdRead(int sectors, void *buf, int mode);
int cd_verify_read(int mode, u8 *result);

void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, u8 *data);

// TODO: enum, fix the numbers
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