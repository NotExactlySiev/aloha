.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024FB4
/* D7B4 80024FB4 0480023C */  lui        $v0, %hi(D_80046EE4)
/* D7B8 80024FB8 E46E428C */  lw         $v0, %lo(D_80046EE4)($v0)
/* D7BC 80024FBC 0800E003 */  jr         $ra
/* D7C0 80024FC0 00000000 */   nop
