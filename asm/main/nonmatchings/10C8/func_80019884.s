.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019884
/* 2084 80019884 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2088 80019888 1000BFAF */  sw         $ra, 0x10($sp)
/* 208C 8001988C 728E000C */  jal        func_800239C8
/* 2090 80019890 00000000 */   nop
/* 2094 80019894 128F000C */  jal        func_80023C48
/* 2098 80019898 00000000 */   nop
/* 209C 8001989C 068F000C */  jal        func_80023C18
/* 20A0 800198A0 00000000 */   nop
/* 20A4 800198A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 20A8 800198A8 00000000 */  nop
/* 20AC 800198AC 0800E003 */  jr         $ra
/* 20B0 800198B0 1800BD27 */   addiu     $sp, $sp, 0x18
