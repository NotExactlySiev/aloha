.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C780
/* 4F80 8001C780 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4F84 8001C784 1000BFAF */  sw         $ra, 0x10($sp)
/* 4F88 8001C788 21108000 */  addu       $v0, $a0, $zero
/* 4F8C 8001C78C 2118A000 */  addu       $v1, $a1, $zero
/* 4F90 8001C790 2138C000 */  addu       $a3, $a2, $zero
/* 4F94 8001C794 21200000 */  addu       $a0, $zero, $zero
/* 4F98 8001C798 21284000 */  addu       $a1, $v0, $zero
/* 4F9C 8001C79C FA71000C */  jal        func_8001C7E8
/* 4FA0 8001C7A0 21306000 */   addu      $a2, $v1, $zero
/* 4FA4 8001C7A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 4FA8 8001C7A8 00000000 */  nop
/* 4FAC 8001C7AC 0800E003 */  jr         $ra
/* 4FB0 8001C7B0 1800BD27 */   addiu     $sp, $sp, 0x18
