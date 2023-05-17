.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022AA0
/* B2A0 80022AA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2A4 80022AA4 1000BFAF */  sw         $ra, 0x10($sp)
/* B2A8 80022AA8 E095000C */  jal        func_80025780
/* B2AC 80022AAC 00000000 */   nop
/* B2B0 80022AB0 1000BF8F */  lw         $ra, 0x10($sp)
/* B2B4 80022AB4 00000000 */  nop
/* B2B8 80022AB8 0800E003 */  jr         $ra
/* B2BC 80022ABC 1800BD27 */   addiu     $sp, $sp, 0x18
