.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E97D0
/* 9FD0 800E97D0 00408448 */  mtc2       $a0, $8 # handwritten instruction
/* 9FD4 800E97D4 0800E003 */  jr         $ra
/* 9FD8 800E97D8 00000000 */   nop
