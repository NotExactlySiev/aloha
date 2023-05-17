.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9964
/* A164 800E9964 000099E8 */  swc2       $25, 0x0($a0)
/* A168 800E9968 0000BAE8 */  swc2       $26, 0x0($a1) # handwritten instruction
/* A16C 800E996C 0000DBE8 */  swc2       $27, 0x0($a2) # handwritten instruction
/* A170 800E9970 0800E003 */  jr         $ra
/* A174 800E9974 00000000 */   nop
