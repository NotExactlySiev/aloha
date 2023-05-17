.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E97DC
/* 9FDC 800E97DC 00210400 */  sll        $a0, $a0, 4
/* 9FE0 800E97E0 00290500 */  sll        $a1, $a1, 4
/* 9FE4 800E97E4 00310600 */  sll        $a2, $a2, 4
/* 9FE8 800E97E8 0068C448 */  ctc2       $a0, $13 # handwritten instruction
/* 9FEC 800E97EC 0070C548 */  ctc2       $a1, $14 # handwritten instruction
/* 9FF0 800E97F0 0078C648 */  ctc2       $a2, $15 # handwritten instruction
/* 9FF4 800E97F4 0800E003 */  jr         $ra
/* 9FF8 800E97F8 00000000 */   nop
