.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E06C
/* 686C 8001E06C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6870 8001E070 1000BFAF */  sw         $ra, 0x10($sp)
/* 6874 8001E074 F3B2000C */  jal        func_8002CBCC
/* 6878 8001E078 00000000 */   nop
/* 687C 8001E07C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6880 8001E080 00000000 */  nop
/* 6884 8001E084 0800E003 */  jr         $ra
/* 6888 8001E088 1800BD27 */   addiu     $sp, $sp, 0x18
