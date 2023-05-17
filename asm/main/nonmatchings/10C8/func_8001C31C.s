.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C31C
/* 4B1C 8001C31C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4B20 8001C320 1000BFAF */  sw         $ra, 0x10($sp)
/* 4B24 8001C324 03000434 */  ori        $a0, $zero, 0x3
/* 4B28 8001C328 21280000 */  addu       $a1, $zero, $zero
/* 4B2C 8001C32C 086C000C */  jal        func_8001B020
/* 4B30 8001C330 21300000 */   addu      $a2, $zero, $zero
/* 4B34 8001C334 DD70000C */  jal        func_8001C374
/* 4B38 8001C338 00000000 */   nop
/* 4B3C 8001C33C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4B40 8001C340 00000000 */  nop
/* 4B44 8001C344 0800E003 */  jr         $ra
/* 4B48 8001C348 1800BD27 */   addiu     $sp, $sp, 0x18
