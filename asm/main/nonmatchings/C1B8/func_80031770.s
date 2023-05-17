.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031770
/* 19F70 80031770 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19F74 80031774 1000BFAF */  sw         $ra, 0x10($sp)
/* 19F78 80031778 21308000 */  addu       $a2, $a0, $zero
/* 19F7C 8003177C 21200000 */  addu       $a0, $zero, $zero
/* 19F80 80031780 FAC5000C */  jal        func_800317E8
/* 19F84 80031784 17000534 */   ori       $a1, $zero, 0x17
/* 19F88 80031788 1000BF8F */  lw         $ra, 0x10($sp)
/* 19F8C 8003178C 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19F90 80031790 0800E003 */  jr         $ra
/* 19F94 80031794 00000000 */   nop
