.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9E64
/* A664 800E9E64 00F08448 */  mtc2       $a0, $30 # handwritten instruction
/* A668 800E9E68 00000000 */  nop
/* A66C 800E9E6C 00000000 */  nop
/* A670 800E9E70 00F80248 */  mfc2       $v0, $31 # handwritten instruction
/* A674 800E9E74 20000124 */  addiu      $at, $zero, 0x20
/* A678 800E9E78 19004110 */  beq        $v0, $at, .L800E9EE0
/* A67C 800E9E7C 00000000 */   nop
/* A680 800E9E80 01004830 */  andi       $t0, $v0, 0x1
/* A684 800E9E84 FEFF0A24 */  addiu      $t2, $zero, -0x2
/* A688 800E9E88 24504A00 */  and        $t2, $v0, $t2
/* A68C 800E9E8C 1F000924 */  addiu      $t1, $zero, 0x1F
/* A690 800E9E90 22482A01 */  sub        $t1, $t1, $t2 # handwritten instruction
/* A694 800E9E94 43480900 */  sra        $t1, $t1, 1
/* A698 800E9E98 E8FF4B21 */  addi       $t3, $t2, -0x18 # handwritten instruction
/* A69C 800E9E9C 03006005 */  bltz       $t3, .L800E9EAC
/* A6A0 800E9EA0 00000000 */   nop
/* A6A4 800E9EA4 04606401 */  sllv       $t4, $a0, $t3
/* A6A8 800E9EA8 03000010 */  b          .L800E9EB8
.L800E9EAC:
/* A6AC 800E9EAC 18000B24 */   addiu     $t3, $zero, 0x18
/* A6B0 800E9EB0 22586A01 */  sub        $t3, $t3, $t2 # handwritten instruction
/* A6B4 800E9EB4 07606401 */  srav       $t4, $a0, $t3
.L800E9EB8:
/* A6B8 800E9EB8 C0FF8C21 */  addi       $t4, $t4, -0x40 # handwritten instruction
/* A6BC 800E9EBC 40600C00 */  sll        $t4, $t4, 1
/* A6C0 800E9EC0 0F800D3C */  lui        $t5, %hi(D_800F0914)
/* A6C4 800E9EC4 2168AC01 */  addu       $t5, $t5, $t4
/* A6C8 800E9EC8 1409AD85 */  lh         $t5, %lo(D_800F0914)($t5)
/* A6CC 800E9ECC 00000000 */  nop
/* A6D0 800E9ED0 04682D01 */  sllv       $t5, $t5, $t1
/* A6D4 800E9ED4 02130D00 */  srl        $v0, $t5, 12
/* A6D8 800E9ED8 0800E003 */  jr         $ra
/* A6DC 800E9EDC 00000000 */   nop
.L800E9EE0:
/* A6E0 800E9EE0 0800E003 */  jr         $ra
/* A6E4 800E9EE4 00000224 */   addiu     $v0, $zero, 0x0
