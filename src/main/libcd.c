#include "common.h"

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdReset);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdSync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdReady);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdSetDebug);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdComstr);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdIntstr);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdSyncCallback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdReadyCallback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdReadCallback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdControl);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdControlF);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdControlB);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdMix);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdGetSector);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdDataCallback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdDataSync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdReadSync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdRead);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdRead2);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdIntToPos);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdPosToInt);

INCLUDE_ASM("asm/main/nonmatchings/libcd", getintr);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_sync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_ready);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_cw);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_vol);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_init);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_shell);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_flush);

INCLUDE_ASM("asm/main/nonmatchings/libcd", cd_read_retry);

INCLUDE_ASM("asm/main/nonmatchings/libcd", cb_read);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_readm);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_readsync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_datasync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_getsector);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CD_set_test_parmnum);

INCLUDE_ASM("asm/main/nonmatchings/libcd", callback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", CdInit);

INCLUDE_ASM("asm/main/nonmatchings/libcd", def_cbsync);

INCLUDE_ASM("asm/main/nonmatchings/libcd", def_cbready);

INCLUDE_ASM("asm/main/nonmatchings/libcd", def_cbread);

INCLUDE_ASM("asm/main/nonmatchings/libcd", DeliverEvent);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StSetRing);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StClearRing);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StUnSetRing);

INCLUDE_ASM("asm/main/nonmatchings/libcd", data_ready_callback);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StSetStream);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StSetEmulate);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StFreeRing);

INCLUDE_ASM("asm/main/nonmatchings/libcd", init_ring_status);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StGetNext);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StSetMask);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StCdInterrupt);

INCLUDE_ASM("asm/main/nonmatchings/libcd", dma_execute);

INCLUDE_ASM("asm/main/nonmatchings/libcd", mem2mem);

INCLUDE_ASM("asm/main/nonmatchings/libcd", StSetChannel);
