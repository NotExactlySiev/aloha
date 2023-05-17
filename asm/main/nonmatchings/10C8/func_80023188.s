.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_80023188
/* B988 80023188 0280083C */  lui        $t0, %hi(D_80023470)
/* B98C 8002318C 70340825 */  addiu      $t0, $t0, %lo(D_80023470)
/* B990 80023190 08000934 */  ori        $t1, $zero, 0x8
.L80023194:
/* B994 80023194 00000A8D */  lw         $t2, 0x0($t0)
/* B998 80023198 00000000 */  nop
/* B99C 8002319C 06004011 */  beqz       $t2, .L800231B8
/* B9A0 800231A0 00000000 */   nop
/* B9A4 800231A4 FFFF2921 */  addi       $t1, $t1, -0x1 # handwritten instruction
/* B9A8 800231A8 FAFF2015 */  bnez       $t1, .L80023194
/* B9AC 800231AC 08000821 */   addi      $t0, $t0, 0x8 # handwritten instruction
/* B9B0 800231B0 04000010 */  b          .L800231C4
/* B9B4 800231B4 FFFF0924 */   addiu     $t1, $zero, -0x1
.L800231B8:
/* B9B8 800231B8 000004AD */  sw         $a0, 0x0($t0)
/* B9BC 800231BC 040005A5 */  sh         $a1, 0x4($t0)
/* B9C0 800231C0 060000A5 */  sh         $zero, 0x6($t0)
.L800231C4:
/* B9C4 800231C4 0800E003 */  jr         $ra
/* B9C8 800231C8 21102001 */   addu      $v0, $t1, $zero
