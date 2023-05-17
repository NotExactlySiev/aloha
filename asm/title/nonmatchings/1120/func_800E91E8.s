.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E91E8
/* 99E8 800E91E8 */ .word 0x8C880000
/* 99EC 800E91EC */ .word 0x8C890004
/* 99F0 800E91F0 */ .word 0x48880000
/* 99F4 800E91F4 */ .word 0x48890800
/* 99F8 800E91F8 */ .word 0x00000000
/* 99FC 800E91FC */ .word 0x4A486012 # invalid instruction
/* 9A00 800E9200 */ .word 0xE8A90000
/* 9A04 800E9204 */ .word 0xE8AA0004
/* 9A08 800E9208 */ .word 0xE8AB0008
/* 9A0C 800E920C */ .word 0x00C01021
/* 9A10 800E9210 */ .word 0x03E00008
/* 9A14 800E9214 */ .word 0x00000000
