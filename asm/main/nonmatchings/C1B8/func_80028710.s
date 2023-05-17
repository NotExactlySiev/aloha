.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028710
/* 10F10 80028710 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10F14 80028714 1000BFAF */  sw         $ra, 0x10($sp)
/* 10F18 80028718 21288000 */  addu       $a1, $a0, $zero
/* 10F1C 8002871C E0AD000C */  jal        func_8002B780
/* 10F20 80028720 03000434 */   ori       $a0, $zero, 0x3
/* 10F24 80028724 1000BF8F */  lw         $ra, 0x10($sp)
/* 10F28 80028728 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10F2C 8002872C 0800E003 */  jr         $ra
/* 10F30 80028730 00000000 */   nop
