.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022CB0
/* B4B0 80022CB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B4B4 80022CB4 1000BFAF */  sw         $ra, 0x10($sp)
/* B4B8 80022CB8 4FB0000C */  jal        func_8002C13C
/* B4BC 80022CBC 00000000 */   nop
/* B4C0 80022CC0 1000BF8F */  lw         $ra, 0x10($sp)
/* B4C4 80022CC4 00000000 */  nop
/* B4C8 80022CC8 0800E003 */  jr         $ra
/* B4CC 80022CCC 1800BD27 */   addiu     $sp, $sp, 0x18
