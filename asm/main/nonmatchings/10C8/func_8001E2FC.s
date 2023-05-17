.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E2FC
/* 6AFC 8001E2FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B00 8001E300 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B04 8001E304 A6C2000C */  jal        func_80030A98
/* 6B08 8001E308 00000000 */   nop
/* 6B0C 8001E30C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B10 8001E310 00000000 */  nop
/* 6B14 8001E314 0800E003 */  jr         $ra
/* 6B18 8001E318 1800BD27 */   addiu     $sp, $sp, 0x18
