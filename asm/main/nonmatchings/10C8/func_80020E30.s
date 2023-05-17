.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020E30
/* 9630 80020E30 0480023C */  lui        $v0, %hi(D_80047E20)
/* 9634 80020E34 207E428C */  lw         $v0, %lo(D_80047E20)($v0)
/* 9638 80020E38 0800E003 */  jr         $ra
/* 963C 80020E3C 00000000 */   nop
