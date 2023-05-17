.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E985C
/* A05C 800E985C 0000C448 */  ctc2       $a0, $0 # handwritten instruction
/* A060 800E9860 0010C548 */  ctc2       $a1, $2 # handwritten instruction
/* A064 800E9864 0020C648 */  ctc2       $a2, $4 # handwritten instruction
/* A068 800E9868 0800E003 */  jr         $ra
/* A06C 800E986C 00000000 */   nop
