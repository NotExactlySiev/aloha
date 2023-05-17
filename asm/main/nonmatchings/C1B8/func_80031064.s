.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031064
/* 19864 80031064 B0000A24 */  addiu      $t2, $zero, 0xB0
/* 19868 80031068 08004001 */  jr         $t2
/* 1986C 8003106C 0A000924 */   addiu     $t1, $zero, 0xA
/* 19870 80031070 00000000 */  nop
