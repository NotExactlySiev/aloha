.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EA100
/* A900 800EA100 */ .word 0x90880000
/* A904 800EA104 */ .word 0x90890001
/* A908 800EA108 */ .word 0x48864000
/* A90C 800EA10C */ .word 0x48C8A800
/* A910 800EA110 */ .word 0x48C9B000
/* A914 800EA114 */ .word 0x90A80000
/* A918 800EA118 */ .word 0x90A90001
/* A91C 800EA11C */ .word 0x48884800
/* A920 800EA120 */ .word 0x48895000
/* A924 800EA124 */ .word 0x00000000
/* A928 800EA128 */ .word 0x00000000
/* A92C 800EA12C */ .word 0x4A980011 # invalid instruction
/* A930 800EA130 */ .word 0x48084800
/* A934 800EA134 */ .word 0x48095000
/* A938 800EA138 */ .word 0xA0E80000
/* A93C 800EA13C */ .word 0xA0E90001
/* A940 800EA140 */ .word 0x03E00008
/* A944 800EA144 */ .word 0x00000000
/* A948 800EA148 */ .word 0x00000000
