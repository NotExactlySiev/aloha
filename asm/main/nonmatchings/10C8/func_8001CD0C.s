.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CD0C
/* 550C 8001CD0C 0480023C */  lui        $v0, %hi(D_80047E9F)
/* 5510 8001CD10 9F7E4288 */  lwl        $v0, %lo(D_80047E9F)($v0)
/* 5514 8001CD14 0480023C */  lui        $v0, %hi(D_80047E9C)
/* 5518 8001CD18 9C7E4298 */  lwr        $v0, %lo(D_80047E9C)($v0)
/* 551C 8001CD1C 00000000 */  nop
/* 5520 8001CD20 030082A8 */  swl        $v0, 0x3($a0)
/* 5524 8001CD24 000082B8 */  swr        $v0, 0x0($a0)
/* 5528 8001CD28 0800E003 */  jr         $ra
/* 552C 8001CD2C 00000000 */   nop
