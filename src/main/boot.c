#include "common.h"

char kernelbuf[8]; // TODO: A000DF00
void reboot(char*, char*);

// and the rest in one file?
INCLUDE_ASM("asm/nonmatchings/BCB8", k_boot);

void reset(void) {
    k_strcpy(kernelbuf, "PSDEMO");
    reboot("PSX.EXE", "SYSTEM.CNF");
}

// NONMATCHING
void reset2(void) {
    reboot("PSX.EXE","SYSTEM.CNF");
}

INCLUDE_ASM("asm/nonmatchings/BCB8", reboot);