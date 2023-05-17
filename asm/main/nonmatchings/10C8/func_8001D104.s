.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D104
/* 5904 8001D104 0480043C */  lui        $a0, %hi(D_80047E00)
/* 5908 8001D108 007E848C */  lw         $a0, %lo(D_80047E00)($a0)
/* 590C 8001D10C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5910 8001D110 06008004 */  bltz       $a0, .L8001D12C
/* 5914 8001D114 1000BFAF */   sw        $ra, 0x10($sp)
/* 5918 8001D118 988C000C */  jal        func_80023260
/* 591C 8001D11C 00000000 */   nop
/* 5920 8001D120 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5924 8001D124 0480013C */  lui        $at, %hi(D_80047E00)
/* 5928 8001D128 007E22AC */  sw         $v0, %lo(D_80047E00)($at)
.L8001D12C:
/* 592C 8001D12C 1000BF8F */  lw         $ra, 0x10($sp)
/* 5930 8001D130 00000000 */  nop
/* 5934 8001D134 0800E003 */  jr         $ra
/* 5938 8001D138 1800BD27 */   addiu     $sp, $sp, 0x18
