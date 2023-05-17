#include "common.h"

char kernelbuf[8];

void reboot(char*, char*);

INCLUDE_ASM("asm/nonmatchings/BCB8", parser);   // rle decode

INCLUDE_ASM("asm/nonmatchings/BCB8", wtf);      // lz1 decode

void __main(void) {
}

INCLUDE_ASM("asm/nonmatchings/BCB8", _start);

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

void func_800239A0(void) {
}