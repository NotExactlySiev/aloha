.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CDF0
/* 55F0 8001CDF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 55F4 8001CDF4 1000BFAF */  sw         $ra, 0x10($sp)
/* 55F8 8001CDF8 F8000434 */  ori        $a0, $zero, 0xF8
/* 55FC 8001CDFC 21280000 */  addu       $a1, $zero, $zero
/* 5600 8001CE00 086C000C */  jal        func_8001B020
/* 5604 8001CE04 21300000 */   addu      $a2, $zero, $zero
/* 5608 8001CE08 1000BF8F */  lw         $ra, 0x10($sp)
/* 560C 8001CE0C 00000000 */  nop
/* 5610 8001CE10 0800E003 */  jr         $ra
/* 5614 8001CE14 1800BD27 */   addiu     $sp, $sp, 0x18
