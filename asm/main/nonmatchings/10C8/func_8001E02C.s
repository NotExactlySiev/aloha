.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E02C
/* 682C 8001E02C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6830 8001E030 1000BFAF */  sw         $ra, 0x10($sp)
/* 6834 8001E034 6DC5000C */  jal        func_800315B4
/* 6838 8001E038 00000000 */   nop
/* 683C 8001E03C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6840 8001E040 00000000 */  nop
/* 6844 8001E044 0800E003 */  jr         $ra
/* 6848 8001E048 1800BD27 */   addiu     $sp, $sp, 0x18
