.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9F7C
/* A77C 800E9F7C 00F08448 */  mtc2       $a0, $30 # handwritten instruction
/* A780 800E9F80 00000000 */  nop
/* A784 800E9F84 00000000 */  nop
/* A788 800E9F88 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* A78C 800E9F8C 20000124 */  addiu      $at, $zero, 0x20
/* A790 800E9F90 1B004110 */  beq        $v0, $at, .L800EA000
/* A794 800E9F94 00000000 */   nop
/* A798 800E9F98 19004010 */  beqz       $v0, .L800EA000
/* A79C 800E9F9C 00000000 */   nop
/* A7A0 800E9FA0 01004830 */  andi       $t0, $v0, 0x1
/* A7A4 800E9FA4 FEFF0A24 */  addiu      $t2, $zero, -0x2
/* A7A8 800E9FA8 24504A00 */  and        $t2, $v0, $t2
/* A7AC 800E9FAC 1F000924 */  addiu      $t1, $zero, 0x1F
/* A7B0 800E9FB0 22482A01 */  sub        $t1, $t1, $t2 # handwritten instruction
/* A7B4 800E9FB4 43480900 */  sra        $t1, $t1, 1
/* A7B8 800E9FB8 E8FF4B21 */  addi       $t3, $t2, -0x18 # handwritten instruction
/* A7BC 800E9FBC 03006005 */  bltz       $t3, .L800E9FCC
/* A7C0 800E9FC0 00000000 */   nop
/* A7C4 800E9FC4 04606401 */  sllv       $t4, $a0, $t3
/* A7C8 800E9FC8 03000010 */  b          .L800E9FD8
.L800E9FCC:
/* A7CC 800E9FCC 18000B24 */   addiu     $t3, $zero, 0x18
/* A7D0 800E9FD0 22586A01 */  sub        $t3, $t3, $t2 # handwritten instruction
/* A7D4 800E9FD4 07606401 */  srav       $t4, $a0, $t3
.L800E9FD8:
/* A7D8 800E9FD8 C0FF8C21 */  addi       $t4, $t4, -0x40 # handwritten instruction
/* A7DC 800E9FDC 40600C00 */  sll        $t4, $t4, 1
/* A7E0 800E9FE0 0F800D3C */  lui        $t5, %hi(D_800F0A94)
/* A7E4 800E9FE4 2168AC01 */  addu       $t5, $t5, $t4
/* A7E8 800E9FE8 940AAD85 */  lh         $t5, %lo(D_800F0A94)($t5)
/* A7EC 800E9FEC 0000C9AC */  sw         $t1, 0x0($a2)
/* A7F0 800E9FF0 0000ADAC */  sw         $t5, 0x0($a1)
/* A7F4 800E9FF4 01000224 */  addiu      $v0, $zero, 0x1
/* A7F8 800E9FF8 0800E003 */  jr         $ra
/* A7FC 800E9FFC 00000000 */   nop
.L800EA000:
/* A800 800EA000 0800E003 */  jr         $ra
/* A804 800EA004 FFFF0224 */   addiu     $v0, $zero, -0x1
