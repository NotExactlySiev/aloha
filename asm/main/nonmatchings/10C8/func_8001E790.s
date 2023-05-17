.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E790
/* 6F90 8001E790 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6F94 8001E794 1000BFAF */  sw         $ra, 0x10($sp)
/* 6F98 8001E798 A5C3000C */  jal        func_80030E94
/* 6F9C 8001E79C 00000000 */   nop
/* 6FA0 8001E7A0 1000BF8F */  lw         $ra, 0x10($sp)
/* 6FA4 8001E7A4 00000000 */  nop
/* 6FA8 8001E7A8 0800E003 */  jr         $ra
/* 6FAC 8001E7AC 1800BD27 */   addiu     $sp, $sp, 0x18
