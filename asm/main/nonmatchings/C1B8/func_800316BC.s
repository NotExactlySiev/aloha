.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800316BC
/* 19EBC 800316BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19EC0 800316C0 1000B0AF */  sw         $s0, 0x10($sp)
/* 19EC4 800316C4 1400BFAF */  sw         $ra, 0x14($sp)
/* 19EC8 800316C8 2AB1000C */  jal        func_8002C4A8
/* 19ECC 800316CC 21808000 */   addu      $s0, $a0, $zero
/* 19ED0 800316D0 0000058E */  lw         $a1, 0x0($s0)
/* 19ED4 800316D4 BCC5000C */  jal        func_800316F0
/* 19ED8 800316D8 01000434 */   ori       $a0, $zero, 0x1
/* 19EDC 800316DC 1400BF8F */  lw         $ra, 0x14($sp)
/* 19EE0 800316E0 1000B08F */  lw         $s0, 0x10($sp)
/* 19EE4 800316E4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19EE8 800316E8 0800E003 */  jr         $ra
/* 19EEC 800316EC 00000000 */   nop
