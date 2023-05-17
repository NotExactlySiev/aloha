.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E97BC
/* 9FBC 800E97BC 00488448 */  mtc2       $a0, $9 # handwritten instruction
/* 9FC0 800E97C0 00508548 */  mtc2       $a1, $10 # handwritten instruction
/* 9FC4 800E97C4 00588648 */  mtc2       $a2, $11 # handwritten instruction
/* 9FC8 800E97C8 0800E003 */  jr         $ra
/* 9FCC 800E97CC 00000000 */   nop
