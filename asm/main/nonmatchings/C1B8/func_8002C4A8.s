.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C4A8
/* 14CA8 8002C4A8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14CAC 8002C4AC 1000BFAF */  sw         $ra, 0x10($sp)
/* 14CB0 8002C4B0 21280000 */  addu       $a1, $zero, $zero
/* 14CB4 8002C4B4 17000634 */  ori        $a2, $zero, 0x17
/* 14CB8 8002C4B8 34B1000C */  jal        func_8002C4D0
/* 14CBC 8002C4BC 21380000 */   addu      $a3, $zero, $zero
/* 14CC0 8002C4C0 1000BF8F */  lw         $ra, 0x10($sp)
/* 14CC4 8002C4C4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14CC8 8002C4C8 0800E003 */  jr         $ra
/* 14CCC 8002C4CC 00000000 */   nop
