.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DF8C
/* 678C 8001DF8C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6790 8001DF90 1000BFAF */  sw         $ra, 0x10($sp)
/* 6794 8001DF94 CCB5000C */  jal        func_8002D730
/* 6798 8001DF98 00000000 */   nop
/* 679C 8001DF9C 1000BF8F */  lw         $ra, 0x10($sp)
/* 67A0 8001DFA0 00000000 */  nop
/* 67A4 8001DFA4 0800E003 */  jr         $ra
/* 67A8 8001DFA8 1800BD27 */   addiu     $sp, $sp, 0x18
