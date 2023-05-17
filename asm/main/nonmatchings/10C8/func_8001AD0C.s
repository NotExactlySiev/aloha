.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AD0C
/* 350C 8001AD0C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 3510 8001AD10 2000BFAF */  sw         $ra, 0x20($sp)
/* 3514 8001AD14 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3518 8001AD18 1800B2AF */  sw         $s2, 0x18($sp)
/* 351C 8001AD1C 1400B1AF */  sw         $s1, 0x14($sp)
/* 3520 8001AD20 1000B0AF */  sw         $s0, 0x10($sp)
/* 3524 8001AD24 21808000 */  addu       $s0, $a0, $zero
/* 3528 8001AD28 2188A000 */  addu       $s1, $a1, $zero
/* 352C 8001AD2C 2198C000 */  addu       $s3, $a2, $zero
/* 3530 8001AD30 0480023C */  lui        $v0, %hi(D_80047DBC)
/* 3534 8001AD34 BC7D428C */  lw         $v0, %lo(D_80047DBC)($v0)
/* 3538 8001AD38 01001234 */  ori        $s2, $zero, 0x1
/* 353C 8001AD3C 4D005210 */  beq        $v0, $s2, .L8001AE74
/* 3540 8001AD40 21100000 */   addu      $v0, $zero, $zero
/* 3544 8001AD44 7566000C */  jal        func_800199D4
/* 3548 8001AD48 00000000 */   nop
/* 354C 8001AD4C 14005214 */  bne        $v0, $s2, .L8001ADA0
/* 3550 8001AD50 01000234 */   ori       $v0, $zero, 0x1
/* 3554 8001AD54 80101000 */  sll        $v0, $s0, 2
/* 3558 8001AD58 21800202 */  addu       $s0, $s0, $v0
/* 355C 8001AD5C 06000234 */  ori        $v0, $zero, 0x6
/* 3560 8001AD60 1A000202 */  div        $zero, $s0, $v0
/* 3564 8001AD64 02004014 */  bnez       $v0, .L8001AD70
/* 3568 8001AD68 00000000 */   nop
/* 356C 8001AD6C 0D000700 */  break      7
.L8001AD70:
/* 3570 8001AD70 FFFF0124 */  addiu      $at, $zero, -0x1
/* 3574 8001AD74 04004114 */  bne        $v0, $at, .L8001AD88
/* 3578 8001AD78 0080013C */   lui       $at, (0x80000000 >> 16)
/* 357C 8001AD7C 02000116 */  bne        $s0, $at, .L8001AD88
/* 3580 8001AD80 00000000 */   nop
/* 3584 8001AD84 0D000600 */  break      6
.L8001AD88:
/* 3588 8001AD88 12800000 */  mflo       $s0
/* 358C 8001AD8C 00000000 */  nop
/* 3590 8001AD90 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 3594 8001AD94 0200001E */  bgtz       $s0, .L8001ADA0
/* 3598 8001AD98 01000234 */   ori       $v0, $zero, 0x1
/* 359C 8001AD9C 01001034 */  ori        $s0, $zero, 0x1
.L8001ADA0:
/* 35A0 8001ADA0 0480013C */  lui        $at, %hi(D_80047DBC)
/* 35A4 8001ADA4 BC7D22AC */  sw         $v0, %lo(D_80047DBC)($at)
/* 35A8 8001ADA8 0480013C */  lui        $at, %hi(D_80047F14)
/* 35AC 8001ADAC 147F33AC */  sw         $s3, %lo(D_80047F14)($at)
/* 35B0 8001ADB0 0300001E */  bgtz       $s0, .L8001ADC0
/* 35B4 8001ADB4 0104022A */   slti      $v0, $s0, 0x401
/* 35B8 8001ADB8 01001034 */  ori        $s0, $zero, 0x1
/* 35BC 8001ADBC 0104022A */  slti       $v0, $s0, 0x401
.L8001ADC0:
/* 35C0 8001ADC0 02004014 */  bnez       $v0, .L8001ADCC
/* 35C4 8001ADC4 0104222A */   slti      $v0, $s1, 0x401
/* 35C8 8001ADC8 00041034 */  ori        $s0, $zero, 0x400
.L8001ADCC:
/* 35CC 8001ADCC 02004014 */  bnez       $v0, .L8001ADD8
/* 35D0 8001ADD0 00000000 */   nop
/* 35D4 8001ADD4 00041134 */  ori        $s1, $zero, 0x400
.L8001ADD8:
/* 35D8 8001ADD8 02002106 */  bgez       $s1, .L8001ADE4
/* 35DC 8001ADDC 00040234 */   ori       $v0, $zero, 0x400
/* 35E0 8001ADE0 21880000 */  addu       $s1, $zero, $zero
.L8001ADE4:
/* 35E4 8001ADE4 1A005000 */  div        $zero, $v0, $s0
/* 35E8 8001ADE8 02000016 */  bnez       $s0, .L8001ADF4
/* 35EC 8001ADEC 00000000 */   nop
/* 35F0 8001ADF0 0D000700 */  break      7
.L8001ADF4:
/* 35F4 8001ADF4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 35F8 8001ADF8 04000116 */  bne        $s0, $at, .L8001AE0C
/* 35FC 8001ADFC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 3600 8001AE00 02004114 */  bne        $v0, $at, .L8001AE0C
/* 3604 8001AE04 00000000 */   nop
/* 3608 8001AE08 0D000600 */  break      6
.L8001AE0C:
/* 360C 8001AE0C 12100000 */  mflo       $v0
/* 3610 8001AE10 0480013C */  lui        $at, %hi(D_80047DD0)
/* 3614 8001AE14 D07D31AC */  sw         $s1, %lo(D_80047DD0)($at)
/* 3618 8001AE18 0280043C */  lui        $a0, %hi(func_8001AA80)
/* 361C 8001AE1C 80AA8424 */  addiu      $a0, $a0, %lo(func_8001AA80)
/* 3620 8001AE20 0480013C */  lui        $at, %hi(D_80047DC4)
/* 3624 8001AE24 C47D22AC */  sw         $v0, %lo(D_80047DC4)($at)
/* 3628 8001AE28 628C000C */  jal        func_80023188
/* 362C 8001AE2C 01000534 */   ori       $a1, $zero, 0x1
/* 3630 8001AE30 0480013C */  lui        $at, %hi(D_80047F04)
/* 3634 8001AE34 047F22AC */  sw         $v0, %lo(D_80047F04)($at)
/* 3638 8001AE38 0480023C */  lui        $v0, %hi(D_80047F04)
/* 363C 8001AE3C 047F428C */  lw         $v0, %lo(D_80047F04)($v0)
/* 3640 8001AE40 00000000 */  nop
/* 3644 8001AE44 06004004 */  bltz       $v0, .L8001AE60
/* 3648 8001AE48 FA000434 */   ori       $a0, $zero, 0xFA
/* 364C 8001AE4C 01000534 */  ori        $a1, $zero, 0x1
/* 3650 8001AE50 086C000C */  jal        func_8001B020
/* 3654 8001AE54 21300000 */   addu      $a2, $zero, $zero
/* 3658 8001AE58 9D6B0008 */  j          .L8001AE74
/* 365C 8001AE5C 01000234 */   ori       $v0, $zero, 0x1
.L8001AE60:
/* 3660 8001AE60 0480013C */  lui        $at, %hi(D_80047DB4)
/* 3664 8001AE64 B47D20AC */  sw         $zero, %lo(D_80047DB4)($at)
/* 3668 8001AE68 0480013C */  lui        $at, %hi(D_80047DBC)
/* 366C 8001AE6C BC7D20AC */  sw         $zero, %lo(D_80047DBC)($at)
/* 3670 8001AE70 21100000 */  addu       $v0, $zero, $zero
.L8001AE74:
/* 3674 8001AE74 2000BF8F */  lw         $ra, 0x20($sp)
/* 3678 8001AE78 1C00B38F */  lw         $s3, 0x1C($sp)
/* 367C 8001AE7C 1800B28F */  lw         $s2, 0x18($sp)
/* 3680 8001AE80 1400B18F */  lw         $s1, 0x14($sp)
/* 3684 8001AE84 1000B08F */  lw         $s0, 0x10($sp)
/* 3688 8001AE88 0800E003 */  jr         $ra
/* 368C 8001AE8C 2800BD27 */   addiu     $sp, $sp, 0x28
