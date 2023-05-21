#include "common.h"
#include "main.h"

INCLUDE_ASM("asm/main/nonmatchings/boot", k_boot);

void reset(void) {
    k_strcpy(kernelbuf, "PSDEMO");
    reboot("PSX.EXE", "SYSTEM.CNF");
}

// NONMATCHING
void reset2(void) {
    reboot("PSX.EXE","SYSTEM.CNF");
}

INCLUDE_ASM("asm/main/nonmatchings/boot", reboot);