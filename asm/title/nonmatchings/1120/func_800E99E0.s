.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E99E0
/* A1E0 800E99E0 00D04248 */  cfc2       $v0, $26 # handwritten instruction
/* A1E4 800E99E4 0800E003 */  jr         $ra
/* A1E8 800E99E8 00000000 */   nop
glabel func_800E99EC
/* A1EC 800E99EC 00000000 */  nop
