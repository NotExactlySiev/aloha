.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002D6C0
/* 15EC0 8002D6C0 21308000 */  addu       $a2, $a0, $zero
/* 15EC4 8002D6C4 0300C01C */  bgtz       $a2, .L8002D6D4
/* 15EC8 8002D6C8 0040023C */   lui       $v0, (0x40001010 >> 16)
/* 15ECC 8002D6CC CAB50008 */  j          .L8002D728
/* 15ED0 8002D6D0 21100000 */   addu      $v0, $zero, $zero
.L8002D6D4:
/* 15ED4 8002D6D4 0480033C */  lui        $v1, %hi(D_800478D0)
/* 15ED8 8002D6D8 D078638C */  lw         $v1, %lo(D_800478D0)($v1)
/* 15EDC 8002D6DC 10104234 */  ori        $v0, $v0, (0x40001010 & 0xFFFF)
/* 15EE0 8002D6E0 0000A2AC */  sw         $v0, 0x0($a1)
/* 15EE4 8002D6E4 2110C000 */  addu       $v0, $a2, $zero
/* 15EE8 8002D6E8 0580013C */  lui        $at, %hi(D_800546D8)
/* 15EEC 8002D6EC D84625AC */  sw         $a1, %lo(D_800546D8)($at)
/* 15EF0 8002D6F0 0480013C */  lui        $at, %hi(D_800478D8)
/* 15EF4 8002D6F4 D87820AC */  sw         $zero, %lo(D_800478D8)($at)
/* 15EF8 8002D6F8 0480013C */  lui        $at, %hi(D_800478D4)
/* 15EFC 8002D6FC D47822AC */  sw         $v0, %lo(D_800478D4)($at)
/* 15F00 8002D700 AC016494 */  lhu        $a0, 0x1AC($v1)
/* 15F04 8002D704 0100033C */  lui        $v1, (0x10000 >> 16)
/* 15F08 8002D708 0E008430 */  andi       $a0, $a0, 0xE
/* 15F0C 8002D70C 42200400 */  srl        $a0, $a0, 1
/* 15F10 8002D710 01008424 */  addiu      $a0, $a0, 0x1
/* 15F14 8002D714 04188300 */  sllv       $v1, $v1, $a0
/* 15F18 8002D718 F0EF6324 */  addiu      $v1, $v1, -0x1010
/* 15F1C 8002D71C 0580013C */  lui        $at, %hi(D_800546D4)
/* 15F20 8002D720 D44624AC */  sw         $a0, %lo(D_800546D4)($at)
/* 15F24 8002D724 0400A3AC */  sw         $v1, 0x4($a1)
.L8002D728:
/* 15F28 8002D728 0800E003 */  jr         $ra
/* 15F2C 8002D72C 00000000 */   nop
