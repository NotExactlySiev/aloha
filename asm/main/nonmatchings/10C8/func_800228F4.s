.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800228F4
/* B0F4 800228F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0F8 800228F8 1000BFAF */  sw         $ra, 0x10($sp)
/* B0FC 800228FC 4897000C */  jal        func_80025D20
/* B100 80022900 00000000 */   nop
/* B104 80022904 1000BF8F */  lw         $ra, 0x10($sp)
/* B108 80022908 00000000 */  nop
/* B10C 8002290C 0800E003 */  jr         $ra
/* B110 80022910 1800BD27 */   addiu     $sp, $sp, 0x18
