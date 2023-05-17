.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FBC0
/* 83C0 8001FBC0 0480023C */  lui        $v0, %hi(D_80047E10)
/* 83C4 8001FBC4 107E428C */  lw         $v0, %lo(D_80047E10)($v0)
/* 83C8 8001FBC8 0480013C */  lui        $at, %hi(D_80047E10)
/* 83CC 8001FBCC 107E24AC */  sw         $a0, %lo(D_80047E10)($at)
/* 83D0 8001FBD0 01000334 */  ori        $v1, $zero, 0x1
/* 83D4 8001FBD4 0480013C */  lui        $at, %hi(D_80047E14)
/* 83D8 8001FBD8 147E23AC */  sw         $v1, %lo(D_80047E14)($at)
/* 83DC 8001FBDC 0800E003 */  jr         $ra
/* 83E0 8001FBE0 00000000 */   nop
