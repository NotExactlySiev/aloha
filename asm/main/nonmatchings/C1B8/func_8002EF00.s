.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002EF00
/* 17700 8002EF00 0580023C */  lui        $v0, %hi(D_800546EC)
/* 17704 8002EF04 EC46428C */  lw         $v0, %lo(D_800546EC)($v0)
/* 17708 8002EF08 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1770C 8002EF0C 2A004014 */  bnez       $v0, .L8002EFB8
/* 17710 8002EF10 1800BFAF */   sw        $ra, 0x18($sp)
/* 17714 8002EF14 0D000234 */  ori        $v0, $zero, 0xD
/* 17718 8002EF18 1400A2AF */  sw         $v0, 0x14($sp)
/* 1771C 8002EF1C 1000A0AF */  sw         $zero, 0x10($sp)
/* 17720 8002EF20 D4BB0008 */  j          .L8002EF50
/* 17724 8002EF24 00000000 */   nop
.L8002EF28:
/* 17728 8002EF28 1400A38F */  lw         $v1, 0x14($sp)
/* 1772C 8002EF2C 00000000 */  nop
/* 17730 8002EF30 40100300 */  sll        $v0, $v1, 1
/* 17734 8002EF34 21104300 */  addu       $v0, $v0, $v1
/* 17738 8002EF38 1400A2AF */  sw         $v0, 0x14($sp)
/* 1773C 8002EF3C 1000A28F */  lw         $v0, 0x10($sp)
/* 17740 8002EF40 00000000 */  nop
/* 17744 8002EF44 01004224 */  addiu      $v0, $v0, 0x1
/* 17748 8002EF48 1000A2AF */  sw         $v0, 0x10($sp)
/* 1774C 8002EF4C 1000A28F */  lw         $v0, 0x10($sp)
.L8002EF50:
/* 17750 8002EF50 00000000 */  nop
/* 17754 8002EF54 1000A28F */  lw         $v0, 0x10($sp)
/* 17758 8002EF58 00000000 */  nop
/* 1775C 8002EF5C F0004228 */  slti       $v0, $v0, 0xF0
/* 17760 8002EF60 F1FF4014 */  bnez       $v0, .L8002EF28
/* 17764 8002EF64 0D000234 */   ori       $v0, $zero, 0xD
/* 17768 8002EF68 1400A2AF */  sw         $v0, 0x14($sp)
/* 1776C 8002EF6C 1000A0AF */  sw         $zero, 0x10($sp)
/* 17770 8002EF70 E8BB0008 */  j          .L8002EFA0
/* 17774 8002EF74 00000000 */   nop
.L8002EF78:
/* 17778 8002EF78 1400A38F */  lw         $v1, 0x14($sp)
/* 1777C 8002EF7C 00000000 */  nop
/* 17780 8002EF80 40100300 */  sll        $v0, $v1, 1
/* 17784 8002EF84 21104300 */  addu       $v0, $v0, $v1
/* 17788 8002EF88 1400A2AF */  sw         $v0, 0x14($sp)
/* 1778C 8002EF8C 1000A28F */  lw         $v0, 0x10($sp)
/* 17790 8002EF90 00000000 */  nop
/* 17794 8002EF94 01004224 */  addiu      $v0, $v0, 0x1
/* 17798 8002EF98 1000A2AF */  sw         $v0, 0x10($sp)
/* 1779C 8002EF9C 1000A28F */  lw         $v0, 0x10($sp)
.L8002EFA0:
/* 177A0 8002EFA0 00000000 */  nop
/* 177A4 8002EFA4 1000A28F */  lw         $v0, 0x10($sp)
/* 177A8 8002EFA8 00000000 */  nop
/* 177AC 8002EFAC F0004228 */  slti       $v0, $v0, 0xF0
/* 177B0 8002EFB0 F1FF4014 */  bnez       $v0, .L8002EF78
/* 177B4 8002EFB4 00000000 */   nop
.L8002EFB8:
/* 177B8 8002EFB8 0480023C */  lui        $v0, %hi(D_80047D08)
/* 177BC 8002EFBC 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 177C0 8002EFC0 00000000 */  nop
/* 177C4 8002EFC4 AA014394 */  lhu        $v1, 0x1AA($v0)
/* 177C8 8002EFC8 00000000 */  nop
/* 177CC 8002EFCC CFFF6330 */  andi       $v1, $v1, 0xFFCF
/* 177D0 8002EFD0 AA0143A4 */  sh         $v1, 0x1AA($v0)
/* 177D4 8002EFD4 0580023C */  lui        $v0, %hi(D_80054714)
/* 177D8 8002EFD8 1447428C */  lw         $v0, %lo(D_80054714)($v0)
/* 177DC 8002EFDC 00000000 */  nop
/* 177E0 8002EFE0 08004010 */  beqz       $v0, .L8002F004
/* 177E4 8002EFE4 00F0043C */   lui       $a0, (0xF0000009 >> 16)
/* 177E8 8002EFE8 0580023C */  lui        $v0, %hi(D_80054714)
/* 177EC 8002EFEC 1447428C */  lw         $v0, %lo(D_80054714)($v0)
/* 177F0 8002EFF0 00000000 */  nop
/* 177F4 8002EFF4 09F84000 */  jalr       $v0
/* 177F8 8002EFF8 00000000 */   nop
/* 177FC 8002EFFC 04BC0008 */  j          .L8002F010
/* 17800 8002F000 00000000 */   nop
.L8002F004:
/* 17804 8002F004 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
/* 17808 8002F008 89A9000C */  jal        func_8002A624
/* 1780C 8002F00C 20000534 */   ori       $a1, $zero, 0x20
.L8002F010:
/* 17810 8002F010 1800BF8F */  lw         $ra, 0x18($sp)
/* 17814 8002F014 2000BD27 */  addiu      $sp, $sp, 0x20
/* 17818 8002F018 0800E003 */  jr         $ra
/* 1781C 8002F01C 00000000 */   nop
