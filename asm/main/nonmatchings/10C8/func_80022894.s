.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022894
/* B094 80022894 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B098 80022898 1000BFAF */  sw         $ra, 0x10($sp)
/* B09C 8002289C F296000C */  jal        func_80025BC8
/* B0A0 800228A0 00000000 */   nop
/* B0A4 800228A4 1000BF8F */  lw         $ra, 0x10($sp)
/* B0A8 800228A8 00000000 */  nop
/* B0AC 800228AC 0800E003 */  jr         $ra
/* B0B0 800228B0 1800BD27 */   addiu     $sp, $sp, 0x18
