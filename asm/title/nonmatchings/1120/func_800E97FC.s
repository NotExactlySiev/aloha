.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E97FC
/* 9FFC 800E97FC 00210400 */  sll        $a0, $a0, 4
/* A000 800E9800 00290500 */  sll        $a1, $a1, 4
/* A004 800E9804 00310600 */  sll        $a2, $a2, 4
/* A008 800E9808 00A8C448 */  ctc2       $a0, $21 # handwritten instruction
/* A00C 800E980C 00B0C548 */  ctc2       $a1, $22 # handwritten instruction
/* A010 800E9810 00B8C648 */  ctc2       $a2, $23 # handwritten instruction
/* A014 800E9814 0800E003 */  jr         $ra
/* A018 800E9818 00000000 */   nop
