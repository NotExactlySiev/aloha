.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C10C
/* 1490C 8002C10C B0000A24 */  addiu      $t2, $zero, 0xB0
/* 14910 8002C110 08004001 */  jr         $t2
/* 14914 8002C114 16000924 */   addiu     $t1, $zero, 0x16
/* 14918 8002C118 00000000 */  nop
glabel func_8002C11C
/* 1491C 8002C11C B0000A24 */  addiu      $t2, $zero, 0xB0
/* 14920 8002C120 08004001 */  jr         $t2
/* 14924 8002C124 14000924 */   addiu     $t1, $zero, 0x14
/* 14928 8002C128 00000000 */  nop
glabel func_8002C12C
/* 1492C 8002C12C B0000A24 */  addiu      $t2, $zero, 0xB0
/* 14930 8002C130 08004001 */  jr         $t2
/* 14934 8002C134 15000924 */   addiu     $t1, $zero, 0x15
/* 14938 8002C138 00000000 */  nop
