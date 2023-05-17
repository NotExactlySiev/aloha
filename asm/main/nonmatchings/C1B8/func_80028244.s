.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028244
/* 10A44 80028244 0480023C */  lui        $v0, %hi(D_80046FA0)
/* 10A48 80028248 A06F428C */  lw         $v0, %lo(D_80046FA0)($v0)
/* 10A4C 8002824C 0480013C */  lui        $at, %hi(D_80046FA0)
/* 10A50 80028250 A06F24AC */  sw         $a0, %lo(D_80046FA0)($at)
/* 10A54 80028254 0800E003 */  jr         $ra
/* 10A58 80028258 00000000 */   nop
