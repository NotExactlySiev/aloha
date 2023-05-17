.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E99B4
/* A1B4 800E99B4 00F84248 */  cfc2       $v0, $31 # handwritten instruction
/* A1B8 800E99B8 0800E003 */  jr         $ra
/* A1BC 800E99BC 00000000 */   nop
