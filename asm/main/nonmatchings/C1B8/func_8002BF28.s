.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BF28
/* 14728 8002BF28 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1472C 8002BF2C 1800B2AF */  sw         $s2, 0x18($sp)
/* 14730 8002BF30 21908000 */  addu       $s2, $a0, $zero
/* 14734 8002BF34 0480033C */  lui        $v1, %hi(D_800473C0)
/* 14738 8002BF38 C0736324 */  addiu      $v1, $v1, %lo(D_800473C0)
/* 1473C 8002BF3C 80101200 */  sll        $v0, $s2, 2
/* 14740 8002BF40 1400B1AF */  sw         $s1, 0x14($sp)
/* 14744 8002BF44 21884300 */  addu       $s1, $v0, $v1
/* 14748 8002BF48 2000BFAF */  sw         $ra, 0x20($sp)
/* 1474C 8002BF4C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 14750 8002BF50 1000B0AF */  sw         $s0, 0x10($sp)
/* 14754 8002BF54 0000338E */  lw         $s3, 0x0($s1)
/* 14758 8002BF58 2180A000 */  addu       $s0, $a1, $zero
/* 1475C 8002BF5C 2C001312 */  beq        $s0, $s3, .L8002C010
/* 14760 8002BF60 21106002 */   addu      $v0, $s3, $zero
/* 14764 8002BF64 0480023C */  lui        $v0, %hi(D_800473BC)
/* 14768 8002BF68 BC734294 */  lhu        $v0, %lo(D_800473BC)($v0)
/* 1476C 8002BF6C 00000000 */  nop
/* 14770 8002BF70 27004010 */  beqz       $v0, .L8002C010
/* 14774 8002BF74 21106002 */   addu      $v0, $s3, $zero
/* 14778 8002BF78 0FAE000C */  jal        func_8002B83C
/* 1477C 8002BF7C 21200000 */   addu      $a0, $zero, $zero
/* 14780 8002BF80 11000012 */  beqz       $s0, .L8002BFC8
/* 14784 8002BF84 21304000 */   addu      $a2, $v0, $zero
/* 14788 8002BF88 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* 1478C 8002BF8C 0480053C */  lui        $a1, %hi(D_800473E0)
/* 14790 8002BF90 E073A58C */  lw         $a1, %lo(D_800473E0)($a1)
/* 14794 8002BF94 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 14798 8002BF98 000030AE */  sw         $s0, 0x0($s1)
/* 1479C 8002BF9C 0000A48C */  lw         $a0, 0x0($a1)
/* 147A0 8002BFA0 10004326 */  addiu      $v1, $s2, 0x10
/* 147A4 8002BFA4 24208200 */  and        $a0, $a0, $v0
/* 147A8 8002BFA8 01000234 */  ori        $v0, $zero, 0x1
/* 147AC 8002BFAC 04106200 */  sllv       $v0, $v0, $v1
/* 147B0 8002BFB0 8000033C */  lui        $v1, (0x800000 >> 16)
/* 147B4 8002BFB4 25104300 */  or         $v0, $v0, $v1
/* 147B8 8002BFB8 25208200 */  or         $a0, $a0, $v0
/* 147BC 8002BFBC 0000A4AC */  sw         $a0, 0x0($a1)
/* 147C0 8002BFC0 01B00008 */  j          .L8002C004
/* 147C4 8002BFC4 00000000 */   nop
.L8002BFC8:
/* 147C8 8002BFC8 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
/* 147CC 8002BFCC 0480053C */  lui        $a1, %hi(D_800473E0)
/* 147D0 8002BFD0 E073A58C */  lw         $a1, %lo(D_800473E0)($a1)
/* 147D4 8002BFD4 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* 147D8 8002BFD8 000020AE */  sw         $zero, 0x0($s1)
/* 147DC 8002BFDC 0000A38C */  lw         $v1, 0x0($a1)
/* 147E0 8002BFE0 10004426 */  addiu      $a0, $s2, 0x10
/* 147E4 8002BFE4 24186200 */  and        $v1, $v1, $v0
/* 147E8 8002BFE8 8000023C */  lui        $v0, (0x800000 >> 16)
/* 147EC 8002BFEC 25186200 */  or         $v1, $v1, $v0
/* 147F0 8002BFF0 01000234 */  ori        $v0, $zero, 0x1
/* 147F4 8002BFF4 04108200 */  sllv       $v0, $v0, $a0
/* 147F8 8002BFF8 27100200 */  nor        $v0, $zero, $v0
/* 147FC 8002BFFC 24186200 */  and        $v1, $v1, $v0
/* 14800 8002C000 0000A3AC */  sw         $v1, 0x0($a1)
.L8002C004:
/* 14804 8002C004 0FAE000C */  jal        func_8002B83C
/* 14808 8002C008 2120C000 */   addu      $a0, $a2, $zero
/* 1480C 8002C00C 21106002 */  addu       $v0, $s3, $zero
.L8002C010:
/* 14810 8002C010 2000BF8F */  lw         $ra, 0x20($sp)
/* 14814 8002C014 1C00B38F */  lw         $s3, 0x1C($sp)
/* 14818 8002C018 1800B28F */  lw         $s2, 0x18($sp)
/* 1481C 8002C01C 1400B18F */  lw         $s1, 0x14($sp)
/* 14820 8002C020 1000B08F */  lw         $s0, 0x10($sp)
/* 14824 8002C024 2800BD27 */  addiu      $sp, $sp, 0x28
/* 14828 8002C028 0800E003 */  jr         $ra
/* 1482C 8002C02C 00000000 */   nop
