.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022C3C
/* B43C 80022C3C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B440 80022C40 1000BFAF */  sw         $ra, 0x10($sp)
/* B444 80022C44 5695000C */  jal        func_80025558
/* B448 80022C48 00000000 */   nop
/* B44C 80022C4C 1000BF8F */  lw         $ra, 0x10($sp)
/* B450 80022C50 00000000 */  nop
/* B454 80022C54 0800E003 */  jr         $ra
/* B458 80022C58 1800BD27 */   addiu     $sp, $sp, 0x18
