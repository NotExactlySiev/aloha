.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022AE0
/* B2E0 80022AE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B2E4 80022AE4 1000BFAF */  sw         $ra, 0x10($sp)
/* B2E8 80022AE8 2A94000C */  jal        func_800250A8
/* B2EC 80022AEC 00000000 */   nop
/* B2F0 80022AF0 1000BF8F */  lw         $ra, 0x10($sp)
/* B2F4 80022AF4 00000000 */  nop
/* B2F8 80022AF8 0800E003 */  jr         $ra
/* B2FC 80022AFC 1800BD27 */   addiu     $sp, $sp, 0x18
