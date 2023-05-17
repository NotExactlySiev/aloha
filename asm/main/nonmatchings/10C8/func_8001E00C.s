.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E00C
/* 680C 8001E00C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6810 8001E010 1000BFAF */  sw         $ra, 0x10($sp)
/* 6814 8001E014 D1C4000C */  jal        func_80031344
/* 6818 8001E018 00000000 */   nop
/* 681C 8001E01C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6820 8001E020 00000000 */  nop
/* 6824 8001E024 0800E003 */  jr         $ra
/* 6828 8001E028 1800BD27 */   addiu     $sp, $sp, 0x18
