#include "common.h"

INCLUDE_ASM("asm/nonmatchings/libetc", ResetCallback);

INCLUDE_ASM("asm/nonmatchings/libetc", InterruptCallback);

INCLUDE_ASM("asm/nonmatchings/libetc", DMACallback);

INCLUDE_ASM("asm/nonmatchings/libetc", VSyncCallbacks);

INCLUDE_ASM("asm/nonmatchings/libetc", StopCallback);

INCLUDE_ASM("asm/nonmatchings/libetc", CheckCallback);

INCLUDE_ASM("asm/nonmatchings/libetc", GetIntrMask);

INCLUDE_ASM("asm/nonmatchings/libetc", SetIntrMask);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002B858);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002B918);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002BB0C);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002BC34);

INCLUDE_ASM("asm/nonmatchings/libetc", memclr);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002BCC8);

INCLUDE_ASM("asm/nonmatchings/libetc", startIntrDMA);

INCLUDE_ASM("asm/nonmatchings/libetc", stopIntrDMA);

INCLUDE_ASM("asm/nonmatchings/libetc", trapIntrDMA);

INCLUDE_ASM("asm/nonmatchings/libetc", setIntrDMA);

INCLUDE_ASM("asm/nonmatchings/libetc", memclr);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C05C);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C0BC);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C0EC);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C10C);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C13C);

INCLUDE_ASM("asm/nonmatchings/libetc", func_8002C154);

INCLUDE_ASM("asm/nonmatchings/libetc", startIntrVSync);

INCLUDE_ASM("asm/nonmatchings/libetc", stopIntrVSync);

INCLUDE_ASM("asm/nonmatchings/libetc", trapIntrVSync);

INCLUDE_ASM("asm/nonmatchings/libetc", setIntrVSync);

INCLUDE_ASM("asm/nonmatchings/libetc", memclr);

INCLUDE_ASM("asm/nonmatchings/libetc", VSync);

INCLUDE_ASM("asm/nonmatchings/libetc", v_wait);
