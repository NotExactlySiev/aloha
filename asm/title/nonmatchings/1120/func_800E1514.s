.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1514
/* 1D14 800E1514 21180000 */  addu       $v1, $zero, $zero
/* 1D18 800E1518 21280000 */  addu       $a1, $zero, $zero
.L800E151C:
/* 1D1C 800E151C 00008290 */  lbu        $v0, 0x0($a0)
/* 1D20 800E1520 0100A524 */  addiu      $a1, $a1, 0x1
/* 1D24 800E1524 21186200 */  addu       $v1, $v1, $v0
/* 1D28 800E1528 FC00A22C */  sltiu      $v0, $a1, 0xFC
/* 1D2C 800E152C FBFF4014 */  bnez       $v0, .L800E151C
/* 1D30 800E1530 01008424 */   addiu     $a0, $a0, 0x1
/* 1D34 800E1534 4500023C */  lui        $v0, %hi(D_454100)
/* 1D38 800E1538 21186200 */  addu       $v1, $v1, $v0
/* 1D3C 800E153C 0500023C */  lui        $v0, (0x58000 >> 16)
/* 1D40 800E1540 00804234 */  ori        $v0, $v0, (0x58000 & 0xFFFF)
/* 1D44 800E1544 21186200 */  addu       $v1, $v1, $v0
/* 1D48 800E1548 00416324 */  addiu      $v1, $v1, %lo(D_454100)
/* 1D4C 800E154C 40486324 */  addiu      $v1, $v1, 0x4840
/* 1D50 800E1550 20B1023C */  lui        $v0, (0xB120E5A8 >> 16)
/* 1D54 800E1554 A8E54234 */  ori        $v0, $v0, (0xB120E5A8 & 0xFFFF)
/* 1D58 800E1558 26186200 */  xor        $v1, $v1, $v0
/* 1D5C 800E155C 6B0D6324 */  addiu      $v1, $v1, 0xD6B
/* 1D60 800E1560 FD94023C */  lui        $v0, (0x94FD367C >> 16)
/* 1D64 800E1564 7C364234 */  ori        $v0, $v0, (0x94FD367C & 0xFFFF)
/* 1D68 800E1568 0800E003 */  jr         $ra
/* 1D6C 800E156C 26106200 */   xor       $v0, $v1, $v0
