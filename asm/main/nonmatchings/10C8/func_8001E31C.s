.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E31C
/* 6B1C 8001E31C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B20 8001E320 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B24 8001E324 91C2000C */  jal        func_80030A44
/* 6B28 8001E328 00000000 */   nop
/* 6B2C 8001E32C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B30 8001E330 00000000 */  nop
/* 6B34 8001E334 0800E003 */  jr         $ra
/* 6B38 8001E338 1800BD27 */   addiu     $sp, $sp, 0x18
