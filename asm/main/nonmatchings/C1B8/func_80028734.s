.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028734
/* 10F34 80028734 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10F38 80028738 1000BFAF */  sw         $ra, 0x10($sp)
/* 10F3C 8002873C 49A8000C */  jal        func_8002A124
/* 10F40 80028740 00000000 */   nop
/* 10F44 80028744 1000BF8F */  lw         $ra, 0x10($sp)
/* 10F48 80028748 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10F4C 8002874C 0800E003 */  jr         $ra
/* 10F50 80028750 00000000 */   nop
