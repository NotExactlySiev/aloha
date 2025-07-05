#pragma once

#define INCLUDE_ASM(FOLDER, NAME)                                             \
    __asm__(".section .text\n"                                                \
            "\t.align\t2\n"                                                   \
            "\t.globl\t" #NAME "\n"                                           \
            "\t.ent\t" #NAME "\n" #NAME ":\n"                                 \
            ".include \"" FOLDER "/" #NAME ".s\"\n"                           \
            "\t.set reorder\n"                                                \
            "\t.set at\n"                                                     \
            "\t.end\t" #NAME);
// omit .global
__asm__(".include \"macro.inc\"\n");

