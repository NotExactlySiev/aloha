.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E98CC
/* A0CC 800E98CC 00380248 */  mfc2       $v0, $7 # handwritten instruction
/* A0D0 800E98D0 0800E003 */  jr         $ra
/* A0D4 800E98D4 00000000 */   nop
