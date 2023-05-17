.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020610
/* 8E10 80020610 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8E14 80020614 1000BFAF */  sw         $ra, 0x10($sp)
/* 8E18 80020618 F28E000C */  jal        func_80023BC8
/* 8E1C 8002061C 00000000 */   nop
/* 8E20 80020620 1000BF8F */  lw         $ra, 0x10($sp)
/* 8E24 80020624 00000000 */  nop
/* 8E28 80020628 0800E003 */  jr         $ra
/* 8E2C 8002062C 1800BD27 */   addiu     $sp, $sp, 0x18
