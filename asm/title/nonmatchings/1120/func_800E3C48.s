.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3C48
/* 4448 800E3C48 0500A018 */  blez       $a1, .L800E3C60
/* 444C 800E3C4C 00000000 */   nop
.L800E3C50:
/* 4450 800E3C50 000080A0 */  sb         $zero, 0x0($a0)
/* 4454 800E3C54 FFFFA524 */  addiu      $a1, $a1, -0x1
/* 4458 800E3C58 FDFFA01C */  bgtz       $a1, .L800E3C50
/* 445C 800E3C5C 01008424 */   addiu     $a0, $a0, 0x1
.L800E3C60:
/* 4460 800E3C60 0800E003 */  jr         $ra
/* 4464 800E3C64 00000000 */   nop
