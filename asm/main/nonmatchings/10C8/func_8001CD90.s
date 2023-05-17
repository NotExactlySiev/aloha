.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CD90
/* 5590 8001CD90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5594 8001CD94 1400BFAF */  sw         $ra, 0x14($sp)
/* 5598 8001CD98 1000B0AF */  sw         $s0, 0x10($sp)
/* 559C 8001CD9C FE000434 */  ori        $a0, $zero, 0xFE
/* 55A0 8001CDA0 05000534 */  ori        $a1, $zero, 0x5
/* 55A4 8001CDA4 0480103C */  lui        $s0, %hi(D_80047F1C)
/* 55A8 8001CDA8 1C7F108E */  lw         $s0, %lo(D_80047F1C)($s0)
/* 55AC 8001CDAC 086C000C */  jal        func_8001B020
/* 55B0 8001CDB0 21300000 */   addu      $a2, $zero, $zero
/* 55B4 8001CDB4 21100002 */  addu       $v0, $s0, $zero
/* 55B8 8001CDB8 1400BF8F */  lw         $ra, 0x14($sp)
/* 55BC 8001CDBC 1000B08F */  lw         $s0, 0x10($sp)
/* 55C0 8001CDC0 0800E003 */  jr         $ra
/* 55C4 8001CDC4 1800BD27 */   addiu     $sp, $sp, 0x18
