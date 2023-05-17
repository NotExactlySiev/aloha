.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A438
/* 12C38 8002A438 0480013C */  lui        $at, %hi(D_80047230)
/* 12C3C 8002A43C 307224AC */  sw         $a0, %lo(D_80047230)($at)
/* 12C40 8002A440 0800E003 */  jr         $ra
/* 12C44 8002A444 00000000 */   nop
