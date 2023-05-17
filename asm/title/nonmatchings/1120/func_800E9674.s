.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9674
/* 9E74 800E9674 00004848 */  cfc2       $t0, $0 # handwritten instruction
/* 9E78 800E9678 00084948 */  cfc2       $t1, $1 # handwritten instruction
/* 9E7C 800E967C 00104A48 */  cfc2       $t2, $2 # handwritten instruction
/* 9E80 800E9680 00184B48 */  cfc2       $t3, $3 # handwritten instruction
/* 9E84 800E9684 00204C48 */  cfc2       $t4, $4 # handwritten instruction
/* 9E88 800E9688 000088AC */  sw         $t0, 0x0($a0)
/* 9E8C 800E968C 040089AC */  sw         $t1, 0x4($a0)
/* 9E90 800E9690 08008AAC */  sw         $t2, 0x8($a0)
/* 9E94 800E9694 0C008BAC */  sw         $t3, 0xC($a0)
/* 9E98 800E9698 10008CAC */  sw         $t4, 0x10($a0)
/* 9E9C 800E969C 00284848 */  cfc2       $t0, $5 # handwritten instruction
/* 9EA0 800E96A0 00304948 */  cfc2       $t1, $6 # handwritten instruction
/* 9EA4 800E96A4 00384A48 */  cfc2       $t2, $7 # handwritten instruction
/* 9EA8 800E96A8 140088AC */  sw         $t0, 0x14($a0)
/* 9EAC 800E96AC 180089AC */  sw         $t1, 0x18($a0)
/* 9EB0 800E96B0 1C008AAC */  sw         $t2, 0x1C($a0)
/* 9EB4 800E96B4 0800E003 */  jr         $ra
/* 9EB8 800E96B8 00000000 */   nop
