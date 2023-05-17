.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9CD4
/* A4D4 800E9CD4 0000888C */  lw         $t0, 0x0($a0)
/* A4D8 800E9CD8 0400898C */  lw         $t1, 0x4($a0)
/* A4DC 800E9CDC 19000801 */  multu      $t0, $t0
/* A4E0 800E9CE0 08008A8C */  lw         $t2, 0x8($a0)
/* A4E4 800E9CE4 12580000 */  mflo       $t3
/* A4E8 800E9CE8 00000000 */  nop
/* A4EC 800E9CEC 00000000 */  nop
/* A4F0 800E9CF0 19002901 */  multu      $t1, $t1
/* A4F4 800E9CF4 12600000 */  mflo       $t4
/* A4F8 800E9CF8 20586C01 */  add        $t3, $t3, $t4 # handwritten instruction
/* A4FC 800E9CFC 00000000 */  nop
/* A500 800E9D00 19004A01 */  multu      $t2, $t2
/* A504 800E9D04 12680000 */  mflo       $t5
/* A508 800E9D08 20186D01 */  add        $v1, $t3, $t5 # handwritten instruction
/* A50C 800E9D0C 00000000 */  nop
/* A510 800E9D10 21788000 */  addu       $t7, $a0, $zero
/* A514 800E9D14 21C0A000 */  addu       $t8, $a1, $zero
/* A518 800E9D18 21206000 */  addu       $a0, $v1, $zero
/* A51C 800E9D1C 0F80053C */  lui        $a1, %hi(D_800F090C)
/* A520 800E9D20 0C09A524 */  addiu      $a1, $a1, %lo(D_800F090C)
/* A524 800E9D24 0F80063C */  lui        $a2, %hi(D_800F0910)
/* A528 800E9D28 1009C624 */  addiu      $a2, $a2, %lo(D_800F0910)
/* A52C 800E9D2C 0F80013C */  lui        $at, %hi(D_800F0904)
/* A530 800E9D30 04093FAC */  sw         $ra, %lo(D_800F0904)($at)
/* A534 800E9D34 DFA7030C */  jal        func_800E9F7C
/* A538 800E9D38 00000000 */   nop
/* A53C 800E9D3C 0F801F3C */  lui        $ra, %hi(D_800F0904)
/* A540 800E9D40 0409FF8F */  lw         $ra, %lo(D_800F0904)($ra)
/* A544 800E9D44 00000000 */  nop
/* A548 800E9D48 0F800C3C */  lui        $t4, %hi(D_800F090C)
/* A54C 800E9D4C 0C098C8D */  lw         $t4, %lo(D_800F090C)($t4)
/* A550 800E9D50 0F800D3C */  lui        $t5, %hi(D_800F0910)
/* A554 800E9D54 1009AD8D */  lw         $t5, %lo(D_800F0910)($t5)
/* A558 800E9D58 0000E88D */  lw         $t0, 0x0($t7)
/* A55C 800E9D5C 0400E98D */  lw         $t1, 0x4($t7)
/* A560 800E9D60 19000C01 */  multu      $t0, $t4
/* A564 800E9D64 0800EA8D */  lw         $t2, 0x8($t7)
/* A568 800E9D68 21106000 */  addu       $v0, $v1, $zero
/* A56C 800E9D6C 12400000 */  mflo       $t0
/* A570 800E9D70 0740A801 */  srav       $t0, $t0, $t5
/* A574 800E9D74 000008AF */  sw         $t0, 0x0($t8)
/* A578 800E9D78 19002C01 */  multu      $t1, $t4
/* A57C 800E9D7C 12480000 */  mflo       $t1
/* A580 800E9D80 0748A901 */  srav       $t1, $t1, $t5
/* A584 800E9D84 040009AF */  sw         $t1, 0x4($t8)
/* A588 800E9D88 19004C01 */  multu      $t2, $t4
/* A58C 800E9D8C 12500000 */  mflo       $t2
/* A590 800E9D90 0750AA01 */  srav       $t2, $t2, $t5
/* A594 800E9D94 0800E003 */  jr         $ra
/* A598 800E9D98 08000AAF */   sw        $t2, 0x8($t8)
