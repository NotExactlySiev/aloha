.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019CA4
/* 24A4 80019CA4 0480023C */  lui        $v0, %hi(D_80047E6C)
/* 24A8 80019CA8 6C7E428C */  lw         $v0, %lo(D_80047E6C)($v0)
/* 24AC 80019CAC 0800E003 */  jr         $ra
/* 24B0 80019CB0 00000000 */   nop
