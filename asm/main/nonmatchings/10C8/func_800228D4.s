.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800228D4
/* B0D4 800228D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0D8 800228D8 1000BFAF */  sw         $ra, 0x10($sp)
/* B0DC 800228DC 7997000C */  jal        func_80025DE4
/* B0E0 800228E0 00000000 */   nop
/* B0E4 800228E4 1000BF8F */  lw         $ra, 0x10($sp)
/* B0E8 800228E8 00000000 */  nop
/* B0EC 800228EC 0800E003 */  jr         $ra
/* B0F0 800228F0 1800BD27 */   addiu     $sp, $sp, 0x18
