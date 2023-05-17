.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020000
/* 8800 80020000 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8804 80020004 1000BFAF */  sw         $ra, 0x10($sp)
/* 8808 80020008 7D7F000C */  jal        func_8001FDF4
/* 880C 8002000C 00000000 */   nop
/* 8810 80020010 1000BF8F */  lw         $ra, 0x10($sp)
/* 8814 80020014 00000000 */  nop
/* 8818 80020018 0800E003 */  jr         $ra
/* 881C 8002001C 1800BD27 */   addiu     $sp, $sp, 0x18
