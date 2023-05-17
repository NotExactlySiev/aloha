.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E2B4
/* 6AB4 8001E2B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6AB8 8001E2B8 1000BFAF */  sw         $ra, 0x10($sp)
/* 6ABC 8001E2BC 1DC4000C */  jal        func_80031074
/* 6AC0 8001E2C0 00000000 */   nop
/* 6AC4 8001E2C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 6AC8 8001E2C8 00000000 */  nop
/* 6ACC 8001E2CC 0800E003 */  jr         $ra
/* 6AD0 8001E2D0 1800BD27 */   addiu     $sp, $sp, 0x18
