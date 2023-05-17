.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C7B4
/* 4FB4 8001C7B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4FB8 8001C7B8 1000BFAF */  sw         $ra, 0x10($sp)
/* 4FBC 8001C7BC 21108000 */  addu       $v0, $a0, $zero
/* 4FC0 8001C7C0 2118A000 */  addu       $v1, $a1, $zero
/* 4FC4 8001C7C4 2138C000 */  addu       $a3, $a2, $zero
/* 4FC8 8001C7C8 01000434 */  ori        $a0, $zero, 0x1
/* 4FCC 8001C7CC 21284000 */  addu       $a1, $v0, $zero
/* 4FD0 8001C7D0 FA71000C */  jal        func_8001C7E8
/* 4FD4 8001C7D4 21306000 */   addu      $a2, $v1, $zero
/* 4FD8 8001C7D8 1000BF8F */  lw         $ra, 0x10($sp)
/* 4FDC 8001C7DC 00000000 */  nop
/* 4FE0 8001C7E0 0800E003 */  jr         $ra
/* 4FE4 8001C7E4 1800BD27 */   addiu     $sp, $sp, 0x18
