.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CE28
/* 5628 8001CE28 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 562C 8001CE2C 1000BFAF */  sw         $ra, 0x10($sp)
/* 5630 8001CE30 BD70000C */  jal        func_8001C2F4
/* 5634 8001CE34 00000000 */   nop
/* 5638 8001CE38 F6000434 */  ori        $a0, $zero, 0xF6
/* 563C 8001CE3C 01000534 */  ori        $a1, $zero, 0x1
/* 5640 8001CE40 086C000C */  jal        func_8001B020
/* 5644 8001CE44 21300000 */   addu      $a2, $zero, $zero
/* 5648 8001CE48 1000BF8F */  lw         $ra, 0x10($sp)
/* 564C 8001CE4C 00000000 */  nop
/* 5650 8001CE50 0800E003 */  jr         $ra
/* 5654 8001CE54 1800BD27 */   addiu     $sp, $sp, 0x18
