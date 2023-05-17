.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020FC0
/* 97C0 80020FC0 0480013C */  lui        $at, %hi(D_80047E50)
/* 97C4 80020FC4 507E24AC */  sw         $a0, %lo(D_80047E50)($at)
/* 97C8 80020FC8 0800E003 */  jr         $ra
/* 97CC 80020FCC 00000000 */   nop
