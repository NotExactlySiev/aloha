.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E94E4
/* 9CE4 800E94E4 0000888C */  lw         $t0, 0x0($a0)
/* 9CE8 800E94E8 0400898C */  lw         $t1, 0x4($a0)
/* 9CEC 800E94EC 08008A8C */  lw         $t2, 0x8($a0)
/* 9CF0 800E94F0 0C008B8C */  lw         $t3, 0xC($a0)
/* 9CF4 800E94F4 10008C8C */  lw         $t4, 0x10($a0)
/* 9CF8 800E94F8 0080C848 */  ctc2       $t0, $16 # handwritten instruction
/* 9CFC 800E94FC 0088C948 */  ctc2       $t1, $17 # handwritten instruction
/* 9D00 800E9500 0090CA48 */  ctc2       $t2, $18 # handwritten instruction
/* 9D04 800E9504 0098CB48 */  ctc2       $t3, $19 # handwritten instruction
/* 9D08 800E9508 00A0CC48 */  ctc2       $t4, $20 # handwritten instruction
/* 9D0C 800E950C 0800E003 */  jr         $ra
/* 9D10 800E9510 00000000 */   nop
