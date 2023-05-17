.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D29C
/* 5A9C 8001D29C 0480013C */  lui        $at, %hi(D_80047ED4)
/* 5AA0 8001D2A0 D47E20AC */  sw         $zero, %lo(D_80047ED4)($at)
/* 5AA4 8001D2A4 0800E003 */  jr         $ra
/* 5AA8 8001D2A8 00000000 */   nop
