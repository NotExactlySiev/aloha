.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800218A0
/* A0A0 800218A0 0480013C */  lui        $at, %hi(D_80047E58)
/* A0A4 800218A4 587E24AC */  sw         $a0, %lo(D_80047E58)($at)
/* A0A8 800218A8 0800E003 */  jr         $ra
/* A0AC 800218AC 00000000 */   nop
