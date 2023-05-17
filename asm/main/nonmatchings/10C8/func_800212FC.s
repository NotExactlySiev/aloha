.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800212FC
/* 9AFC 800212FC 01000234 */  ori        $v0, $zero, 0x1
/* 9B00 80021300 0480013C */  lui        $at, %hi(D_80047E54)
/* 9B04 80021304 547E22AC */  sw         $v0, %lo(D_80047E54)($at)
/* 9B08 80021308 0800E003 */  jr         $ra
/* 9B0C 8002130C 00000000 */   nop
