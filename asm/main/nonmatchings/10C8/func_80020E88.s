.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020E88
/* 9688 80020E88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 968C 80020E8C 1000BFAF */  sw         $ra, 0x10($sp)
/* 9690 80020E90 0480013C */  lui        $at, %hi(D_80047E26)
/* 9694 80020E94 267E20A4 */  sh         $zero, %lo(D_80047E26)($at)
/* 9698 80020E98 21200000 */  addu       $a0, $zero, $zero
/* 969C 80020E9C BC83000C */  jal        func_80020EF0
/* 96A0 80020EA0 21280000 */   addu      $a1, $zero, $zero
/* 96A4 80020EA4 1000BF8F */  lw         $ra, 0x10($sp)
/* 96A8 80020EA8 00000000 */  nop
/* 96AC 80020EAC 0800E003 */  jr         $ra
/* 96B0 80020EB0 1800BD27 */   addiu     $sp, $sp, 0x18
