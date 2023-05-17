.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800278A8
/* 100A8 800278A8 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 100AC 800278AC 0600C010 */  beqz       $a2, .L800278C8
/* 100B0 800278B0 FFFFC224 */   addiu     $v0, $a2, -0x1
/* 100B4 800278B4 FFFF0324 */  addiu      $v1, $zero, -0x1
.L800278B8:
/* 100B8 800278B8 000085A0 */  sb         $a1, 0x0($a0)
/* 100BC 800278BC FFFF4224 */  addiu      $v0, $v0, -0x1
/* 100C0 800278C0 FDFF4314 */  bne        $v0, $v1, .L800278B8
/* 100C4 800278C4 01008424 */   addiu     $a0, $a0, 0x1
.L800278C8:
/* 100C8 800278C8 0800BD27 */  addiu      $sp, $sp, 0x8
/* 100CC 800278CC 0800E003 */  jr         $ra
/* 100D0 800278D0 00000000 */   nop
