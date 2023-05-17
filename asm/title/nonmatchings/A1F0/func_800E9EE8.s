.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9EE8
/* A6E8 800E9EE8 00F08448 */  mtc2       $a0, $30 # handwritten instruction
/* A6EC 800E9EEC 00000000 */  nop
/* A6F0 800E9EF0 00000000 */  nop
/* A6F4 800E9EF4 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* A6F8 800E9EF8 20000124 */  addiu      $at, $zero, 0x20
/* A6FC 800E9EFC 1D004110 */  beq        $v0, $at, .L800E9F74
/* A700 800E9F00 00000000 */   nop
/* A704 800E9F04 01004830 */  andi       $t0, $v0, 0x1
/* A708 800E9F08 FEFF0A24 */  addiu      $t2, $zero, -0x2
/* A70C 800E9F0C 24504A00 */  and        $t2, $v0, $t2
/* A710 800E9F10 13000924 */  addiu      $t1, $zero, 0x13
/* A714 800E9F14 22482A01 */  sub        $t1, $t1, $t2 # handwritten instruction
/* A718 800E9F18 43480900 */  sra        $t1, $t1, 1
/* A71C 800E9F1C E8FF4B21 */  addi       $t3, $t2, -0x18 # handwritten instruction
/* A720 800E9F20 03006005 */  bltz       $t3, .L800E9F30
/* A724 800E9F24 00000000 */   nop
/* A728 800E9F28 04606401 */  sllv       $t4, $a0, $t3
/* A72C 800E9F2C 03000010 */  b          .L800E9F3C
.L800E9F30:
/* A730 800E9F30 18000B24 */   addiu     $t3, $zero, 0x18
/* A734 800E9F34 22586A01 */  sub        $t3, $t3, $t2 # handwritten instruction
/* A738 800E9F38 07606401 */  srav       $t4, $a0, $t3
.L800E9F3C:
/* A73C 800E9F3C C0FF8C21 */  addi       $t4, $t4, -0x40 # handwritten instruction
/* A740 800E9F40 40600C00 */  sll        $t4, $t4, 1
/* A744 800E9F44 0F800D3C */  lui        $t5, %hi(D_800F0914)
/* A748 800E9F48 2168AC01 */  addu       $t5, $t5, $t4
/* A74C 800E9F4C 1409AD85 */  lh         $t5, %lo(D_800F0914)($t5)
/* A750 800E9F50 00000000 */  nop
/* A754 800E9F54 04002005 */  bltz       $t1, .L800E9F68
/* A758 800E9F58 00000000 */   nop
/* A75C 800E9F5C 04102D01 */  sllv       $v0, $t5, $t1
/* A760 800E9F60 0800E003 */  jr         $ra
/* A764 800E9F64 00000000 */   nop
.L800E9F68:
/* A768 800E9F68 22480900 */  sub        $t1, $zero, $t1 # handwritten instruction
/* A76C 800E9F6C 0800E003 */  jr         $ra
/* A770 800E9F70 06102D01 */   srlv      $v0, $t5, $t1
.L800E9F74:
/* A774 800E9F74 0800E003 */  jr         $ra
/* A778 800E9F78 00000224 */   addiu     $v0, $zero, 0x0
