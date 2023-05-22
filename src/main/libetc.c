#include "common.h"

INCLUDE_ASM("asm/main/nonmatchings/libetc", ResetCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", InterruptCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", DMACallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", VSyncCallbacks);

INCLUDE_ASM("asm/main/nonmatchings/libetc", StopCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", CheckCallback);

INCLUDE_ASM("asm/main/nonmatchings/libetc", GetIntrMask);

INCLUDE_ASM("asm/main/nonmatchings/libetc", SetIntrMask);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002B858);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002B918);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002BB0C);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002BC34);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr1);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002BCC8);

INCLUDE_ASM("asm/main/nonmatchings/libetc", startIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", stopIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", trapIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", setIntrDMA);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr2);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C05C);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C0BC);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C0EC);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C10C);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C13C);

INCLUDE_ASM("asm/main/nonmatchings/libetc", func_8002C154);

INCLUDE_ASM("asm/main/nonmatchings/libetc", startIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", stopIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", trapIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", setIntrVSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", memclr3);

INCLUDE_ASM("asm/main/nonmatchings/libetc", VSync);

INCLUDE_ASM("asm/main/nonmatchings/libetc", v_wait);
