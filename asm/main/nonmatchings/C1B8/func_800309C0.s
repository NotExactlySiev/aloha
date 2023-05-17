.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800309C0
/* 191C0 800309C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 191C4 800309C4 1000B0AF */  sw         $s0, 0x10($sp)
/* 191C8 800309C8 1400BFAF */  sw         $ra, 0x14($sp)
/* 191CC 800309CC 1DC4000C */  jal        func_80031074
/* 191D0 800309D0 21808000 */   addu      $s0, $a0, $zero
/* 191D4 800309D4 0000058E */  lw         $a1, 0x0($s0)
/* 191D8 800309D8 7DC2000C */  jal        func_800309F4
/* 191DC 800309DC 01000434 */   ori       $a0, $zero, 0x1
/* 191E0 800309E0 1400BF8F */  lw         $ra, 0x14($sp)
/* 191E4 800309E4 1000B08F */  lw         $s0, 0x10($sp)
/* 191E8 800309E8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 191EC 800309EC 0800E003 */  jr         $ra
/* 191F0 800309F0 00000000 */   nop
