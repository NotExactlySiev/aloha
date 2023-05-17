.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9D9C
/* A59C 800E9D9C 0000888C */  lw         $t0, 0x0($a0)
/* A5A0 800E9DA0 0400898C */  lw         $t1, 0x4($a0)
/* A5A4 800E9DA4 19000801 */  multu      $t0, $t0
/* A5A8 800E9DA8 08008A8C */  lw         $t2, 0x8($a0)
/* A5AC 800E9DAC 12580000 */  mflo       $t3
/* A5B0 800E9DB0 00000000 */  nop
/* A5B4 800E9DB4 00000000 */  nop
/* A5B8 800E9DB8 19002901 */  multu      $t1, $t1
/* A5BC 800E9DBC 12600000 */  mflo       $t4
/* A5C0 800E9DC0 20586C01 */  add        $t3, $t3, $t4 # handwritten instruction
/* A5C4 800E9DC4 00000000 */  nop
/* A5C8 800E9DC8 19004A01 */  multu      $t2, $t2
/* A5CC 800E9DCC 12680000 */  mflo       $t5
/* A5D0 800E9DD0 20186D01 */  add        $v1, $t3, $t5 # handwritten instruction
/* A5D4 800E9DD4 00000000 */  nop
/* A5D8 800E9DD8 21788000 */  addu       $t7, $a0, $zero
/* A5DC 800E9DDC 21C0A000 */  addu       $t8, $a1, $zero
/* A5E0 800E9DE0 21206000 */  addu       $a0, $v1, $zero
/* A5E4 800E9DE4 0F80053C */  lui        $a1, %hi(D_800F090C)
/* A5E8 800E9DE8 0C09A524 */  addiu      $a1, $a1, %lo(D_800F090C)
/* A5EC 800E9DEC 0F80063C */  lui        $a2, %hi(D_800F0910)
/* A5F0 800E9DF0 1009C624 */  addiu      $a2, $a2, %lo(D_800F0910)
/* A5F4 800E9DF4 0F80013C */  lui        $at, %hi(D_800F0904)
/* A5F8 800E9DF8 04093FAC */  sw         $ra, %lo(D_800F0904)($at)
/* A5FC 800E9DFC DFA7030C */  jal        func_800E9F7C
/* A600 800E9E00 00000000 */   nop
/* A604 800E9E04 0F801F3C */  lui        $ra, %hi(D_800F0904)
/* A608 800E9E08 0409FF8F */  lw         $ra, %lo(D_800F0904)($ra)
/* A60C 800E9E0C 00000000 */  nop
/* A610 800E9E10 0F800C3C */  lui        $t4, %hi(D_800F090C)
/* A614 800E9E14 0C098C8D */  lw         $t4, %lo(D_800F090C)($t4)
/* A618 800E9E18 0F800D3C */  lui        $t5, %hi(D_800F0910)
/* A61C 800E9E1C 1009AD8D */  lw         $t5, %lo(D_800F0910)($t5)
/* A620 800E9E20 0000E88D */  lw         $t0, 0x0($t7)
/* A624 800E9E24 0400E98D */  lw         $t1, 0x4($t7)
/* A628 800E9E28 19000C01 */  multu      $t0, $t4
/* A62C 800E9E2C 0800EA8D */  lw         $t2, 0x8($t7)
/* A630 800E9E30 21106000 */  addu       $v0, $v1, $zero
/* A634 800E9E34 12400000 */  mflo       $t0
/* A638 800E9E38 0740A801 */  srav       $t0, $t0, $t5
/* A63C 800E9E3C 000008A7 */  sh         $t0, 0x0($t8)
/* A640 800E9E40 19002C01 */  multu      $t1, $t4
/* A644 800E9E44 12480000 */  mflo       $t1
/* A648 800E9E48 0748A901 */  srav       $t1, $t1, $t5
/* A64C 800E9E4C 020009A7 */  sh         $t1, 0x2($t8)
/* A650 800E9E50 19004C01 */  multu      $t2, $t4
/* A654 800E9E54 12500000 */  mflo       $t2
/* A658 800E9E58 0750AA01 */  srav       $t2, $t2, $t5
/* A65C 800E9E5C 0800E003 */  jr         $ra
/* A660 800E9E60 04000AA7 */   sh        $t2, 0x4($t8)
