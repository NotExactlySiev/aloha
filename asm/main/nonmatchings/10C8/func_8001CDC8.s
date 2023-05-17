.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CDC8
/* 55C8 8001CDC8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 55CC 8001CDCC 1000BFAF */  sw         $ra, 0x10($sp)
/* 55D0 8001CDD0 21288000 */  addu       $a1, $a0, $zero
/* 55D4 8001CDD4 FE000434 */  ori        $a0, $zero, 0xFE
/* 55D8 8001CDD8 086C000C */  jal        func_8001B020
/* 55DC 8001CDDC 21300000 */   addu      $a2, $zero, $zero
/* 55E0 8001CDE0 1000BF8F */  lw         $ra, 0x10($sp)
/* 55E4 8001CDE4 00000000 */  nop
/* 55E8 8001CDE8 0800E003 */  jr         $ra
/* 55EC 8001CDEC 1800BD27 */   addiu     $sp, $sp, 0x18
