.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028774
/* 10F74 80028774 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 10F78 80028778 1400B1AF */  sw         $s1, 0x14($sp)
/* 10F7C 8002877C 21888000 */  addu       $s1, $a0, $zero
/* 10F80 80028780 1800B2AF */  sw         $s2, 0x18($sp)
/* 10F84 80028784 2190A000 */  addu       $s2, $a1, $zero
/* 10F88 80028788 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 10F8C 8002878C 2198C000 */  addu       $s3, $a2, $zero
/* 10F90 80028790 1000B0AF */  sw         $s0, 0x10($sp)
/* 10F94 80028794 03001034 */  ori        $s0, $zero, 0x3
/* 10F98 80028798 2000B4AF */  sw         $s4, 0x20($sp)
/* 10F9C 8002879C FFFF1424 */  addiu      $s4, $zero, -0x1
/* 10FA0 800287A0 2400BFAF */  sw         $ra, 0x24($sp)
/* 10FA4 800287A4 21204002 */  addu       $a0, $s2, $zero
.L800287A8:
/* 10FA8 800287A8 21282002 */  addu       $a1, $s1, $zero
/* 10FAC 800287AC DAA7000C */  jal        func_80029F68
/* 10FB0 800287B0 21306002 */   addu      $a2, $s3, $zero
/* 10FB4 800287B4 03004014 */  bnez       $v0, .L800287C4
/* 10FB8 800287B8 FFFF1026 */   addiu     $s0, $s0, -0x1
/* 10FBC 800287BC F4A10008 */  j          .L800287D0
/* 10FC0 800287C0 01000234 */   ori       $v0, $zero, 0x1
.L800287C4:
/* 10FC4 800287C4 F8FF1416 */  bne        $s0, $s4, .L800287A8
/* 10FC8 800287C8 21204002 */   addu      $a0, $s2, $zero
/* 10FCC 800287CC 21100000 */  addu       $v0, $zero, $zero
.L800287D0:
/* 10FD0 800287D0 2400BF8F */  lw         $ra, 0x24($sp)
/* 10FD4 800287D4 2000B48F */  lw         $s4, 0x20($sp)
/* 10FD8 800287D8 1C00B38F */  lw         $s3, 0x1C($sp)
/* 10FDC 800287DC 1800B28F */  lw         $s2, 0x18($sp)
/* 10FE0 800287E0 1400B18F */  lw         $s1, 0x14($sp)
/* 10FE4 800287E4 1000B08F */  lw         $s0, 0x10($sp)
/* 10FE8 800287E8 2800BD27 */  addiu      $sp, $sp, 0x28
/* 10FEC 800287EC 0800E003 */  jr         $ra
/* 10FF0 800287F0 00000000 */   nop
