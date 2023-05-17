.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C670
/* 4E70 8001C670 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4E74 8001C674 2400BFAF */  sw         $ra, 0x24($sp)
/* 4E78 8001C678 2000B4AF */  sw         $s4, 0x20($sp)
/* 4E7C 8001C67C 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 4E80 8001C680 1800B2AF */  sw         $s2, 0x18($sp)
/* 4E84 8001C684 1400B1AF */  sw         $s1, 0x14($sp)
/* 4E88 8001C688 1000B0AF */  sw         $s0, 0x10($sp)
/* 4E8C 8001C68C 21888000 */  addu       $s1, $a0, $zero
/* 4E90 8001C690 2190A000 */  addu       $s2, $a1, $zero
/* 4E94 8001C694 DF69000C */  jal        func_8001A77C
/* 4E98 8001C698 2198C000 */   addu      $s3, $a2, $zero
/* 4E9C 8001C69C 536E000C */  jal        func_8001B94C
/* 4EA0 8001C6A0 FFFF1424 */   addiu     $s4, $zero, -0x1
/* 4EA4 8001C6A4 03005414 */  bne        $v0, $s4, .L8001C6B4
/* 4EA8 8001C6A8 21202002 */   addu      $a0, $s1, $zero
/* 4EAC 8001C6AC C5710008 */  j          .L8001C714
/* 4EB0 8001C6B0 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001C6B4:
/* 4EB4 8001C6B4 21284002 */  addu       $a1, $s2, $zero
/* 4EB8 8001C6B8 9C68000C */  jal        func_8001A270
/* 4EBC 8001C6BC 21306002 */   addu      $a2, $s3, $zero
/* 4EC0 8001C6C0 21200000 */  addu       $a0, $zero, $zero
/* 4EC4 8001C6C4 B268000C */  jal        func_8001A2C8
/* 4EC8 8001C6C8 21280000 */   addu      $a1, $zero, $zero
/* 4ECC 8001C6CC 21804000 */  addu       $s0, $v0, $zero
/* 4ED0 8001C6D0 0C001416 */  bne        $s0, $s4, .L8001C704
/* 4ED4 8001C6D4 09000434 */   ori       $a0, $zero, 0x9
/* 4ED8 8001C6D8 21202002 */  addu       $a0, $s1, $zero
/* 4EDC 8001C6DC 21284002 */  addu       $a1, $s2, $zero
/* 4EE0 8001C6E0 9C68000C */  jal        func_8001A270
/* 4EE4 8001C6E4 21306002 */   addu      $a2, $s3, $zero
/* 4EE8 8001C6E8 21200000 */  addu       $a0, $zero, $zero
/* 4EEC 8001C6EC B268000C */  jal        func_8001A2C8
/* 4EF0 8001C6F0 21280000 */   addu      $a1, $zero, $zero
/* 4EF4 8001C6F4 03005014 */  bne        $v0, $s0, .L8001C704
/* 4EF8 8001C6F8 09000434 */   ori       $a0, $zero, 0x9
/* 4EFC 8001C6FC C5710008 */  j          .L8001C714
/* 4F00 8001C700 21100000 */   addu      $v0, $zero, $zero
.L8001C704:
/* 4F04 8001C704 21280000 */  addu       $a1, $zero, $zero
/* 4F08 8001C708 5B68000C */  jal        func_8001A16C
/* 4F0C 8001C70C 21300000 */   addu      $a2, $zero, $zero
/* 4F10 8001C710 01000234 */  ori        $v0, $zero, 0x1
.L8001C714:
/* 4F14 8001C714 2400BF8F */  lw         $ra, 0x24($sp)
/* 4F18 8001C718 2000B48F */  lw         $s4, 0x20($sp)
/* 4F1C 8001C71C 1C00B38F */  lw         $s3, 0x1C($sp)
/* 4F20 8001C720 1800B28F */  lw         $s2, 0x18($sp)
/* 4F24 8001C724 1400B18F */  lw         $s1, 0x14($sp)
/* 4F28 8001C728 1000B08F */  lw         $s0, 0x10($sp)
/* 4F2C 8001C72C 0800E003 */  jr         $ra
/* 4F30 8001C730 2800BD27 */   addiu     $sp, $sp, 0x28
