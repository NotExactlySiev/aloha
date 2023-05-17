.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E99A8
/* A1A8 800E99A8 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* A1AC 800E99AC 0800E003 */  jr         $ra
/* A1B0 800E99B0 00000000 */   nop
