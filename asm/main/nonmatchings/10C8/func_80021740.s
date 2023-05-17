.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021740
/* 9F40 80021740 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 9F44 80021744 2000BFAF */  sw         $ra, 0x20($sp)
/* 9F48 80021748 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 9F4C 8002174C 1800B2AF */  sw         $s2, 0x18($sp)
/* 9F50 80021750 1400B1AF */  sw         $s1, 0x14($sp)
/* 9F54 80021754 1000B0AF */  sw         $s0, 0x10($sp)
/* 9F58 80021758 4F74000C */  jal        func_8001D13C
/* 9F5C 8002175C 21900000 */   addu      $s2, $zero, $zero
/* 9F60 80021760 21204000 */  addu       $a0, $v0, $zero
/* 9F64 80021764 0480023C */  lui        $v0, %hi(D_80047E30)
/* 9F68 80021768 307E428C */  lw         $v0, %lo(D_80047E30)($v0)
/* 9F6C 8002176C 01000334 */  ori        $v1, $zero, 0x1
/* 9F70 80021770 06004310 */  beq        $v0, $v1, .L8002178C
/* 9F74 80021774 00000000 */   nop
/* 9F78 80021778 0480023C */  lui        $v0, %hi(D_80047E28)
/* 9F7C 8002177C 287E428C */  lw         $v0, %lo(D_80047E28)($v0)
/* 9F80 80021780 00000000 */  nop
/* 9F84 80021784 03004314 */  bne        $v0, $v1, .L80021794
/* 9F88 80021788 00108230 */   andi      $v0, $a0, 0x1000
.L8002178C:
/* 9F8C 8002178C 01001234 */  ori        $s2, $zero, 0x1
/* 9F90 80021790 00108230 */  andi       $v0, $a0, 0x1000
.L80021794:
/* 9F94 80021794 02004010 */  beqz       $v0, .L800217A0
/* 9F98 80021798 00808230 */   andi      $v0, $a0, 0x8000
/* 9F9C 8002179C 08005236 */  ori        $s2, $s2, 0x8
.L800217A0:
/* 9FA0 800217A0 02004010 */  beqz       $v0, .L800217AC
/* 9FA4 800217A4 21800000 */   addu      $s0, $zero, $zero
/* 9FA8 800217A8 02005236 */  ori        $s2, $s2, 0x2
.L800217AC:
/* 9FAC 800217AC 21880000 */  addu       $s1, $zero, $zero
/* 9FB0 800217B0 01001334 */  ori        $s3, $zero, 0x1
.L800217B4:
/* 9FB4 800217B4 0D7F000C */  jal        func_8001FC34
/* 9FB8 800217B8 21200002 */   addu      $a0, $s0, $zero
/* 9FBC 800217BC 02005314 */  bne        $v0, $s3, .L800217C8
/* 9FC0 800217C0 01001026 */   addiu     $s0, $s0, 0x1
/* 9FC4 800217C4 01001134 */  ori        $s1, $zero, 0x1
.L800217C8:
/* 9FC8 800217C8 1800022A */  slti       $v0, $s0, 0x18
/* 9FCC 800217CC 03004010 */  beqz       $v0, .L800217DC
/* 9FD0 800217D0 00000000 */   nop
/* 9FD4 800217D4 F7FF2012 */  beqz       $s1, .L800217B4
/* 9FD8 800217D8 00000000 */   nop
.L800217DC:
/* 9FDC 800217DC 03003316 */  bne        $s1, $s3, .L800217EC
/* 9FE0 800217E0 21104002 */   addu      $v0, $s2, $zero
/* 9FE4 800217E4 04005236 */  ori        $s2, $s2, 0x4
/* 9FE8 800217E8 21104002 */  addu       $v0, $s2, $zero
.L800217EC:
/* 9FEC 800217EC 2000BF8F */  lw         $ra, 0x20($sp)
/* 9FF0 800217F0 1C00B38F */  lw         $s3, 0x1C($sp)
/* 9FF4 800217F4 1800B28F */  lw         $s2, 0x18($sp)
/* 9FF8 800217F8 1400B18F */  lw         $s1, 0x14($sp)
/* 9FFC 800217FC 1000B08F */  lw         $s0, 0x10($sp)
/* A000 80021800 0800E003 */  jr         $ra
/* A004 80021804 2800BD27 */   addiu     $sp, $sp, 0x28
