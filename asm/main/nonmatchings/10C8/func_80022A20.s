.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022A20
/* B220 80022A20 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B224 80022A24 1000BFAF */  sw         $ra, 0x10($sp)
/* B228 80022A28 B094000C */  jal        func_800252C0
/* B22C 80022A2C 00000000 */   nop
/* B230 80022A30 1000BF8F */  lw         $ra, 0x10($sp)
/* B234 80022A34 00000000 */  nop
/* B238 80022A38 0800E003 */  jr         $ra
/* B23C 80022A3C 1800BD27 */   addiu     $sp, $sp, 0x18
