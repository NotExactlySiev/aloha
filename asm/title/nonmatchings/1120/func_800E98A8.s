.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E98A8
/* A0A8 800E98A8 00D0C448 */  ctc2       $a0, $26 # handwritten instruction
/* A0AC 800E98AC 0800E003 */  jr         $ra
/* A0B0 800E98B0 00000000 */   nop
