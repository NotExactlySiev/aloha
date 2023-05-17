.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028754
/* 10F54 80028754 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10F58 80028758 1000BFAF */  sw         $ra, 0x10($sp)
/* 10F5C 8002875C 12A8000C */  jal        func_8002A048
/* 10F60 80028760 00000000 */   nop
/* 10F64 80028764 1000BF8F */  lw         $ra, 0x10($sp)
/* 10F68 80028768 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10F6C 8002876C 0800E003 */  jr         $ra
/* 10F70 80028770 00000000 */   nop
