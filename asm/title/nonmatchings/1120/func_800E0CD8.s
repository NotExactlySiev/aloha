.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0CD8
/* 14D8 800E0CD8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 14DC 800E0CDC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 14E0 800E0CE0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14E4 800E0CE4 1000BFAF */  sw         $ra, 0x10($sp)
/* 14E8 800E0CE8 2400428C */  lw         $v0, 0x24($v0)
/* 14EC 800E0CEC 00000000 */  nop
/* 14F0 800E0CF0 09F84000 */  jalr       $v0
/* 14F4 800E0CF4 00000000 */   nop
/* 14F8 800E0CF8 0E004010 */  beqz       $v0, .L800E0D34
/* 14FC 800E0CFC 00000000 */   nop
/* 1500 800E0D00 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1504 800E0D04 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1508 800E0D08 00000000 */  nop
/* 150C 800E0D0C 2800428C */  lw         $v0, 0x28($v0)
/* 1510 800E0D10 00000000 */  nop
/* 1514 800E0D14 09F84000 */  jalr       $v0
/* 1518 800E0D18 21200000 */   addu      $a0, $zero, $zero
/* 151C 800E0D1C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1520 800E0D20 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1524 800E0D24 00000000 */  nop
/* 1528 800E0D28 EA0040A0 */  sb         $zero, 0xEA($v0)
/* 152C 800E0D2C 58830308 */  j          .L800E0D60
/* 1530 800E0D30 00000000 */   nop
.L800E0D34:
/* 1534 800E0D34 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1538 800E0D38 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 153C 800E0D3C 00000000 */  nop
/* 1540 800E0D40 2800428C */  lw         $v0, 0x28($v0)
/* 1544 800E0D44 00000000 */  nop
/* 1548 800E0D48 09F84000 */  jalr       $v0
/* 154C 800E0D4C 01000434 */   ori       $a0, $zero, 0x1
/* 1550 800E0D50 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1554 800E0D54 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1558 800E0D58 01000234 */  ori        $v0, $zero, 0x1
/* 155C 800E0D5C EA0062A0 */  sb         $v0, 0xEA($v1)
.L800E0D60:
/* 1560 800E0D60 D582030C */  jal        func_800E0B54
/* 1564 800E0D64 00260434 */   ori       $a0, $zero, 0x2600
/* 1568 800E0D68 1000BF8F */  lw         $ra, 0x10($sp)
/* 156C 800E0D6C 00000000 */  nop
/* 1570 800E0D70 0800E003 */  jr         $ra
/* 1574 800E0D74 1800BD27 */   addiu     $sp, $sp, 0x18
