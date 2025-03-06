.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800206E4
/* 8EE4 800206E4 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 8EE8 800206E8 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 8EEC 800206EC 2800B6AF */  sw         $s6, 0x28($sp)
/* 8EF0 800206F0 2400B5AF */  sw         $s5, 0x24($sp)
/* 8EF4 800206F4 2000B4AF */  sw         $s4, 0x20($sp)
/* 8EF8 800206F8 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 8EFC 800206FC 1800B2AF */  sw         $s2, 0x18($sp)
/* 8F00 80020700 1400B1AF */  sw         $s1, 0x14($sp)
/* 8F04 80020704 1000B0AF */  sw         $s0, 0x10($sp)
/* 8F08 80020708 21A08000 */  addu       $s4, $a0, $zero
/* 8F0C 8002070C 2190A000 */  addu       $s2, $a1, $zero
/* 8F10 80020710 2188C000 */  addu       $s1, $a2, $zero
/* 8F14 80020714 2198E000 */  addu       $s3, $a3, $zero
/* 8F18 80020718 21B02002 */  addu       $s6, $s1, $zero
/* 8F1C 8002071C E8031034 */  ori        $s0, $zero, 0x3E8
.L80020720:
/* 8F20 80020720 2A8F000C */  jal        _card_info
/* 8F24 80020724 21208002 */   addu      $a0, $s4, $zero
/* 8F28 80020728 04004014 */  bnez       $v0, .L8002073C
/* 8F2C 8002072C 00000000 */   nop
/* 8F30 80020730 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 8F34 80020734 FAFF001E */  bgtz       $s0, .L80020720
/* 8F38 80020738 00000000 */   nop
.L8002073C:
/* 8F3C 8002073C 28000012 */  beqz       $s0, .L800207E0
/* 8F40 80020740 21100000 */   addu      $v0, $zero, $zero
.L80020744:
/* 8F44 80020744 177F000C */  jal        func_8001FC5C
/* 8F48 80020748 00000000 */   nop
/* 8F4C 8002074C 21804000 */  addu       $s0, $v0, $zero
/* 8F50 80020750 07000016 */  bnez       $s0, .L80020770
/* 8F54 80020754 04000234 */   ori       $v0, $zero, 0x4
/* 8F58 80020758 286C000C */  jal        cd_run_block
/* 8F5C 8002075C 00000000 */   nop
/* 8F60 80020760 F57F000C */  jal        func_8001FFD4
/* 8F64 80020764 00000000 */   nop
/* 8F68 80020768 D1810008 */  j          .L80020744
/* 8F6C 8002076C 00000000 */   nop
.L80020770:
/* 8F70 80020770 03000212 */  beq        $s0, $v0, .L80020780
/* 8F74 80020774 7F003126 */   addiu     $s1, $s1, 0x7F
.L80020778:
/* 8F78 80020778 F8810008 */  j          .L800207E0
/* 8F7C 8002077C FFFF0224 */   addiu     $v0, $zero, -0x1
.L80020780:
/* 8F80 80020780 02002106 */  bgez       $s1, .L8002078C
/* 8F84 80020784 00000000 */   nop
/* 8F88 80020788 7F003126 */  addiu      $s1, $s1, 0x7F
.L8002078C:
/* 8F8C 8002078C C3891100 */  sra        $s1, $s1, 7
/* 8F90 80020790 13002012 */  beqz       $s1, .L800207E0
/* 8F94 80020794 21100000 */   addu      $v0, $zero, $zero
/* 8F98 80020798 1100201A */  blez       $s1, .L800207E0
/* 8F9C 8002079C 2110C002 */   addu      $v0, $s6, $zero
/* 8FA0 800207A0 04001534 */  ori        $s5, $zero, 0x4
.L800207A4:
/* 8FA4 800207A4 21208002 */  addu       $a0, $s4, $zero
/* 8FA8 800207A8 21284002 */  addu       $a1, $s2, $zero
/* 8FAC 800207AC 328F000C */  jal         _card_write
/* 8FB0 800207B0 21306002 */   addu      $a2, $s3, $zero
.L800207B4:
/* 8FB4 800207B4 3D7F000C */  jal        func_8001FCF4
/* 8FB8 800207B8 00000000 */   nop
/* 8FBC 800207BC 21804000 */  addu       $s0, $v0, $zero
/* 8FC0 800207C0 FCFF0012 */  beqz       $s0, .L800207B4
/* 8FC4 800207C4 00000000 */   nop
/* 8FC8 800207C8 EBFF1516 */  bne        $s0, $s5, .L80020778
/* 8FCC 800207CC FFFF3126 */   addiu     $s1, $s1, -0x1
/* 8FD0 800207D0 01005226 */  addiu      $s2, $s2, 0x1
/* 8FD4 800207D4 F3FF201E */  bgtz       $s1, .L800207A4
/* 8FD8 800207D8 80007326 */   addiu     $s3, $s3, 0x80
/* 8FDC 800207DC 2110C002 */  addu       $v0, $s6, $zero
.L800207E0:
/* 8FE0 800207E0 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 8FE4 800207E4 2800B68F */  lw         $s6, 0x28($sp)
/* 8FE8 800207E8 2400B58F */  lw         $s5, 0x24($sp)
/* 8FEC 800207EC 2000B48F */  lw         $s4, 0x20($sp)
/* 8FF0 800207F0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 8FF4 800207F4 1800B28F */  lw         $s2, 0x18($sp)
/* 8FF8 800207F8 1400B18F */  lw         $s1, 0x14($sp)
/* 8FFC 800207FC 1000B08F */  lw         $s0, 0x10($sp)
/* 9000 80020800 0800E003 */  jr         $ra
/* 9004 80020804 3000BD27 */   addiu     $sp, $sp, 0x30
