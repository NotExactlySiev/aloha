#include "common.h"

INCLUDE_ASM("asm/main/nonmatchings/libetc", ResetCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", InterruptCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", DMACallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", VSyncCallbacks);

INCLUDE_ASM("asm/main/nonmatchings/libetc", StopCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", CheckCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", GetIntrMask);

INCLUDE_ASM("asm/main/nonmatchings/libetc", SetIntrMask);

INCLUDE_ASM("asm/main/nonmatchings/libetc", startIntr);

INCLUDE_ASM("asm/main/nonmatchings/libetc", trapIntr);

INCLUDE_ASM("asm/main/nonmatchings/libetc", setIntr);

INCLUDE_ASM("asm/main/nonmatchings/libetc", stopIntr);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr1);

// 5 kernel calls all in one file
INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002BCC8);

INCLUDE_ASM("asm/main/nonmatchings/libetc", startIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", stopIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", trapIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", setIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr2);

INCLUDE_ASM("asm/main/nonmatchings/libetc", PadInit);

INCLUDE_ASM("asm/main/nonmatchings/libetc", PadRead);

INCLUDE_ASM("asm/main/nonmatchings/libetc", PadStop);

// 3 pad kernel calls are clumped together in one file for some reason
INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C10C);

INCLUDE_ASM("asm/main/nonmatchings/libetc", SetVideoMode);

INCLUDE_ASM("asm/main/nonmatchings/libetc", GetVideoMode);

INCLUDE_ASM("asm/main/nonmatchings/libetc", startIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", stopIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", trapIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", setIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr3);

INCLUDE_ASM("asm/main/nonmatchings/libetc", VSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", v_wait);
