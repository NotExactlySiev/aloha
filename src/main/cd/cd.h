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