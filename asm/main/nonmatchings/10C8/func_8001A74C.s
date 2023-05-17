.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A74C
/* 2F4C 8001A74C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2F50 8001A750 1000BFAF */  sw         $ra, 0x10($sp)
/* 2F54 8001A754 B9A0000C */  jal        func_800282E4
/* 2F58 8001A758 21200000 */   addu      $a0, $zero, $zero
/* 2F5C 8001A75C BFA0000C */  jal        func_800282FC
/* 2F60 8001A760 21200000 */   addu      $a0, $zero, $zero
/* 2F64 8001A764 B3A0000C */  jal        func_800282CC
/* 2F68 8001A768 21200000 */   addu      $a0, $zero, $zero
/* 2F6C 8001A76C 1000BF8F */  lw         $ra, 0x10($sp)
/* 2F70 8001A770 00000000 */  nop
/* 2F74 8001A774 0800E003 */  jr         $ra
/* 2F78 8001A778 1800BD27 */   addiu     $sp, $sp, 0x18
