.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9830
/* A030 800E9830 00808448 */  mtc2       $a0, $16 # handwritten instruction
/* A034 800E9834 00888548 */  mtc2       $a1, $17 # handwritten instruction
/* A038 800E9838 00908648 */  mtc2       $a2, $18 # handwritten instruction
/* A03C 800E983C 00988748 */  mtc2       $a3, $19 # handwritten instruction
/* A040 800E9840 0800E003 */  jr         $ra
/* A044 800E9844 00000000 */   nop
