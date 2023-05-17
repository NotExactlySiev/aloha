.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025D20
/* E520 80025D20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E524 80025D24 1000B0AF */  sw         $s0, 0x10($sp)
/* E528 80025D28 21808000 */  addu       $s0, $a0, $zero
/* E52C 80025D2C 02000234 */  ori        $v0, $zero, 0x2
/* E530 80025D30 1400BFAF */  sw         $ra, 0x14($sp)
/* E534 80025D34 030002A2 */  sb         $v0, 0x3($s0)
/* E538 80025D38 0000A484 */  lh         $a0, 0x0($a1)
/* E53C 80025D3C 0200A584 */  lh         $a1, 0x2($a1)
/* E540 80025D40 A198000C */  jal        func_80026284
/* E544 80025D44 00000000 */   nop
/* E548 80025D48 040002AE */  sw         $v0, 0x4($s0)
/* E54C 80025D4C 080000AE */  sw         $zero, 0x8($s0)
/* E550 80025D50 1400BF8F */  lw         $ra, 0x14($sp)
/* E554 80025D54 1000B08F */  lw         $s0, 0x10($sp)
/* E558 80025D58 1800BD27 */  addiu      $sp, $sp, 0x18
/* E55C 80025D5C 0800E003 */  jr         $ra
/* E560 80025D60 00000000 */   nop
