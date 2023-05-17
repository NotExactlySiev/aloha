.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E98C0
/* A0C0 800E98C0 00E0C448 */  ctc2       $a0, $28 # handwritten instruction
/* A0C4 800E98C4 0800E003 */  jr         $ra
/* A0C8 800E98C8 00000000 */   nop
