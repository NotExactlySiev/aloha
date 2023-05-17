.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E15FC
/* 1DFC 800E15FC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 1E00 800E1600 2000BFAF */  sw         $ra, 0x20($sp)
/* 1E04 800E1604 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 1E08 800E1608 1800B2AF */  sw         $s2, 0x18($sp)
/* 1E0C 800E160C 1400B1AF */  sw         $s1, 0x14($sp)
/* 1E10 800E1610 1000B0AF */  sw         $s0, 0x10($sp)
/* 1E14 800E1614 21800000 */  addu       $s0, $zero, $zero
/* 1E18 800E1618 0F80023C */  lui        $v0, %hi(D_800F4D08)
/* 1E1C 800E161C 084D428C */  lw         $v0, %lo(D_800F4D08)($v0)
/* 1E20 800E1620 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1E24 800E1624 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1E28 800E1628 FF000934 */  ori        $t1, $zero, 0xFF
/* 1E2C 800E162C 01004224 */  addiu      $v0, $v0, 0x1
/* 1E30 800E1630 0F80013C */  lui        $at, %hi(D_800F4D08)
/* 1E34 800E1634 084D22AC */  sw         $v0, %lo(D_800F4D08)($at)
/* 1E38 800E1638 120560A0 */  sb         $zero, 0x512($v1)
.L800E163C:
/* 1E3C 800E163C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1E40 800E1640 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1E44 800E1644 00000000 */  nop
/* 1E48 800E1648 21105000 */  addu       $v0, $v0, $s0
/* 1E4C 800E164C 0F0549A0 */  sb         $t1, 0x50F($v0)
/* 1E50 800E1650 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1E54 800E1654 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1E58 800E1658 00121000 */  sll        $v0, $s0, 8
/* 1E5C 800E165C 21104300 */  addu       $v0, $v0, $v1
/* 1E60 800E1660 00014724 */  addiu      $a3, $v0, 0x100
/* 1E64 800E1664 00046624 */  addiu      $a2, $v1, 0x400
/* 1E68 800E1668 00056824 */  addiu      $t0, $v1, 0x500
.L800E166C:
/* 1E6C 800E166C 0000C28C */  lw         $v0, 0x0($a2)
/* 1E70 800E1670 0400C38C */  lw         $v1, 0x4($a2)
/* 1E74 800E1674 0800C48C */  lw         $a0, 0x8($a2)
/* 1E78 800E1678 0C00C58C */  lw         $a1, 0xC($a2)
/* 1E7C 800E167C 0000E2AC */  sw         $v0, 0x0($a3)
/* 1E80 800E1680 0400E3AC */  sw         $v1, 0x4($a3)
/* 1E84 800E1684 0800E4AC */  sw         $a0, 0x8($a3)
/* 1E88 800E1688 0C00E5AC */  sw         $a1, 0xC($a3)
/* 1E8C 800E168C 1000C624 */  addiu      $a2, $a2, 0x10
/* 1E90 800E1690 F6FFC814 */  bne        $a2, $t0, .L800E166C
/* 1E94 800E1694 1000E724 */   addiu     $a3, $a3, 0x10
/* 1E98 800E1698 01001026 */  addiu      $s0, $s0, 0x1
/* 1E9C 800E169C 0300022A */  slti       $v0, $s0, 0x3
/* 1EA0 800E16A0 E6FF4014 */  bnez       $v0, .L800E163C
/* 1EA4 800E16A4 00000000 */   nop
/* 1EA8 800E16A8 21800000 */  addu       $s0, $zero, $zero
.L800E16AC:
/* 1EAC 800E16AC 5093030C */  jal        func_800E4D40
/* 1EB0 800E16B0 01001026 */   addiu     $s0, $s0, 0x1
/* 1EB4 800E16B4 0900022A */  slti       $v0, $s0, 0x9
/* 1EB8 800E16B8 FCFF4014 */  bnez       $v0, .L800E16AC
/* 1EBC 800E16BC 00000000 */   nop
/* 1EC0 800E16C0 0E80043C */  lui        $a0, %hi(func_800E4D40)
/* 1EC4 800E16C4 404D8424 */  addiu      $a0, $a0, %lo(func_800E4D40)
/* 1EC8 800E16C8 6985030C */  jal        func_800E15A4
/* 1ECC 800E16CC 21800000 */   addu      $s0, $zero, $zero
/* 1ED0 800E16D0 01001334 */  ori        $s3, $zero, 0x1
/* 1ED4 800E16D4 00011234 */  ori        $s2, $zero, 0x100
/* 1ED8 800E16D8 21880000 */  addu       $s1, $zero, $zero
.L800E16DC:
/* 1EDC 800E16DC 21200000 */  addu       $a0, $zero, $zero
.L800E16E0:
/* 1EE0 800E16E0 1A80063C */  lui        $a2, %hi(D_801A0FD8)
/* 1EE4 800E16E4 D80FC68C */  lw         $a2, %lo(D_801A0FD8)($a2)
/* 1EE8 800E16E8 21280002 */  addu       $a1, $s0, $zero
/* 1EEC 800E16EC 00010734 */  ori        $a3, $zero, 0x100
/* 1EF0 800E16F0 F69E030C */  jal        func_800E7BD8
/* 1EF4 800E16F4 21304602 */   addu      $a2, $s2, $a2
/* 1EF8 800E16F8 21404000 */  addu       $t0, $v0, $zero
/* 1EFC 800E16FC 07001315 */  bne        $t0, $s3, .L800E171C
/* 1F00 800E1700 00000000 */   nop
/* 1F04 800E1704 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1F08 800E1708 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1F0C 800E170C 00000000 */  nop
/* 1F10 800E1710 21105000 */  addu       $v0, $v0, $s0
/* 1F14 800E1714 F4850308 */  j          .L800E17D0
/* 1F18 800E1718 0F0553A0 */   sb        $s3, 0x50F($v0)
.L800E171C:
/* 1F1C 800E171C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1F20 800E1720 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1F24 800E1724 00000000 */  nop
/* 1F28 800E1728 21102302 */  addu       $v0, $s1, $v1
/* 1F2C 800E172C 00014724 */  addiu      $a3, $v0, 0x100
/* 1F30 800E1730 00046624 */  addiu      $a2, $v1, 0x400
/* 1F34 800E1734 00056924 */  addiu      $t1, $v1, 0x500
.L800E1738:
/* 1F38 800E1738 0000C28C */  lw         $v0, 0x0($a2)
/* 1F3C 800E173C 0400C38C */  lw         $v1, 0x4($a2)
/* 1F40 800E1740 0800C48C */  lw         $a0, 0x8($a2)
/* 1F44 800E1744 0C00C58C */  lw         $a1, 0xC($a2)
/* 1F48 800E1748 0000E2AC */  sw         $v0, 0x0($a3)
/* 1F4C 800E174C 0400E3AC */  sw         $v1, 0x4($a3)
/* 1F50 800E1750 0800E4AC */  sw         $a0, 0x8($a3)
/* 1F54 800E1754 0C00E5AC */  sw         $a1, 0xC($a3)
/* 1F58 800E1758 1000C624 */  addiu      $a2, $a2, 0x10
/* 1F5C 800E175C F6FFC914 */  bne        $a2, $t1, .L800E1738
/* 1F60 800E1760 1000E724 */   addiu     $a3, $a3, 0x10
/* 1F64 800E1764 15000105 */  bgez       $t0, .L800E17BC
/* 1F68 800E1768 00000000 */   nop
/* 1F6C 800E176C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1F70 800E1770 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1F74 800E1774 00000000 */  nop
/* 1F78 800E1778 040A428C */  lw         $v0, 0xA04($v0)
/* 1F7C 800E177C 00000000 */  nop
/* 1F80 800E1780 09F84000 */  jalr       $v0
/* 1F84 800E1784 21200000 */   addu      $a0, $zero, $zero
/* 1F88 800E1788 21404000 */  addu       $t0, $v0, $zero
/* 1F8C 800E178C D4FF1311 */  beq        $t0, $s3, .L800E16E0
/* 1F90 800E1790 21200000 */   addu      $a0, $zero, $zero
/* 1F94 800E1794 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1F98 800E1798 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1F9C 800E179C 23100800 */  negu       $v0, $t0
/* 1FA0 800E17A0 120562A0 */  sb         $v0, 0x512($v1)
/* 1FA4 800E17A4 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1FA8 800E17A8 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1FAC 800E17AC FF000334 */  ori        $v1, $zero, 0xFF
/* 1FB0 800E17B0 21105000 */  addu       $v0, $v0, $s0
/* 1FB4 800E17B4 1E860308 */  j          .L800E1878
/* 1FB8 800E17B8 0F0543A0 */   sb        $v1, 0x50F($v0)
.L800E17BC:
/* 1FBC 800E17BC 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 1FC0 800E17C0 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 1FC4 800E17C4 00000000 */  nop
/* 1FC8 800E17C8 21105000 */  addu       $v0, $v0, $s0
/* 1FCC 800E17CC 0F0540A0 */  sb         $zero, 0x50F($v0)
.L800E17D0:
/* 1FD0 800E17D0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1FD4 800E17D4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1FD8 800E17D8 00000000 */  nop
/* 1FDC 800E17DC 21107000 */  addu       $v0, $v1, $s0
/* 1FE0 800E17E0 0F054290 */  lbu        $v0, 0x50F($v0)
/* 1FE4 800E17E4 00000000 */  nop
/* 1FE8 800E17E8 1E005314 */  bne        $v0, $s3, .L800E1864
/* 1FEC 800E17EC 00000000 */   nop
/* 1FF0 800E17F0 5C85030C */  jal        func_800E1570
/* 1FF4 800E17F4 21204302 */   addu      $a0, $s2, $v1
/* 1FF8 800E17F8 1A004014 */  bnez       $v0, .L800E1864
/* 1FFC 800E17FC 21200000 */   addu      $a0, $zero, $zero
/* 2000 800E1800 369F030C */  jal        func_800E7CD8
/* 2004 800E1804 21280002 */   addu      $a1, $s0, $zero
/* 2008 800E1808 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 200C 800E180C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 2010 800E1810 00000000 */  nop
/* 2014 800E1814 21105000 */  addu       $v0, $v0, $s0
/* 2018 800E1818 0F0540A0 */  sb         $zero, 0x50F($v0)
/* 201C 800E181C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 2020 800E1820 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2024 800E1824 00000000 */  nop
/* 2028 800E1828 21102302 */  addu       $v0, $s1, $v1
/* 202C 800E182C 00014724 */  addiu      $a3, $v0, 0x100
/* 2030 800E1830 00046624 */  addiu      $a2, $v1, 0x400
/* 2034 800E1834 00056824 */  addiu      $t0, $v1, 0x500
.L800E1838:
/* 2038 800E1838 0000C28C */  lw         $v0, 0x0($a2)
/* 203C 800E183C 0400C38C */  lw         $v1, 0x4($a2)
/* 2040 800E1840 0800C48C */  lw         $a0, 0x8($a2)
/* 2044 800E1844 0C00C58C */  lw         $a1, 0xC($a2)
/* 2048 800E1848 0000E2AC */  sw         $v0, 0x0($a3)
/* 204C 800E184C 0400E3AC */  sw         $v1, 0x4($a3)
/* 2050 800E1850 0800E4AC */  sw         $a0, 0x8($a3)
/* 2054 800E1854 0C00E5AC */  sw         $a1, 0xC($a3)
/* 2058 800E1858 1000C624 */  addiu      $a2, $a2, 0x10
/* 205C 800E185C F6FFC814 */  bne        $a2, $t0, .L800E1838
/* 2060 800E1860 1000E724 */   addiu     $a3, $a3, 0x10
.L800E1864:
/* 2064 800E1864 00015226 */  addiu      $s2, $s2, 0x100
/* 2068 800E1868 01001026 */  addiu      $s0, $s0, 0x1
/* 206C 800E186C 0300022A */  slti       $v0, $s0, 0x3
/* 2070 800E1870 9AFF4014 */  bnez       $v0, .L800E16DC
/* 2074 800E1874 00013126 */   addiu     $s1, $s1, 0x100
.L800E1878:
/* 2078 800E1878 6985030C */  jal        func_800E15A4
/* 207C 800E187C 21200000 */   addu      $a0, $zero, $zero
/* 2080 800E1880 2000BF8F */  lw         $ra, 0x20($sp)
/* 2084 800E1884 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2088 800E1888 1800B28F */  lw         $s2, 0x18($sp)
/* 208C 800E188C 1400B18F */  lw         $s1, 0x14($sp)
/* 2090 800E1890 1000B08F */  lw         $s0, 0x10($sp)
/* 2094 800E1894 0800E003 */  jr         $ra
/* 2098 800E1898 2800BD27 */   addiu     $sp, $sp, 0x28
