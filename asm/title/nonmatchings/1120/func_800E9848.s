.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9848
/* A048 800E9848 00608448 */  mtc2       $a0, $12 # handwritten instruction
/* A04C 800E984C 00688548 */  mtc2       $a1, $13 # handwritten instruction
/* A050 800E9850 00708648 */  mtc2       $a2, $14 # handwritten instruction
/* A054 800E9854 0800E003 */  jr         $ra
/* A058 800E9858 00000000 */   nop
