.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0FD0
/* 17D0 800E0FD0 FFFF8224 */  addiu      $v0, $a0, -0x1
/* 17D4 800E0FD4 2200422C */  sltiu      $v0, $v0, 0x22
/* 17D8 800E0FD8 02004010 */  beqz       $v0, .L800E0FE4
/* 17DC 800E0FDC 00000000 */   nop
/* 17E0 800E0FE0 01008424 */  addiu      $a0, $a0, 0x1
.L800E0FE4:
/* 17E4 800E0FE4 14008010 */  beqz       $a0, .L800E1038
/* 17E8 800E0FE8 00000000 */   nop
/* 17EC 800E0FEC 24000234 */  ori        $v0, $zero, 0x24
/* 17F0 800E0FF0 0F008210 */  beq        $a0, $v0, .L800E1030
/* 17F4 800E0FF4 02008224 */   addiu     $v0, $a0, 0x2
/* 17F8 800E0FF8 03000334 */  ori        $v1, $zero, 0x3
/* 17FC 800E0FFC 1A004300 */  div        $zero, $v0, $v1
/* 1800 800E1000 02006014 */  bnez       $v1, .L800E100C
/* 1804 800E1004 00000000 */   nop
/* 1808 800E1008 0D000700 */  break      7
.L800E100C:
/* 180C 800E100C FFFF0124 */  addiu      $at, $zero, -0x1
/* 1810 800E1010 04006114 */  bne        $v1, $at, .L800E1024
/* 1814 800E1014 0080013C */   lui       $at, (0x80000000 >> 16)
/* 1818 800E1018 02004114 */  bne        $v0, $at, .L800E1024
/* 181C 800E101C 00000000 */   nop
/* 1820 800E1020 0D000600 */  break      6
.L800E1024:
/* 1824 800E1024 12200000 */  mflo       $a0
/* 1828 800E1028 0F840308 */  j          .L800E103C
/* 182C 800E102C 00000000 */   nop
.L800E1030:
/* 1830 800E1030 0F840308 */  j          .L800E103C
/* 1834 800E1034 0D000434 */   ori       $a0, $zero, 0xD
.L800E1038:
/* 1838 800E1038 21200000 */  addu       $a0, $zero, $zero
.L800E103C:
/* 183C 800E103C 0800E003 */  jr         $ra
/* 1840 800E1040 21108000 */   addu      $v0, $a0, $zero
