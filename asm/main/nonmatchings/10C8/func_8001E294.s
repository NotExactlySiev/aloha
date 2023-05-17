.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E294
/* 6A94 8001E294 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A98 8001E298 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A9C 8001E29C E8C4000C */  jal        func_800313A0
/* 6AA0 8001E2A0 00000000 */   nop
/* 6AA4 8001E2A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 6AA8 8001E2A8 00000000 */  nop
/* 6AAC 8001E2AC 0800E003 */  jr         $ra
/* 6AB0 8001E2B0 1800BD27 */   addiu     $sp, $sp, 0x18
