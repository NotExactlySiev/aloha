.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025C9C
/* E49C 80025C9C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E4A0 80025CA0 1400B1AF */  sw         $s1, 0x14($sp)
/* E4A4 80025CA4 21888000 */  addu       $s1, $a0, $zero
/* E4A8 80025CA8 1000B0AF */  sw         $s0, 0x10($sp)
/* E4AC 80025CAC 2180A000 */  addu       $s0, $a1, $zero
/* E4B0 80025CB0 02000234 */  ori        $v0, $zero, 0x2
/* E4B4 80025CB4 1800BFAF */  sw         $ra, 0x18($sp)
/* E4B8 80025CB8 030022A2 */  sb         $v0, 0x3($s1)
/* E4BC 80025CBC 00000486 */  lh         $a0, 0x0($s0)
/* E4C0 80025CC0 02000586 */  lh         $a1, 0x2($s0)
/* E4C4 80025CC4 3B98000C */  jal        func_800260EC
/* E4C8 80025CC8 00000000 */   nop
/* E4CC 80025CCC 040022AE */  sw         $v0, 0x4($s1)
/* E4D0 80025CD0 00000496 */  lhu        $a0, 0x0($s0)
/* E4D4 80025CD4 04000296 */  lhu        $v0, 0x4($s0)
/* E4D8 80025CD8 02000596 */  lhu        $a1, 0x2($s0)
/* E4DC 80025CDC 21208200 */  addu       $a0, $a0, $v0
/* E4E0 80025CE0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* E4E4 80025CE4 00240400 */  sll        $a0, $a0, 16
/* E4E8 80025CE8 06000296 */  lhu        $v0, 0x6($s0)
/* E4EC 80025CEC 03240400 */  sra        $a0, $a0, 16
/* E4F0 80025CF0 2128A200 */  addu       $a1, $a1, $v0
/* E4F4 80025CF4 FFFFA524 */  addiu      $a1, $a1, -0x1
/* E4F8 80025CF8 002C0500 */  sll        $a1, $a1, 16
/* E4FC 80025CFC 6E98000C */  jal        func_800261B8
/* E500 80025D00 032C0500 */   sra       $a1, $a1, 16
/* E504 80025D04 080022AE */  sw         $v0, 0x8($s1)
/* E508 80025D08 1800BF8F */  lw         $ra, 0x18($sp)
/* E50C 80025D0C 1400B18F */  lw         $s1, 0x14($sp)
/* E510 80025D10 1000B08F */  lw         $s0, 0x10($sp)
/* E514 80025D14 2000BD27 */  addiu      $sp, $sp, 0x20
/* E518 80025D18 0800E003 */  jr         $ra
/* E51C 80025D1C 00000000 */   nop
