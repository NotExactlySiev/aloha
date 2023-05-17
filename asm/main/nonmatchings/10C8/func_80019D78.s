.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019D78
/* 2578 80019D78 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 257C 80019D7C 1400BFAF */  sw         $ra, 0x14($sp)
/* 2580 80019D80 1000B0AF */  sw         $s0, 0x10($sp)
/* 2584 80019D84 728E000C */  jal        func_800239C8
/* 2588 80019D88 21808000 */   addu      $s0, $a0, $zero
/* 258C 80019D8C 00F0043C */  lui        $a0, (0xF0000010 >> 16)
/* 2590 80019D90 10008434 */  ori        $a0, $a0, (0xF0000010 & 0xFFFF)
/* 2594 80019D94 00400534 */  ori        $a1, $zero, 0x4000
/* 2598 80019D98 00100634 */  ori        $a2, $zero, 0x1000
/* 259C 80019D9C FA8E000C */  jal        func_80023BE8
/* 25A0 80019DA0 21380002 */   addu      $a3, $s0, $zero
/* 25A4 80019DA4 21804000 */  addu       $s0, $v0, $zero
/* 25A8 80019DA8 828E000C */  jal        func_80023A08
/* 25AC 80019DAC 21200002 */   addu      $a0, $s0, $zero
/* 25B0 80019DB0 068F000C */  jal        func_80023C18
/* 25B4 80019DB4 00000000 */   nop
/* 25B8 80019DB8 21100002 */  addu       $v0, $s0, $zero
/* 25BC 80019DBC 1400BF8F */  lw         $ra, 0x14($sp)
/* 25C0 80019DC0 1000B08F */  lw         $s0, 0x10($sp)
/* 25C4 80019DC4 0800E003 */  jr         $ra
/* 25C8 80019DC8 1800BD27 */   addiu     $sp, $sp, 0x18
