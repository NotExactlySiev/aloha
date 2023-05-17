.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021D08
/* A508 80021D08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* A50C 80021D0C 1800BFAF */  sw         $ra, 0x18($sp)
/* A510 80021D10 1400B1AF */  sw         $s1, 0x14($sp)
/* A514 80021D14 1000B0AF */  sw         $s0, 0x10($sp)
/* A518 80021D18 21808000 */  addu       $s0, $a0, $zero
/* A51C 80021D1C 0080000C */  jal        func_80020000
/* A520 80021D20 2188A000 */   addu      $s1, $a1, $zero
/* A524 80021D24 21184000 */  addu       $v1, $v0, $zero
/* A528 80021D28 01000234 */  ori        $v0, $zero, 0x1
/* A52C 80021D2C 04006214 */  bne        $v1, $v0, .L80021D40
/* A530 80021D30 21106000 */   addu      $v0, $v1, $zero
/* A534 80021D34 21200002 */  addu       $a0, $s0, $zero
/* A538 80021D38 8A80000C */  jal        func_80020228
/* A53C 80021D3C 21282002 */   addu      $a1, $s1, $zero
.L80021D40:
/* A540 80021D40 1800BF8F */  lw         $ra, 0x18($sp)
/* A544 80021D44 1400B18F */  lw         $s1, 0x14($sp)
/* A548 80021D48 1000B08F */  lw         $s0, 0x10($sp)
/* A54C 80021D4C 0800E003 */  jr         $ra
/* A550 80021D50 2000BD27 */   addiu     $sp, $sp, 0x20
