.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020208
/* 8A08 80020208 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8A0C 8002020C 1000BFAF */  sw         $ra, 0x10($sp)
/* 8A10 80020210 7A8E000C */  jal        func_800239E8
/* 8A14 80020214 00000000 */   nop
/* 8A18 80020218 1000BF8F */  lw         $ra, 0x10($sp)
/* 8A1C 8002021C 00000000 */  nop
/* 8A20 80020220 0800E003 */  jr         $ra
/* 8A24 80020224 1800BD27 */   addiu     $sp, $sp, 0x18
