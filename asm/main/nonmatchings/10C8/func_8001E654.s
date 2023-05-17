.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E654
/* 6E54 8001E654 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 6E58 8001E658 1800BFAF */  sw         $ra, 0x18($sp)
/* 6E5C 8001E65C 1400B1AF */  sw         $s1, 0x14($sp)
/* 6E60 8001E660 1000B0AF */  sw         $s0, 0x10($sp)
/* 6E64 8001E664 0580103C */  lui        $s0, %hi(D_800521E0)
/* 6E68 8001E668 E0211026 */  addiu      $s0, $s0, %lo(D_800521E0)
/* 6E6C 8001E66C 21880000 */  addu       $s1, $zero, $zero
/* 6E70 8001E670 DCC5000C */  jal        func_80031770
/* 6E74 8001E674 21200002 */   addu      $a0, $s0, $zero
/* 6E78 8001E678 21300000 */  addu       $a2, $zero, $zero
/* 6E7C 8001E67C 01000834 */  ori        $t0, $zero, 0x1
/* 6E80 8001E680 03000734 */  ori        $a3, $zero, 0x3
/* 6E84 8001E684 0580023C */  lui        $v0, %hi(D_80052060)
/* 6E88 8001E688 60204224 */  addiu      $v0, $v0, %lo(D_80052060)
/* 6E8C 8001E68C 06004324 */  addiu      $v1, $v0, 0x6
.L8001E690:
/* 6E90 8001E690 09006590 */  lbu        $a1, 0x9($v1)
/* 6E94 8001E694 00000000 */  nop
/* 6E98 8001E698 1A00A814 */  bne        $a1, $t0, .L8001E704
/* 6E9C 8001E69C 00000000 */   nop
/* 6EA0 8001E6A0 06006294 */  lhu        $v0, 0x6($v1)
/* 6EA4 8001E6A4 00006484 */  lh         $a0, 0x0($v1)
/* 6EA8 8001E6A8 FF7F422C */  sltiu      $v0, $v0, 0x7FFF
/* 6EAC 8001E6AC 05004010 */  beqz       $v0, .L8001E6C4
/* 6EB0 8001E6B0 00000000 */   nop
/* 6EB4 8001E6B4 06006294 */  lhu        $v0, 0x6($v1)
/* 6EB8 8001E6B8 00000000 */  nop
/* 6EBC 8001E6BC 01004224 */  addiu      $v0, $v0, 0x1
/* 6EC0 8001E6C0 060062A4 */  sh         $v0, 0x6($v1)
.L8001E6C4:
/* 6EC4 8001E6C4 00000292 */  lbu        $v0, 0x0($s0)
/* 6EC8 8001E6C8 00000000 */  nop
/* 6ECC 8001E6CC 08004714 */  bne        $v0, $a3, .L8001E6F0
/* 6ED0 8001E6D0 00000000 */   nop
/* 6ED4 8001E6D4 01008224 */  addiu      $v0, $a0, 0x1
/* 6ED8 8001E6D8 000062A4 */  sh         $v0, 0x0($v1)
/* 6EDC 8001E6DC 0900822C */  sltiu      $v0, $a0, 0x9
/* 6EE0 8001E6E0 08004014 */  bnez       $v0, .L8001E704
/* 6EE4 8001E6E4 0410C500 */   sllv      $v0, $a1, $a2
/* 6EE8 8001E6E8 C1790008 */  j          .L8001E704
/* 6EEC 8001E6EC 25882202 */   or        $s1, $s1, $v0
.L8001E6F0:
/* 6EF0 8001E6F0 04008010 */  beqz       $a0, .L8001E704
/* 6EF4 8001E6F4 00000000 */   nop
/* 6EF8 8001E6F8 02004514 */  bne        $v0, $a1, .L8001E704
/* 6EFC 8001E6FC 00000000 */   nop
/* 6F00 8001E700 000060A4 */  sh         $zero, 0x0($v1)
.L8001E704:
/* 6F04 8001E704 0100C624 */  addiu      $a2, $a2, 0x1
/* 6F08 8001E708 10006324 */  addiu      $v1, $v1, 0x10
/* 6F0C 8001E70C 1800C228 */  slti       $v0, $a2, 0x18
/* 6F10 8001E710 DFFF4014 */  bnez       $v0, .L8001E690
/* 6F14 8001E714 01001026 */   addiu     $s0, $s0, 0x1
/* 6F18 8001E718 03002012 */  beqz       $s1, .L8001E728
/* 6F1C 8001E71C 00000000 */   nop
/* 6F20 8001E720 5E7D000C */  jal        func_8001F578
/* 6F24 8001E724 21202002 */   addu      $a0, $s1, $zero
.L8001E728:
/* 6F28 8001E728 BD78000C */  jal        func_8001E2F4
/* 6F2C 8001E72C 00000000 */   nop
/* 6F30 8001E730 1800BF8F */  lw         $ra, 0x18($sp)
/* 6F34 8001E734 1400B18F */  lw         $s1, 0x14($sp)
/* 6F38 8001E738 1000B08F */  lw         $s0, 0x10($sp)
/* 6F3C 8001E73C 0800E003 */  jr         $ra
/* 6F40 8001E740 2000BD27 */   addiu     $sp, $sp, 0x20
