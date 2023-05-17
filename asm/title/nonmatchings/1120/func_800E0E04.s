.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0E04
/* 1604 800E0E04 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1608 800E0E08 1000BFAF */  sw         $ra, 0x10($sp)
/* 160C 800E0E0C D582030C */  jal        func_800E0B54
/* 1610 800E0E10 00260434 */   ori       $a0, $zero, 0x2600
/* 1614 800E0E14 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1618 800E0E18 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 161C 800E0E1C 0C000434 */  ori        $a0, $zero, 0xC
/* 1620 800E0E20 9C04428C */  lw         $v0, 0x49C($v0)
/* 1624 800E0E24 21280000 */  addu       $a1, $zero, $zero
/* 1628 800E0E28 09F84000 */  jalr       $v0
/* 162C 800E0E2C 21300000 */   addu      $a2, $zero, $zero
/* 1630 800E0E30 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 1634 800E0E34 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 1638 800E0E38 00000000 */  nop
/* 163C 800E0E3C 0F006004 */  bltz       $v1, .L800E0E7C
/* 1640 800E0E40 00000000 */   nop
.L800E0E44:
/* 1644 800E0E44 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 1648 800E0E48 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 164C 800E0E4C 00000000 */  nop
/* 1650 800E0E50 C0100200 */  sll        $v0, $v0, 3
/* 1654 800E0E54 23106200 */  subu       $v0, $v1, $v0
/* 1658 800E0E58 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 165C 800E0E5C F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 1660 800E0E60 5093030C */  jal        func_800E4D40
/* 1664 800E0E64 00000000 */   nop
/* 1668 800E0E68 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 166C 800E0E6C F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 1670 800E0E70 00000000 */  nop
/* 1674 800E0E74 F3FF6104 */  bgez       $v1, .L800E0E44
/* 1678 800E0E78 00000000 */   nop
.L800E0E7C:
/* 167C 800E0E7C 0F80023C */  lui        $v0, %hi(D_800F4E68)
/* 1680 800E0E80 684E428C */  lw         $v0, %lo(D_800F4E68)($v0)
/* 1684 800E0E84 00000000 */  nop
/* 1688 800E0E88 80100200 */  sll        $v0, $v0, 2
/* 168C 800E0E8C 0F80013C */  lui        $at, %hi(D_800EB168)
/* 1690 800E0E90 68B12124 */  addiu      $at, $at, %lo(D_800EB168)
/* 1694 800E0E94 21082200 */  addu       $at, $at, $v0
/* 1698 800E0E98 0000248C */  lw         $a0, 0x0($at)
/* 169C 800E0E9C 0F80013C */  lui        $at, %hi(D_800EB248)
/* 16A0 800E0EA0 48B22124 */  addiu      $at, $at, %lo(D_800EB248)
/* 16A4 800E0EA4 21082200 */  addu       $at, $at, $v0
/* 16A8 800E0EA8 0000258C */  lw         $a1, 0x0($at)
/* 16AC 800E0EAC 08000234 */  ori        $v0, $zero, 0x8
/* 16B0 800E0EB0 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 16B4 800E0EB4 F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 16B8 800E0EB8 90A1030C */  jal        func_800E8640
/* 16BC 800E0EBC 00000000 */   nop
/* 16C0 800E0EC0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 16C4 800E0EC4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 16C8 800E0EC8 00000000 */  nop
/* 16CC 800E0ECC 0406428C */  lw         $v0, 0x604($v0)
/* 16D0 800E0ED0 00000000 */  nop
/* 16D4 800E0ED4 09F84000 */  jalr       $v0
/* 16D8 800E0ED8 21200000 */   addu      $a0, $zero, $zero
/* 16DC 800E0EDC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 16E0 800E0EE0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 16E4 800E0EE4 00000000 */  nop
/* 16E8 800E0EE8 0C06428C */  lw         $v0, 0x60C($v0)
/* 16EC 800E0EEC 00000000 */  nop
/* 16F0 800E0EF0 09F84000 */  jalr       $v0
/* 16F4 800E0EF4 21200000 */   addu      $a0, $zero, $zero
/* 16F8 800E0EF8 A98F030C */  jal        func_800E3EA4
/* 16FC 800E0EFC 00000000 */   nop
/* 1700 800E0F00 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1704 800E0F04 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1708 800E0F08 00000000 */  nop
/* 170C 800E0F0C C80C428C */  lw         $v0, 0xCC8($v0)
/* 1710 800E0F10 00000000 */  nop
/* 1714 800E0F14 09F84000 */  jalr       $v0
/* 1718 800E0F18 01000434 */   ori       $a0, $zero, 0x1
/* 171C 800E0F1C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1720 800E0F20 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1724 800E0F24 00000000 */  nop
/* 1728 800E0F28 13054290 */  lbu        $v0, 0x513($v0)
/* 172C 800E0F2C 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 1730 800E0F30 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 1734 800E0F34 0F80013C */  lui        $at, %hi(D_800EB00E)
/* 1738 800E0F38 0EB02124 */  addiu      $at, $at, %lo(D_800EB00E)
/* 173C 800E0F3C 21082200 */  addu       $at, $at, $v0
/* 1740 800E0F40 00002490 */  lbu        $a0, 0x0($at)
/* 1744 800E0F44 C40C628C */  lw         $v0, 0xCC4($v1)
/* 1748 800E0F48 00000000 */  nop
/* 174C 800E0F4C 09F84000 */  jalr       $v0
/* 1750 800E0F50 00000000 */   nop
/* 1754 800E0F54 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 1758 800E0F58 F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 175C 800E0F5C 01000234 */  ori        $v0, $zero, 0x1
/* 1760 800E0F60 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 1764 800E0F64 404E22AC */  sw         $v0, %lo(D_800F4E40)($at)
/* 1768 800E0F68 0F80013C */  lui        $at, %hi(D_800F4E50)
/* 176C 800E0F6C 504E22AC */  sw         $v0, %lo(D_800F4E50)($at)
/* 1770 800E0F70 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 1774 800E0F74 304E20AC */  sw         $zero, %lo(D_800F4E30)($at)
/* 1778 800E0F78 80006228 */  slti       $v0, $v1, 0x80
/* 177C 800E0F7C 10004010 */  beqz       $v0, .L800E0FC0
/* 1780 800E0F80 00000000 */   nop
.L800E0F84:
/* 1784 800E0F84 0F80023C */  lui        $v0, %hi(D_800F4CC4)
/* 1788 800E0F88 C44C428C */  lw         $v0, %lo(D_800F4CC4)($v0)
/* 178C 800E0F8C 00000000 */  nop
/* 1790 800E0F90 C0100200 */  sll        $v0, $v0, 3
/* 1794 800E0F94 21104300 */  addu       $v0, $v0, $v1
/* 1798 800E0F98 0F80013C */  lui        $at, %hi(D_800F4CF4)
/* 179C 800E0F9C F44C22AC */  sw         $v0, %lo(D_800F4CF4)($at)
/* 17A0 800E0FA0 5093030C */  jal        func_800E4D40
/* 17A4 800E0FA4 00000000 */   nop
/* 17A8 800E0FA8 0F80033C */  lui        $v1, %hi(D_800F4CF4)
/* 17AC 800E0FAC F44C638C */  lw         $v1, %lo(D_800F4CF4)($v1)
/* 17B0 800E0FB0 00000000 */  nop
/* 17B4 800E0FB4 80006228 */  slti       $v0, $v1, 0x80
/* 17B8 800E0FB8 F2FF4014 */  bnez       $v0, .L800E0F84
/* 17BC 800E0FBC 00000000 */   nop
.L800E0FC0:
/* 17C0 800E0FC0 1000BF8F */  lw         $ra, 0x10($sp)
/* 17C4 800E0FC4 00000000 */  nop
/* 17C8 800E0FC8 0800E003 */  jr         $ra
/* 17CC 800E0FCC 1800BD27 */   addiu     $sp, $sp, 0x18
