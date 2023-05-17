.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E04C
/* 684C 8001E04C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6850 8001E050 1000BFAF */  sw         $ra, 0x10($sp)
/* 6854 8001E054 54C5000C */  jal        func_80031550
/* 6858 8001E058 00000000 */   nop
/* 685C 8001E05C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6860 8001E060 00000000 */  nop
/* 6864 8001E064 0800E003 */  jr         $ra
/* 6868 8001E068 1800BD27 */   addiu     $sp, $sp, 0x18
