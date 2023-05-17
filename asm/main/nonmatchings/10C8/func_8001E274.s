.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E274
/* 6A74 8001E274 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A78 8001E278 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A7C 8001E27C 7DC2000C */  jal        func_800309F4
/* 6A80 8001E280 00000000 */   nop
/* 6A84 8001E284 1000BF8F */  lw         $ra, 0x10($sp)
/* 6A88 8001E288 00000000 */  nop
/* 6A8C 8001E28C 0800E003 */  jr         $ra
/* 6A90 8001E290 1800BD27 */   addiu     $sp, $sp, 0x18
