.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CD30
/* 5530 8001CD30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 5534 8001CD34 1400BFAF */  sw         $ra, 0x14($sp)
/* 5538 8001CD38 1000B0AF */  sw         $s0, 0x10($sp)
/* 553C 8001CD3C 21288000 */  addu       $a1, $a0, $zero
/* 5540 8001CD40 F9000434 */  ori        $a0, $zero, 0xF9
/* 5544 8001CD44 0480103C */  lui        $s0, %hi(D_80047EA4)
/* 5548 8001CD48 A47E108E */  lw         $s0, %lo(D_80047EA4)($s0)
/* 554C 8001CD4C 086C000C */  jal        func_8001B020
/* 5550 8001CD50 21300000 */   addu      $a2, $zero, $zero
/* 5554 8001CD54 21100002 */  addu       $v0, $s0, $zero
/* 5558 8001CD58 1400BF8F */  lw         $ra, 0x14($sp)
/* 555C 8001CD5C 1000B08F */  lw         $s0, 0x10($sp)
/* 5560 8001CD60 0800E003 */  jr         $ra
/* 5564 8001CD64 1800BD27 */   addiu     $sp, $sp, 0x18
