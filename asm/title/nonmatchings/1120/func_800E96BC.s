.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E96BC
/* 9EBC 800E96BC 00404848 */  cfc2       $t0, $8 # handwritten instruction
/* 9EC0 800E96C0 00484948 */  cfc2       $t1, $9 # handwritten instruction
/* 9EC4 800E96C4 00504A48 */  cfc2       $t2, $10 # handwritten instruction
/* 9EC8 800E96C8 00584B48 */  cfc2       $t3, $11 # handwritten instruction
/* 9ECC 800E96CC 00604C48 */  cfc2       $t4, $12 # handwritten instruction
/* 9ED0 800E96D0 000088AC */  sw         $t0, 0x0($a0)
/* 9ED4 800E96D4 040089AC */  sw         $t1, 0x4($a0)
/* 9ED8 800E96D8 08008AAC */  sw         $t2, 0x8($a0)
/* 9EDC 800E96DC 0C008BAC */  sw         $t3, 0xC($a0)
/* 9EE0 800E96E0 10008CAC */  sw         $t4, 0x10($a0)
/* 9EE4 800E96E4 00684848 */  cfc2       $t0, $13 # handwritten instruction
/* 9EE8 800E96E8 00704948 */  cfc2       $t1, $14 # handwritten instruction
/* 9EEC 800E96EC 00784A48 */  cfc2       $t2, $15 # handwritten instruction
/* 9EF0 800E96F0 140088AC */  sw         $t0, 0x14($a0)
/* 9EF4 800E96F4 180089AC */  sw         $t1, 0x18($a0)
/* 9EF8 800E96F8 1C008AAC */  sw         $t2, 0x1C($a0)
/* 9EFC 800E96FC 0800E003 */  jr         $ra
/* 9F00 800E9700 00000000 */   nop
