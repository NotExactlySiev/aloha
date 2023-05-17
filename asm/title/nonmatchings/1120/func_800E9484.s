.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9484
/* 9C84 800E9484 0000888C */  lw         $t0, 0x0($a0)
/* 9C88 800E9488 0400898C */  lw         $t1, 0x4($a0)
/* 9C8C 800E948C 08008A8C */  lw         $t2, 0x8($a0)
/* 9C90 800E9490 0C008B8C */  lw         $t3, 0xC($a0)
/* 9C94 800E9494 10008C8C */  lw         $t4, 0x10($a0)
/* 9C98 800E9498 0000C848 */  ctc2       $t0, $0 # handwritten instruction
/* 9C9C 800E949C 0008C948 */  ctc2       $t1, $1 # handwritten instruction
/* 9CA0 800E94A0 0010CA48 */  ctc2       $t2, $2 # handwritten instruction
/* 9CA4 800E94A4 0018CB48 */  ctc2       $t3, $3 # handwritten instruction
/* 9CA8 800E94A8 0020CC48 */  ctc2       $t4, $4 # handwritten instruction
/* 9CAC 800E94AC 0800E003 */  jr         $ra
/* 9CB0 800E94B0 00000000 */   nop
