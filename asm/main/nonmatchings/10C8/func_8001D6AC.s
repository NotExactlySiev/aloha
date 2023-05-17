.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D6AC
/* 5EAC 8001D6AC E8F7BD27 */  addiu      $sp, $sp, -0x818
/* 5EB0 8001D6B0 1408BFAF */  sw         $ra, 0x814($sp)
/* 5EB4 8001D6B4 1008B0AF */  sw         $s0, 0x810($sp)
/* 5EB8 8001D6B8 21808000 */  addu       $s0, $a0, $zero
/* 5EBC 8001D6BC 0480023C */  lui        $v0, %hi(D_80047EE4)
/* 5EC0 8001D6C0 E47E428C */  lw         $v0, %lo(D_80047EE4)($v0)
/* 5EC4 8001D6C4 00000000 */  nop
/* 5EC8 8001D6C8 11004014 */  bnez       $v0, .L8001D710
/* 5ECC 8001D6CC 1000A527 */   addiu     $a1, $sp, 0x10
/* 5ED0 8001D6D0 0480043C */  lui        $a0, %hi(D_80047DAC)
/* 5ED4 8001D6D4 AC7D8424 */  addiu      $a0, $a0, %lo(D_80047DAC)
/* 5ED8 8001D6D8 1075000C */  jal        func_8001D440
/* 5EDC 8001D6DC 00000000 */   nop
/* 5EE0 8001D6E0 21184000 */  addu       $v1, $v0, $zero
/* 5EE4 8001D6E4 01000234 */  ori        $v0, $zero, 0x1
/* 5EE8 8001D6E8 11006214 */  bne        $v1, $v0, .L8001D730
/* 5EEC 8001D6EC 21100000 */   addu      $v0, $zero, $zero
/* 5EF0 8001D6F0 0480013C */  lui        $at, %hi(D_80047EE4)
/* 5EF4 8001D6F4 E47E23AC */  sw         $v1, %lo(D_80047EE4)($at)
/* 5EF8 8001D6F8 9F75000C */  jal        func_8001D67C
/* 5EFC 8001D6FC AE00A427 */   addiu     $a0, $sp, 0xAE
/* 5F00 8001D700 0480053C */  lui        $a1, %hi(D_80047E84)
/* 5F04 8001D704 847EA524 */  addiu      $a1, $a1, %lo(D_80047E84)
/* 5F08 8001D708 85A2000C */  jal        func_80028A14
/* 5F0C 8001D70C 21204000 */   addu      $a0, $v0, $zero
.L8001D710:
/* 5F10 8001D710 0480053C */  lui        $a1, %hi(D_80047E84)
/* 5F14 8001D714 847EA524 */  addiu      $a1, $a1, %lo(D_80047E84)
/* 5F18 8001D718 0300A288 */  lwl        $v0, 0x3($a1)
/* 5F1C 8001D71C 0000A298 */  lwr        $v0, 0x0($a1)
/* 5F20 8001D720 00000000 */  nop
/* 5F24 8001D724 030002AA */  swl        $v0, 0x3($s0)
/* 5F28 8001D728 000002BA */  swr        $v0, 0x0($s0)
/* 5F2C 8001D72C 01000234 */  ori        $v0, $zero, 0x1
.L8001D730:
/* 5F30 8001D730 1408BF8F */  lw         $ra, 0x814($sp)
/* 5F34 8001D734 1008B08F */  lw         $s0, 0x810($sp)
/* 5F38 8001D738 0800E003 */  jr         $ra
/* 5F3C 8001D73C 1808BD27 */   addiu     $sp, $sp, 0x818
