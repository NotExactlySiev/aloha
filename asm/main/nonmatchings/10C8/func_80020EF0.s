.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020EF0
/* 96F0 80020EF0 00240400 */  sll        $a0, $a0, 16
/* 96F4 80020EF4 03240400 */  sra        $a0, $a0, 16
/* 96F8 80020EF8 002C0500 */  sll        $a1, $a1, 16
/* 96FC 80020EFC 032C0500 */  sra        $a1, $a1, 16
/* 9700 80020F00 18008500 */  mult       $a0, $a1
/* 9704 80020F04 12180000 */  mflo       $v1
/* 9708 80020F08 00000000 */  nop
/* 970C 80020F0C C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 9710 80020F10 3800BFAF */  sw         $ra, 0x38($sp)
/* 9714 80020F14 03000234 */  ori        $v0, $zero, 0x3
/* 9718 80020F18 02006104 */  bgez       $v1, .L80020F24
/* 971C 80020F1C 1000A2AF */   sw        $v0, 0x10($sp)
/* 9720 80020F20 FF036324 */  addiu      $v1, $v1, 0x3FF
.L80020F24:
/* 9724 80020F24 831A0300 */  sra        $v1, $v1, 10
/* 9728 80020F28 1400A3A7 */  sh         $v1, 0x14($sp)
/* 972C 80020F2C 1600A3A7 */  sh         $v1, 0x16($sp)
/* 9730 80020F30 B477000C */  jal        func_8001DED0
/* 9734 80020F34 1000A427 */   addiu     $a0, $sp, 0x10
/* 9738 80020F38 3800BF8F */  lw         $ra, 0x38($sp)
/* 973C 80020F3C 00000000 */  nop
/* 9740 80020F40 0800E003 */  jr         $ra
/* 9744 80020F44 4000BD27 */   addiu     $sp, $sp, 0x40
