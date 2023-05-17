.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9958
/* A158 800E9958 00C00248 */  mfc2       $v0, $24 # handwritten instruction
/* A15C 800E995C 0800E003 */  jr         $ra
/* A160 800E9960 00000000 */   nop
