.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001EEA4
/* 76A4 8001EEA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 76A8 8001EEA8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 76AC 8001EEAC 1800B2AF */  sw         $s2, 0x18($sp)
/* 76B0 8001EEB0 1400B1AF */  sw         $s1, 0x14($sp)
/* 76B4 8001EEB4 2188A000 */  addu       $s1, $a1, $zero
/* 76B8 8001EEB8 06002016 */  bnez       $s1, .L8001EED4
/* 76BC 8001EEBC 1000B0AF */   sw        $s0, 0x10($sp)
/* 76C0 8001EEC0 12008294 */  lhu        $v0, 0x12($a0)
/* 76C4 8001EEC4 00000000 */  nop
/* 76C8 8001EEC8 40120200 */  sll        $v0, $v0, 9
/* 76CC 8001EECC 200A4224 */  addiu      $v0, $v0, 0xA20
/* 76D0 8001EED0 21888200 */  addu       $s1, $a0, $v0
.L8001EED4:
/* 76D4 8001EED4 00140600 */  sll        $v0, $a2, 16
/* 76D8 8001EED8 03140200 */  sra        $v0, $v0, 16
/* 76DC 8001EEDC C0180200 */  sll        $v1, $v0, 3
/* 76E0 8001EEE0 23186200 */  subu       $v1, $v1, $v0
/* 76E4 8001EEE4 C0800300 */  sll        $s0, $v1, 3
/* 76E8 8001EEE8 0580013C */  lui        $at, %hi(D_80051DB6)
/* 76EC 8001EEEC B61D2124 */  addiu      $at, $at, %lo(D_80051DB6)
/* 76F0 8001EEF0 21083000 */  addu       $at, $at, $s0
/* 76F4 8001EEF4 00002290 */  lbu        $v0, 0x0($at)
/* 76F8 8001EEF8 00000000 */  nop
/* 76FC 8001EEFC 03004014 */  bnez       $v0, .L8001EF0C
/* 7700 8001EF00 01000234 */   ori       $v0, $zero, 0x1
/* 7704 8001EF04 E57B0008 */  j          .L8001EF94
/* 7708 8001EF08 FEFF0224 */   addiu     $v0, $zero, -0x2
.L8001EF0C:
/* 770C 8001EF0C 0580013C */  lui        $at, %hi(D_80051DB7)
/* 7710 8001EF10 B71D2124 */  addiu      $at, $at, %lo(D_80051DB7)
/* 7714 8001EF14 21083000 */  addu       $at, $at, $s0
/* 7718 8001EF18 00002390 */  lbu        $v1, 0x0($at)
/* 771C 8001EF1C 00000000 */  nop
/* 7720 8001EF20 1C006210 */  beq        $v1, $v0, .L8001EF94
/* 7724 8001EF24 00000000 */   nop
/* 7728 8001EF28 0580023C */  lui        $v0, %hi(D_80051D80)
/* 772C 8001EF2C 801D4224 */  addiu      $v0, $v0, %lo(D_80051D80)
/* 7730 8001EF30 21900202 */  addu       $s2, $s0, $v0
/* 7734 8001EF34 0C00448E */  lw         $a0, 0xC($s2)
/* 7738 8001EF38 CCB5000C */  jal        func_8002D730
/* 773C 8001EF3C 00000000 */   nop
/* 7740 8001EF40 21204000 */  addu       $a0, $v0, $zero
/* 7744 8001EF44 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7748 8001EF48 12008210 */  beq        $a0, $v0, .L8001EF94
/* 774C 8001EF4C 00000000 */   nop
/* 7750 8001EF50 0580013C */  lui        $at, %hi(D_80051DA8)
/* 7754 8001EF54 A81D2124 */  addiu      $at, $at, %lo(D_80051DA8)
/* 7758 8001EF58 21083000 */  addu       $at, $at, $s0
/* 775C 8001EF5C 000024AC */  sw         $a0, 0x0($at)
/* 7760 8001EF60 1378000C */  jal        func_8001E04C
/* 7764 8001EF64 00000000 */   nop
/* 7768 8001EF68 0C00458E */  lw         $a1, 0xC($s2)
/* 776C 8001EF6C 0B78000C */  jal        func_8001E02C
/* 7770 8001EF70 21202002 */   addu      $a0, $s1, $zero
/* 7774 8001EF74 FB77000C */  jal        func_8001DFEC
/* 7778 8001EF78 01000434 */   ori       $a0, $zero, 0x1
/* 777C 8001EF7C 01000234 */  ori        $v0, $zero, 0x1
/* 7780 8001EF80 0580013C */  lui        $at, %hi(D_80051DB7)
/* 7784 8001EF84 B71D2124 */  addiu      $at, $at, %lo(D_80051DB7)
/* 7788 8001EF88 21083000 */  addu       $at, $at, $s0
/* 778C 8001EF8C 000022A0 */  sb         $v0, 0x0($at)
/* 7790 8001EF90 21100000 */  addu       $v0, $zero, $zero
.L8001EF94:
/* 7794 8001EF94 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 7798 8001EF98 1800B28F */  lw         $s2, 0x18($sp)
/* 779C 8001EF9C 1400B18F */  lw         $s1, 0x14($sp)
/* 77A0 8001EFA0 1000B08F */  lw         $s0, 0x10($sp)
/* 77A4 8001EFA4 0800E003 */  jr         $ra
/* 77A8 8001EFA8 2000BD27 */   addiu     $sp, $sp, 0x20
