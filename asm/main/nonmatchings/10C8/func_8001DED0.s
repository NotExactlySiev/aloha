.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DED0
/* 66D0 8001DED0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 66D4 8001DED4 1000BFAF */  sw         $ra, 0x10($sp)
/* 66D8 8001DED8 C0C2000C */  jal        func_80030B00
/* 66DC 8001DEDC 00000000 */   nop
/* 66E0 8001DEE0 1000BF8F */  lw         $ra, 0x10($sp)
/* 66E4 8001DEE4 00000000 */  nop
/* 66E8 8001DEE8 0800E003 */  jr         $ra
/* 66EC 8001DEEC 1800BD27 */   addiu     $sp, $sp, 0x18
