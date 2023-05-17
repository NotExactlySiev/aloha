.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022AC0
/* B2C0 80022AC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2C4 80022AC4 1000BFAF */  sw         $ra, 0x10($sp)
/* B2C8 80022AC8 8A95000C */  jal        func_80025628
/* B2CC 80022ACC 00000000 */   nop
/* B2D0 80022AD0 1000BF8F */  lw         $ra, 0x10($sp)
/* B2D4 80022AD4 00000000 */  nop
/* B2D8 80022AD8 0800E003 */  jr         $ra
/* B2DC 80022ADC 1800BD27 */   addiu     $sp, $sp, 0x18
