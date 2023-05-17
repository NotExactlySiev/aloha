.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E250
/* 6A50 8001E250 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A54 8001E254 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A58 8001E258 21288000 */  addu       $a1, $a0, $zero
/* 6A5C 8001E25C BCC5000C */  jal        func_800316F0
/* 6A60 8001E260 21200000 */   addu      $a0, $zero, $zero
/* 6A64 8001E264 1000BF8F */  lw         $ra, 0x10($sp)
/* 6A68 8001E268 00000000 */  nop
/* 6A6C 8001E26C 0800E003 */  jr         $ra
/* 6A70 8001E270 1800BD27 */   addiu     $sp, $sp, 0x18
