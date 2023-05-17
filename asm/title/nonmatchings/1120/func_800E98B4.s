.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E98B4
/* A0B4 800E98B4 00D8C448 */  ctc2       $a0, $27 # handwritten instruction
/* A0B8 800E98B8 0800E003 */  jr         $ra
/* A0BC 800E98BC 00000000 */   nop
