.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C34C
/* 4B4C 8001C34C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4B50 8001C350 1000BFAF */  sw         $ra, 0x10($sp)
/* 4B54 8001C354 0B000434 */  ori        $a0, $zero, 0xB
/* 4B58 8001C358 21280000 */  addu       $a1, $zero, $zero
/* 4B5C 8001C35C 086C000C */  jal        func_8001B020
/* 4B60 8001C360 21300000 */   addu      $a2, $zero, $zero
/* 4B64 8001C364 1000BF8F */  lw         $ra, 0x10($sp)
/* 4B68 8001C368 00000000 */  nop
/* 4B6C 8001C36C 0800E003 */  jr         $ra
/* 4B70 8001C370 1800BD27 */   addiu     $sp, $sp, 0x18
