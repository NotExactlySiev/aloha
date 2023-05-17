.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E2D4
/* 6AD4 8001E2D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6AD8 8001E2D8 1000BFAF */  sw         $ra, 0x10($sp)
/* 6ADC 8001E2DC 70C2000C */  jal        func_800309C0
/* 6AE0 8001E2E0 00000000 */   nop
/* 6AE4 8001E2E4 1000BF8F */  lw         $ra, 0x10($sp)
/* 6AE8 8001E2E8 00000000 */  nop
/* 6AEC 8001E2EC 0800E003 */  jr         $ra
/* 6AF0 8001E2F0 1800BD27 */   addiu     $sp, $sp, 0x18
