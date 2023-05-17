.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022854
/* B054 80022854 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B058 80022858 1000BFAF */  sw         $ra, 0x10($sp)
/* B05C 8002285C C994000C */  jal        func_80025324
/* B060 80022860 00000000 */   nop
/* B064 80022864 1000BF8F */  lw         $ra, 0x10($sp)
/* B068 80022868 00000000 */  nop
/* B06C 8002286C 0800E003 */  jr         $ra
/* B070 80022870 1800BD27 */   addiu     $sp, $sp, 0x18
