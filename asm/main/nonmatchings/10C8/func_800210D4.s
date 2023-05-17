.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800210D4
/* 98D4 800210D4 0480013C */  lui        $at, %hi(D_80047E4C)
/* 98D8 800210D8 4C7E24AC */  sw         $a0, %lo(D_80047E4C)($at)
/* 98DC 800210DC 0800E003 */  jr         $ra
/* 98E0 800210E0 00000000 */   nop
