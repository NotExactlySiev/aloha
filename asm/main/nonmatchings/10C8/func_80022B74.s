.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022B74
/* B374 80022B74 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B378 80022B78 1000BFAF */  sw         $ra, 0x10($sp)
/* B37C 80022B7C B1B0000C */  jal        func_8002C2C4
/* B380 80022B80 00000000 */   nop
/* B384 80022B84 1000BF8F */  lw         $ra, 0x10($sp)
/* B388 80022B88 00000000 */  nop
/* B38C 80022B8C 0800E003 */  jr         $ra
/* B390 80022B90 1800BD27 */   addiu     $sp, $sp, 0x18
