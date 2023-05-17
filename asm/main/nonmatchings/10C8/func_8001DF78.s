.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DF78
/* 6778 8001DF78 21108000 */  addu       $v0, $a0, $zero
/* 677C 8001DF7C 0480013C */  lui        $at, %hi(D_80047E08)
/* 6780 8001DF80 087E22AC */  sw         $v0, %lo(D_80047E08)($at)
/* 6784 8001DF84 0800E003 */  jr         $ra
/* 6788 8001DF88 00000000 */   nop
