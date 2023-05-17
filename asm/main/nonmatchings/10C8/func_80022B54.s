.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022B54
/* B354 80022B54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B358 80022B58 1000BFAF */  sw         $ra, 0x10($sp)
/* B35C 80022B5C E98A000C */  jal        func_80022BA4
/* B360 80022B60 00000000 */   nop
/* B364 80022B64 1000BF8F */  lw         $ra, 0x10($sp)
/* B368 80022B68 00000000 */  nop
/* B36C 80022B6C 0800E003 */  jr         $ra
/* B370 80022B70 1800BD27 */   addiu     $sp, $sp, 0x18
