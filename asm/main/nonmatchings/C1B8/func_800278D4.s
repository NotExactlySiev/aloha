.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800278D4
/* 100D4 800278D4 A0000A24 */  addiu      $t2, $zero, 0xA0
/* 100D8 800278D8 08004001 */  jr         $t2
/* 100DC 800278DC 49000924 */   addiu     $t1, $zero, 0x49
/* 100E0 800278E0 00000000 */  nop
