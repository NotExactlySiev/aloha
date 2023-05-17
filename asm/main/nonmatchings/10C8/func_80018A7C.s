.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80018A7C
/* 127C 80018A7C 0480023C */  lui        $v0, %hi(D_80047D4C)
/* 1280 80018A80 4C7D428C */  lw         $v0, %lo(D_80047D4C)($v0)
/* 1284 80018A84 0800E003 */  jr         $ra
/* 1288 80018A88 00000000 */   nop
