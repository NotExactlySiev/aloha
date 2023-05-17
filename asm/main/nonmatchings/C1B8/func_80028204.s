.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028204
/* 10A04 80028204 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10A08 80028208 1000BFAF */  sw         $ra, 0x10($sp)
/* 10A0C 8002820C F0A3000C */  jal        func_80028FC0
/* 10A10 80028210 00000000 */   nop
/* 10A14 80028214 1000BF8F */  lw         $ra, 0x10($sp)
/* 10A18 80028218 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10A1C 8002821C 0800E003 */  jr         $ra
/* 10A20 80028220 00000000 */   nop
