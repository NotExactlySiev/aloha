.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E98D8
/* A0D8 800E98D8 00400248 */  mfc2       $v0, $8 # handwritten instruction
/* A0DC 800E98DC 0800E003 */  jr         $ra
/* A0E0 800E98E0 00000000 */   nop
