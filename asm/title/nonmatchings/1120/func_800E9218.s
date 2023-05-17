.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E9218
/* 9A18 800E9218 0000A88C */  lw         $t0, 0x0($a1)
/* 9A1C 800E921C 0400A98C */  lw         $t1, 0x4($a1)
/* 9A20 800E9220 0800AA8C */  lw         $t2, 0x8($a1)
/* 9A24 800E9224 140088AC */  sw         $t0, 0x14($a0)
/* 9A28 800E9228 180089AC */  sw         $t1, 0x18($a0)
/* 9A2C 800E922C 1C008AAC */  sw         $t2, 0x1C($a0)
/* 9A30 800E9230 21108000 */  addu       $v0, $a0, $zero
/* 9A34 800E9234 0800E003 */  jr         $ra
/* 9A38 800E9238 00000000 */   nop
