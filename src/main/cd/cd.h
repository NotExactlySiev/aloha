#include <libcd.h>
#define SECTOR_BYTES     (SECTOR_SIZE * sizeof(int))
extern CdlLOC pvd_loc;
void cd_ready_callback(s32 status, u32 *result);

int try_CdControl(u_char com, u_char *param, u_char *result);
int try_CdControlB(u_char com, u_char *param, u_char *result);
int try_CdGetSector(void *madr, int size);
int try_CdRead(int sectors, u_long *buf, int mode);
int func_8001A2C8(int mode, u8 *result);

void sector_cache_clear(void);
int sector_cache_get(CdlLOC *loc, u8 *data);