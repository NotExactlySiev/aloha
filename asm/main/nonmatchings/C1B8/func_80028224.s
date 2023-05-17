.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028224
/* 10A24 80028224 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10A28 80028228 1000BFAF */  sw         $ra, 0x10($sp)
/* 10A2C 8002822C 79A4000C */  jal        func_800291E4
/* 10A30 80028230 00000000 */   nop
/* 10A34 80028234 1000BF8F */  lw         $ra, 0x10($sp)
/* 10A38 80028238 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10A3C 8002823C 0800E003 */  jr         $ra
/* 10A40 80028240 00000000 */   nop
