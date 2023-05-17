.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DFEC
/* 67EC 8001DFEC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 67F0 8001DFF0 1000BFAF */  sw         $ra, 0x10($sp)
/* 67F4 8001DFF4 95C4000C */  jal        func_80031254
/* 67F8 8001DFF8 00000000 */   nop
/* 67FC 8001DFFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 6800 8001E000 00000000 */  nop
/* 6804 8001E004 0800E003 */  jr         $ra
/* 6808 8001E008 1800BD27 */   addiu     $sp, $sp, 0x18
