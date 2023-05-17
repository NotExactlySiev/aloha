.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D780
/* 5F80 8001D780 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 5F84 8001D784 2800BFAF */  sw         $ra, 0x28($sp)
/* 5F88 8001D788 2400B3AF */  sw         $s3, 0x24($sp)
/* 5F8C 8001D78C 2000B2AF */  sw         $s2, 0x20($sp)
/* 5F90 8001D790 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5F94 8001D794 1800B0AF */  sw         $s0, 0x18($sp)
/* 5F98 8001D798 21808000 */  addu       $s0, $a0, $zero
/* 5F9C 8001D79C 2188A000 */  addu       $s1, $a1, $zero
/* 5FA0 8001D7A0 C6A2000C */  jal        func_80028B18
/* 5FA4 8001D7A4 2190C000 */   addu      $s2, $a2, $zero
/* 5FA8 8001D7A8 21984000 */  addu       $s3, $v0, $zero
/* 5FAC 8001D7AC 21200002 */  addu       $a0, $s0, $zero
/* 5FB0 8001D7B0 21282002 */  addu       $a1, $s1, $zero
/* 5FB4 8001D7B4 1075000C */  jal        func_8001D440
/* 5FB8 8001D7B8 21802002 */   addu      $s0, $s1, $zero
/* 5FBC 8001D7BC 03004014 */  bnez       $v0, .L8001D7CC
/* 5FC0 8001D7C0 00000000 */   nop
.L8001D7C4:
/* 5FC4 8001D7C4 09760008 */  j          .L8001D824
/* 5FC8 8001D7C8 21100000 */   addu      $v0, $zero, $zero
.L8001D7CC:
/* 5FCC 8001D7CC 9F75000C */  jal        func_8001D67C
/* 5FD0 8001D7D0 0A002426 */   addiu     $a0, $s1, 0xA
/* 5FD4 8001D7D4 C21A0200 */  srl        $v1, $v0, 11
/* 5FD8 8001D7D8 2B107200 */  sltu       $v0, $v1, $s2
/* 5FDC 8001D7DC 02004010 */  beqz       $v0, .L8001D7E8
/* 5FE0 8001D7E0 00083126 */   addiu     $s1, $s1, 0x800
/* 5FE4 8001D7E4 21906000 */  addu       $s2, $v1, $zero
.L8001D7E8:
/* 5FE8 8001D7E8 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 5FEC 8001D7EC 0C00401A */  blez       $s2, .L8001D820
/* 5FF0 8001D7F0 01007326 */   addiu     $s3, $s3, 0x1
.L8001D7F4:
/* 5FF4 8001D7F4 21206002 */  addu       $a0, $s3, $zero
/* 5FF8 8001D7F8 85A2000C */  jal        func_80028A14
/* 5FFC 8001D7FC 1000A527 */   addiu     $a1, $sp, 0x10
/* 6000 8001D800 1000A427 */  addiu      $a0, $sp, 0x10
/* 6004 8001D804 1075000C */  jal        func_8001D440
/* 6008 8001D808 21282002 */   addu      $a1, $s1, $zero
/* 600C 8001D80C EDFF4010 */  beqz       $v0, .L8001D7C4
/* 6010 8001D810 01007326 */   addiu     $s3, $s3, 0x1
/* 6014 8001D814 FFFF5226 */  addiu      $s2, $s2, -0x1
/* 6018 8001D818 F6FF401E */  bgtz       $s2, .L8001D7F4
/* 601C 8001D81C 00083126 */   addiu     $s1, $s1, 0x800
.L8001D820:
/* 6020 8001D820 23103002 */  subu       $v0, $s1, $s0
.L8001D824:
/* 6024 8001D824 2800BF8F */  lw         $ra, 0x28($sp)
/* 6028 8001D828 2400B38F */  lw         $s3, 0x24($sp)
/* 602C 8001D82C 2000B28F */  lw         $s2, 0x20($sp)
/* 6030 8001D830 1C00B18F */  lw         $s1, 0x1C($sp)
/* 6034 8001D834 1800B08F */  lw         $s0, 0x18($sp)
/* 6038 8001D838 0800E003 */  jr         $ra
/* 603C 8001D83C 3000BD27 */   addiu     $sp, $sp, 0x30
