.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C2F4
/* 4AF4 8001C2F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4AF8 8001C2F8 1000BFAF */  sw         $ra, 0x10($sp)
/* 4AFC 8001C2FC 09000434 */  ori        $a0, $zero, 0x9
/* 4B00 8001C300 21280000 */  addu       $a1, $zero, $zero
/* 4B04 8001C304 086C000C */  jal        func_8001B020
/* 4B08 8001C308 21300000 */   addu      $a2, $zero, $zero
/* 4B0C 8001C30C 1000BF8F */  lw         $ra, 0x10($sp)
/* 4B10 8001C310 00000000 */  nop
/* 4B14 8001C314 0800E003 */  jr         $ra
/* 4B18 8001C318 1800BD27 */   addiu     $sp, $sp, 0x18
