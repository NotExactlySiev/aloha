.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022A80
/* B280 80022A80 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B284 80022A84 1000BFAF */  sw         $ra, 0x10($sp)
/* B288 80022A88 6E95000C */  jal        func_800255B8
/* B28C 80022A8C 00000000 */   nop
/* B290 80022A90 1000BF8F */  lw         $ra, 0x10($sp)
/* B294 80022A94 00000000 */  nop
/* B298 80022A98 0800E003 */  jr         $ra
/* B29C 80022A9C 1800BD27 */   addiu     $sp, $sp, 0x18
