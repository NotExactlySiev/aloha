.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80018A6C
/* 126C 80018A6C 0480023C */  lui        $v0, %hi(D_80047D50)
/* 1270 80018A70 507D428C */  lw         $v0, %lo(D_80047D50)($v0)
/* 1274 80018A74 0800E003 */  jr         $ra
/* 1278 80018A78 00000000 */   nop
