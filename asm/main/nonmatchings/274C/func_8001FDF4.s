.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FDF4
/* 85F4 8001FDF4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 85F8 8001FDF8 2800BFAF */  sw         $ra, 0x28($sp)
/* 85FC 8001FDFC 2400B5AF */  sw         $s5, 0x24($sp)
/* 8600 8001FE00 2000B4AF */  sw         $s4, 0x20($sp)
/* 8604 8001FE04 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8608 8001FE08 1800B2AF */  sw         $s2, 0x18($sp)
/* 860C 8001FE0C 1400B1AF */  sw         $s1, 0x14($sp)
/* 8610 8001FE10 1000B0AF */  sw         $s0, 0x10($sp)
/* 8614 8001FE14 1F009330 */  andi       $s3, $a0, 0x1F
/* 8618 8001FE18 E8031234 */  ori        $s2, $zero, 0x3E8
/* 861C 8001FE1C 00801434 */  ori        $s4, $zero, 0x8000
/* 8620 8001FE20 00021034 */  ori        $s0, $zero, 0x200
.L8001FE24:
/* 8624 8001FE24 E8031134 */  ori        $s1, $zero, 0x3E8
.L8001FE28:
/* 8628 8001FE28 2A8F000C */  jal        _card_info
/* 862C 8001FE2C 21206002 */   addu      $a0, $s3, $zero
/* 8630 8001FE30 04004014 */  bnez       $v0, .L8001FE44
/* 8634 8001FE34 00000000 */   nop
/* 8638 8001FE38 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 863C 8001FE3C FAFF201E */  bgtz       $s1, .L8001FE28
/* 8640 8001FE40 00000000 */   nop
.L8001FE44:
/* 8644 8001FE44 50002012 */  beqz       $s1, .L8001FF88
/* 8648 8001FE48 01000234 */   ori       $v0, $zero, 0x1
.L8001FE4C:
/* 864C 8001FE4C 177F000C */  jal        func_8001FC5C
/* 8650 8001FE50 00000000 */   nop
/* 8654 8001FE54 21884000 */  addu       $s1, $v0, $zero
/* 8658 8001FE58 07002016 */  bnez       $s1, .L8001FE78
/* 865C 8001FE5C 00000000 */   nop
/* 8660 8001FE60 286C000C */  jal        cd_run_block
/* 8664 8001FE64 00000000 */   nop
/* 8668 8001FE68 F57F000C */  jal        func_8001FFD4
/* 866C 8001FE6C 00000000 */   nop
/* 8670 8001FE70 937F0008 */  j          .L8001FE4C
/* 8674 8001FE74 00000000 */   nop
.L8001FE78:
/* 8678 8001FE78 03003412 */  beq        $s1, $s4, .L8001FE88
/* 867C 8001FE7C FFFF5226 */   addiu     $s2, $s2, -0x1
/* 8680 8001FE80 03003016 */  bne        $s1, $s0, .L8001FE90
/* 8684 8001FE84 04000234 */   ori       $v0, $zero, 0x4
.L8001FE88:
/* 8688 8001FE88 E6FF401E */  bgtz       $s2, .L8001FE24
/* 868C 8001FE8C 04000234 */   ori       $v0, $zero, 0x4
.L8001FE90:
/* 8690 8001FE90 05002212 */  beq        $s1, $v0, .L8001FEA8
/* 8694 8001FE94 00200234 */   ori       $v0, $zero, 0x2000
/* 8698 8001FE98 08002212 */  beq        $s1, $v0, .L8001FEBC
/* 869C 8001FE9C 01000234 */   ori       $v0, $zero, 0x1
/* 86A0 8001FEA0 E27F0008 */  j          .L8001FF88
/* 86A4 8001FEA4 00000000 */   nop
.L8001FEA8:
/* 86A8 8001FEA8 0480033C */  lui        $v1, %hi(D_80047E18)
/* 86AC 8001FEAC 187E638C */  lw         $v1, %lo(D_80047E18)($v1)
/* 86B0 8001FEB0 01000234 */  ori        $v0, $zero, 0x1
/* 86B4 8001FEB4 32006214 */  bne        $v1, $v0, .L8001FF80
/* 86B8 8001FEB8 04000234 */   ori       $v0, $zero, 0x4
.L8001FEBC:
/* 86BC 8001FEBC 637F000C */  jal        func_8001FD8C
/* 86C0 8001FEC0 00000000 */   nop
/* 86C4 8001FEC4 448C000C */  jal        card_write
/* 86C8 8001FEC8 21206002 */   addu      $a0, $s3, $zero
.L8001FECC:
/* 86CC 8001FECC 3D7F000C */  jal        func_8001FCF4
/* 86D0 8001FED0 00000000 */   nop
/* 86D4 8001FED4 FDFF4010 */  beqz       $v0, .L8001FECC
/* 86D8 8001FED8 E8031234 */   ori       $s2, $zero, 0x3E8
/* 86DC 8001FEDC 00801534 */  ori        $s5, $zero, 0x8000
/* 86E0 8001FEE0 00021434 */  ori        $s4, $zero, 0x200
.L8001FEE4:
/* 86E4 8001FEE4 E8031034 */  ori        $s0, $zero, 0x3E8
.L8001FEE8:
/* 86E8 8001FEE8 268F000C */  jal         _card_load
/* 86EC 8001FEEC 21206002 */   addu      $a0, $s3, $zero
/* 86F0 8001FEF0 04004014 */  bnez       $v0, .L8001FF04
/* 86F4 8001FEF4 00000000 */   nop
/* 86F8 8001FEF8 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 86FC 8001FEFC FAFF001E */  bgtz       $s0, .L8001FEE8
/* 8700 8001FF00 00000000 */   nop
.L8001FF04:
/* 8704 8001FF04 20000012 */  beqz       $s0, .L8001FF88
/* 8708 8001FF08 01000234 */   ori       $v0, $zero, 0x1
.L8001FF0C:
/* 870C 8001FF0C 177F000C */  jal        func_8001FC5C
/* 8710 8001FF10 00000000 */   nop
/* 8714 8001FF14 21804000 */  addu       $s0, $v0, $zero
/* 8718 8001FF18 07000016 */  bnez       $s0, .L8001FF38
/* 871C 8001FF1C 00000000 */   nop
/* 8720 8001FF20 286C000C */  jal        cd_run_block
/* 8724 8001FF24 00000000 */   nop
/* 8728 8001FF28 F57F000C */  jal        func_8001FFD4
/* 872C 8001FF2C 00000000 */   nop
/* 8730 8001FF30 C37F0008 */  j          .L8001FF0C
/* 8734 8001FF34 00000000 */   nop
.L8001FF38:
/* 8738 8001FF38 03001512 */  beq        $s0, $s5, .L8001FF48
/* 873C 8001FF3C FFFF5226 */   addiu     $s2, $s2, -0x1
/* 8740 8001FF40 03001416 */  bne        $s0, $s4, .L8001FF50
/* 8744 8001FF44 04000234 */   ori       $v0, $zero, 0x4
.L8001FF48:
/* 8748 8001FF48 E6FF401E */  bgtz       $s2, .L8001FEE4
/* 874C 8001FF4C 04000234 */   ori       $v0, $zero, 0x4
.L8001FF50:
/* 8750 8001FF50 07000212 */  beq        $s0, $v0, .L8001FF70
/* 8754 8001FF54 00200234 */   ori       $v0, $zero, 0x2000
/* 8758 8001FF58 08000216 */  bne        $s0, $v0, .L8001FF7C
/* 875C 8001FF5C 01000234 */   ori       $v0, $zero, 0x1
/* 8760 8001FF60 0480013C */  lui        $at, %hi(D_80047E18)
/* 8764 8001FF64 187E22AC */  sw         $v0, %lo(D_80047E18)($at)
/* 8768 8001FF68 E87F0008 */  j          .L8001FFA0
/* 876C 8001FF6C FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001FF70:
/* 8770 8001FF70 0480013C */  lui        $at, %hi(D_80047E18)
/* 8774 8001FF74 187E20AC */  sw         $zero, %lo(D_80047E18)($at)
/* 8778 8001FF78 04001134 */  ori        $s1, $zero, 0x4
.L8001FF7C:
/* 877C 8001FF7C 04000234 */  ori        $v0, $zero, 0x4
.L8001FF80:
/* 8780 8001FF80 05002212 */  beq        $s1, $v0, .L8001FF98
/* 8784 8001FF84 01000234 */   ori       $v0, $zero, 0x1
.L8001FF88:
/* 8788 8001FF88 0480013C */  lui        $at, %hi(D_80047E18)
/* 878C 8001FF8C 187E22AC */  sw         $v0, %lo(D_80047E18)($at)
/* 8790 8001FF90 E87F0008 */  j          .L8001FFA0
/* 8794 8001FF94 FEFF0224 */   addiu     $v0, $zero, -0x2
.L8001FF98:
/* 8798 8001FF98 0480013C */  lui        $at, %hi(D_80047E18)
/* 879C 8001FF9C 187E20AC */  sw         $zero, %lo(D_80047E18)($at)
.L8001FFA0:
/* 87A0 8001FFA0 2800BF8F */  lw         $ra, 0x28($sp)
/* 87A4 8001FFA4 2400B58F */  lw         $s5, 0x24($sp)
/* 87A8 8001FFA8 2000B48F */  lw         $s4, 0x20($sp)
/* 87AC 8001FFAC 1C00B38F */  lw         $s3, 0x1C($sp)
/* 87B0 8001FFB0 1800B28F */  lw         $s2, 0x18($sp)
/* 87B4 8001FFB4 1400B18F */  lw         $s1, 0x14($sp)
/* 87B8 8001FFB8 1000B08F */  lw         $s0, 0x10($sp)
/* 87BC 8001FFBC 0800E003 */  jr         $ra
/* 87C0 8001FFC0 3000BD27 */   addiu     $sp, $sp, 0x30
