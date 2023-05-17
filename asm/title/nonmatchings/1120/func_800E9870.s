.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9870
/* A070 800E9870 00C88448 */  mtc2       $a0, $25 # handwritten instruction
/* A074 800E9874 00D08548 */  mtc2       $a1, $26 # handwritten instruction
/* A078 800E9878 00D88648 */  mtc2       $a2, $27 # handwritten instruction
/* A07C 800E987C 0800E003 */  jr         $ra
/* A080 800E9880 00000000 */   nop
