.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1570
/* 1D70 800E1570 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1D74 800E1574 1400BFAF */  sw         $ra, 0x14($sp)
/* 1D78 800E1578 1000B0AF */  sw         $s0, 0x10($sp)
/* 1D7C 800E157C 4585030C */  jal        func_800E1514
/* 1D80 800E1580 21808000 */   addu      $s0, $a0, $zero
/* 1D84 800E1584 FC00038E */  lw         $v1, 0xFC($s0)
/* 1D88 800E1588 00000000 */  nop
/* 1D8C 800E158C 26104300 */  xor        $v0, $v0, $v1
/* 1D90 800E1590 0100422C */  sltiu      $v0, $v0, 0x1
/* 1D94 800E1594 1400BF8F */  lw         $ra, 0x14($sp)
/* 1D98 800E1598 1000B08F */  lw         $s0, 0x10($sp)
/* 1D9C 800E159C 0800E003 */  jr         $ra
/* 1DA0 800E15A0 1800BD27 */   addiu     $sp, $sp, 0x18
