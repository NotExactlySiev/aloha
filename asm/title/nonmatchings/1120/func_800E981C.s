.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E981C
/* A01C 800E981C 00888448 */  mtc2       $a0, $17 # handwritten instruction
/* A020 800E9820 00908548 */  mtc2       $a1, $18 # handwritten instruction
/* A024 800E9824 00988648 */  mtc2       $a2, $19 # handwritten instruction
/* A028 800E9828 0800E003 */  jr         $ra
/* A02C 800E982C 00000000 */   nop
