.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D288
/* 5A88 8001D288 01000234 */  ori        $v0, $zero, 0x1
/* 5A8C 8001D28C 0480013C */  lui        $at, %hi(D_80047ED4)
/* 5A90 8001D290 D47E22AC */  sw         $v0, %lo(D_80047ED4)($at)
/* 5A94 8001D294 0800E003 */  jr         $ra
/* 5A98 8001D298 00000000 */   nop
