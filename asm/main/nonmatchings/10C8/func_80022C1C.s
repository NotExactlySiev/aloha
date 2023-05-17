.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022C1C
/* B41C 80022C1C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B420 80022C20 1000BFAF */  sw         $ra, 0x10($sp)
/* B424 80022C24 0C94000C */  jal        func_80025030
/* B428 80022C28 00000000 */   nop
/* B42C 80022C2C 1000BF8F */  lw         $ra, 0x10($sp)
/* B430 80022C30 00000000 */  nop
/* B434 80022C34 0800E003 */  jr         $ra
/* B438 80022C38 1800BD27 */   addiu     $sp, $sp, 0x18
