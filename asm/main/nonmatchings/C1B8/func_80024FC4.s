.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024FC4
/* D7C4 80024FC4 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D7C8 80024FC8 E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D7CC 80024FCC 0800E003 */  jr         $ra
/* D7D0 80024FD0 00000000 */   nop
