.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800228B4
/* B0B4 800228B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B0B8 800228B8 1000BFAF */  sw         $ra, 0x10($sp)
/* B0BC 800228BC C895000C */  jal        func_80025720
/* B0C0 800228C0 00000000 */   nop
/* B0C4 800228C4 1000BF8F */  lw         $ra, 0x10($sp)
/* B0C8 800228C8 00000000 */  nop
/* B0CC 800228CC 0800E003 */  jr         $ra
/* B0D0 800228D0 1800BD27 */   addiu     $sp, $sp, 0x18
