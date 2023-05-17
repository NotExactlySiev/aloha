.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C374
/* 4B74 8001C374 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4B78 8001C378 1000BFAF */  sw         $ra, 0x10($sp)
/* 4B7C 8001C37C 0C000434 */  ori        $a0, $zero, 0xC
/* 4B80 8001C380 21280000 */  addu       $a1, $zero, $zero
/* 4B84 8001C384 086C000C */  jal        func_8001B020
/* 4B88 8001C388 21300000 */   addu      $a2, $zero, $zero
/* 4B8C 8001C38C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4B90 8001C390 00000000 */  nop
/* 4B94 8001C394 0800E003 */  jr         $ra
/* 4B98 8001C398 1800BD27 */   addiu     $sp, $sp, 0x18
