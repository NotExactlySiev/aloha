.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9704
/* 9F04 800E9704 00804848 */  cfc2       $t0, $16 # handwritten instruction
/* 9F08 800E9708 00884948 */  cfc2       $t1, $17 # handwritten instruction
/* 9F0C 800E970C 00904A48 */  cfc2       $t2, $18 # handwritten instruction
/* 9F10 800E9710 00984B48 */  cfc2       $t3, $19 # handwritten instruction
/* 9F14 800E9714 00A04C48 */  cfc2       $t4, $20 # handwritten instruction
/* 9F18 800E9718 000088AC */  sw         $t0, 0x0($a0)
/* 9F1C 800E971C 040089AC */  sw         $t1, 0x4($a0)
/* 9F20 800E9720 08008AAC */  sw         $t2, 0x8($a0)
/* 9F24 800E9724 0C008BAC */  sw         $t3, 0xC($a0)
/* 9F28 800E9728 10008CAC */  sw         $t4, 0x10($a0)
/* 9F2C 800E972C 00A84848 */  cfc2       $t0, $21 # handwritten instruction
/* 9F30 800E9730 00B04948 */  cfc2       $t1, $22 # handwritten instruction
/* 9F34 800E9734 00B84A48 */  cfc2       $t2, $23 # handwritten instruction
/* 9F38 800E9738 140088AC */  sw         $t0, 0x14($a0)
/* 9F3C 800E973C 180089AC */  sw         $t1, 0x18($a0)
/* 9F40 800E9740 1C008AAC */  sw         $t2, 0x1C($a0)
/* 9F44 800E9744 0800E003 */  jr         $ra
/* 9F48 800E9748 00000000 */   nop
