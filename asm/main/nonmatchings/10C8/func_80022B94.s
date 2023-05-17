.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022B94
/* B394 80022B94 0280023C */  lui        $v0, %hi(D_800234B0)
/* B398 80022B98 B034428C */  lw         $v0, %lo(D_800234B0)($v0)
/* B39C 80022B9C 0800E003 */  jr         $ra
/* B3A0 80022BA0 00000000 */   nop
