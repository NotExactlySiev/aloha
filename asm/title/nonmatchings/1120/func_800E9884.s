.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9884
/* A084 800E9884 00F08448 */  mtc2       $a0, $30 # handwritten instruction
/* A088 800E9888 0800E003 */  jr         $ra
/* A08C 800E988C 00000000 */   nop
