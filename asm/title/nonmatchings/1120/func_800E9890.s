.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9890
/* A090 800E9890 00240400 */  sll        $a0, $a0, 16
/* A094 800E9894 002C0500 */  sll        $a1, $a1, 16
/* A098 800E9898 00C0C448 */  ctc2       $a0, $24 # handwritten instruction
/* A09C 800E989C 00C8C548 */  ctc2       $a1, $25 # handwritten instruction
/* A0A0 800E98A0 0800E003 */  jr         $ra
/* A0A4 800E98A4 00000000 */   nop
