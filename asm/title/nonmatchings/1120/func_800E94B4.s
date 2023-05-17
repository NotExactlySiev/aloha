.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E94B4
/* 9CB4 800E94B4 0000888C */  lw         $t0, 0x0($a0)
/* 9CB8 800E94B8 0400898C */  lw         $t1, 0x4($a0)
/* 9CBC 800E94BC 08008A8C */  lw         $t2, 0x8($a0)
/* 9CC0 800E94C0 0C008B8C */  lw         $t3, 0xC($a0)
/* 9CC4 800E94C4 10008C8C */  lw         $t4, 0x10($a0)
/* 9CC8 800E94C8 0040C848 */  ctc2       $t0, $8 # handwritten instruction
/* 9CCC 800E94CC 0048C948 */  ctc2       $t1, $9 # handwritten instruction
/* 9CD0 800E94D0 0050CA48 */  ctc2       $t2, $10 # handwritten instruction
/* 9CD4 800E94D4 0058CB48 */  ctc2       $t3, $11 # handwritten instruction
/* 9CD8 800E94D8 0060CC48 */  ctc2       $t4, $12 # handwritten instruction
/* 9CDC 800E94DC 0800E003 */  jr         $ra
/* 9CE0 800E94E0 00000000 */   nop
