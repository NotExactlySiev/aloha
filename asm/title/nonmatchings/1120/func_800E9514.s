.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9514
/* 9D14 800E9514 1400888C */  lw         $t0, 0x14($a0)
/* 9D18 800E9518 1800898C */  lw         $t1, 0x18($a0)
/* 9D1C 800E951C 1C008A8C */  lw         $t2, 0x1C($a0)
/* 9D20 800E9520 0028C848 */  ctc2       $t0, $5 # handwritten instruction
/* 9D24 800E9524 0030C948 */  ctc2       $t1, $6 # handwritten instruction
/* 9D28 800E9528 0038CA48 */  ctc2       $t2, $7 # handwritten instruction
/* 9D2C 800E952C 0800E003 */  jr         $ra
/* 9D30 800E9530 00000000 */   nop
