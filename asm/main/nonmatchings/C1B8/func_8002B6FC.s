.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B6FC
/* 13EFC 8002B6FC 2000822C */  sltiu      $v0, $a0, 0x20
/* 13F00 8002B700 03004014 */  bnez       $v0, .L8002B710
/* 13F04 8002B704 21100000 */   addu      $v0, $zero, $zero
/* 13F08 8002B708 C6AD0008 */  j          .L8002B718
/* 13F0C 8002B70C 01000234 */   ori       $v0, $zero, 0x1
.L8002B710:
/* 13F10 8002B710 0480013C */  lui        $at, %hi(D_8004731C)
/* 13F14 8002B714 1C7324AC */  sw         $a0, %lo(D_8004731C)($at)
.L8002B718:
/* 13F18 8002B718 0800E003 */  jr         $ra
/* 13F1C 8002B71C 00000000 */   nop
