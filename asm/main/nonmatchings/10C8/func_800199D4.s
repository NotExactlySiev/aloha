.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800199D4
/* 21D4 800199D4 0480023C */  lui        $v0, %hi(D_80047D44)
/* 21D8 800199D8 447D428C */  lw         $v0, %lo(D_80047D44)($v0)
/* 21DC 800199DC 0800E003 */  jr         $ra
/* 21E0 800199E0 00000000 */   nop
