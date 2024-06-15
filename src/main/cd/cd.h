#include <libcd.h>
#define SECTOR_SIZE     0x800
extern CdlLOC pvd_loc;
void cd_ready_callback(s32 status, u32 *result);