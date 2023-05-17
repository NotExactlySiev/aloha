.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002237C
/* AB7C 8002237C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* AB80 80022380 1800BFAF */  sw         $ra, 0x18($sp)
/* AB84 80022384 1400B1AF */  sw         $s1, 0x14($sp)
/* AB88 80022388 1000B0AF */  sw         $s0, 0x10($sp)
/* AB8C 8002238C 21808000 */  addu       $s0, $a0, $zero
.L80022390:
/* AB90 80022390 1D88000C */  jal        func_80022074
/* AB94 80022394 21200002 */   addu      $a0, $s0, $zero
/* AB98 80022398 21884000 */  addu       $s1, $v0, $zero
/* AB9C 8002239C FCFF2012 */  beqz       $s1, .L80022390
/* ABA0 800223A0 00000000 */   nop
/* ABA4 800223A4 0800028E */  lw         $v0, 0x8($s0)
/* ABA8 800223A8 00000000 */  nop
/* ABAC 800223AC 01004238 */  xori       $v0, $v0, 0x1
/* ABB0 800223B0 2B100200 */  sltu       $v0, $zero, $v0
/* ABB4 800223B4 080002AE */  sw         $v0, 0x8($s0)
/* ABB8 800223B8 80100200 */  sll        $v0, $v0, 2
/* ABBC 800223BC 21105000 */  addu       $v0, $v0, $s0
/* ABC0 800223C0 0000458C */  lw         $a1, 0x0($v0)
/* ABC4 800223C4 5F8F000C */  jal        func_80023D7C
/* ABC8 800223C8 21202002 */   addu      $a0, $s1, $zero
/* ABCC 800223CC 26AA000C */  jal        func_8002A898
/* ABD0 800223D0 21202002 */   addu      $a0, $s1, $zero
/* ABD4 800223D4 21100000 */  addu       $v0, $zero, $zero
/* ABD8 800223D8 1800BF8F */  lw         $ra, 0x18($sp)
/* ABDC 800223DC 1400B18F */  lw         $s1, 0x14($sp)
/* ABE0 800223E0 1000B08F */  lw         $s0, 0x10($sp)
/* ABE4 800223E4 0800E003 */  jr         $ra
/* ABE8 800223E8 2000BD27 */   addiu     $sp, $sp, 0x20
