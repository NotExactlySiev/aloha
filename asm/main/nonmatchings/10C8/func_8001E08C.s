.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E08C
/* 688C 8001E08C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6890 8001E090 1000BFAF */  sw         $ra, 0x10($sp)
/* 6894 8001E094 DCC5000C */  jal        func_80031770
/* 6898 8001E098 00000000 */   nop
/* 689C 8001E09C 1000BF8F */  lw         $ra, 0x10($sp)
/* 68A0 8001E0A0 00000000 */  nop
/* 68A4 8001E0A4 0800E003 */  jr         $ra
/* 68A8 8001E0A8 1800BD27 */   addiu     $sp, $sp, 0x18
