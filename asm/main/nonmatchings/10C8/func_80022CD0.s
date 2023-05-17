.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022CD0
/* B4D0 80022CD0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B4D4 80022CD4 1000BFAF */  sw         $ra, 0x10($sp)
/* B4D8 80022CD8 55B0000C */  jal        func_8002C154
/* B4DC 80022CDC 00000000 */   nop
/* B4E0 80022CE0 1000BF8F */  lw         $ra, 0x10($sp)
/* B4E4 80022CE4 00000000 */  nop
/* B4E8 80022CE8 0800E003 */  jr         $ra
/* B4EC 80022CEC 1800BD27 */   addiu     $sp, $sp, 0x18
