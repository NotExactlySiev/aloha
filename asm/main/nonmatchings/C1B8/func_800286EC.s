.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800286EC
/* 10EEC 800286EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10EF0 800286F0 1000BFAF */  sw         $ra, 0x10($sp)
/* 10EF4 800286F4 97A8000C */  jal        func_8002A25C
/* 10EF8 800286F8 00000000 */   nop
/* 10EFC 800286FC 0100422C */  sltiu      $v0, $v0, 0x1
/* 10F00 80028700 1000BF8F */  lw         $ra, 0x10($sp)
/* 10F04 80028704 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10F08 80028708 0800E003 */  jr         $ra
/* 10F0C 8002870C 00000000 */   nop
