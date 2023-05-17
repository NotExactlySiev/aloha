.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021310
/* 9B10 80021310 0480013C */  lui        $at, %hi(D_80047E54)
/* 9B14 80021314 547E20AC */  sw         $zero, %lo(D_80047E54)($at)
/* 9B18 80021318 0800E003 */  jr         $ra
/* 9B1C 8002131C 00000000 */   nop
