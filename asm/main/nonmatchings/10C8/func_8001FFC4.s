.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FFC4
/* 87C4 8001FFC4 0480013C */  lui        $at, %hi(D_80047E1C)
/* 87C8 8001FFC8 1C7E24AC */  sw         $a0, %lo(D_80047E1C)($at)
/* 87CC 8001FFCC 0800E003 */  jr         $ra
/* 87D0 8001FFD0 00000000 */   nop
