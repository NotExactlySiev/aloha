.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80023144
/* B944 80023144 0280083C */  lui        $t0, %hi(D_80023370)
/* B948 80023148 70330825 */  addiu      $t0, $t0, %lo(D_80023370)
/* B94C 8002314C 20000934 */  ori        $t1, $zero, 0x20
.L80023150:
/* B950 80023150 00000A8D */  lw         $t2, 0x0($t0)
/* B954 80023154 00000000 */  nop
/* B958 80023158 06004011 */  beqz       $t2, .L80023174
/* B95C 8002315C 00000000 */   nop
/* B960 80023160 FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* B964 80023164 FAFF2015 */  bnez       $t1, .L80023150
/* B968 80023168 08000821 */   addi      $t0, $t0, 0x8 # handwritten instruction
/* B96C 8002316C 04000010 */  b          .L80023180
/* B970 80023170 FFFF0924 */   addiu     $t1, $zero, -0x1
.L80023174:
/* B974 80023174 000004AD */  sw         $a0, 0x0($t0)
/* B978 80023178 040005A5 */  sh         $a1, 0x4($t0)
/* B97C 8002317C 060000A5 */  sh         $zero, 0x6($t0)
.L80023180:
/* B980 80023180 0800E003 */  jr         $ra
/* B984 80023184 21102001 */   addu      $v0, $t1, $zero
