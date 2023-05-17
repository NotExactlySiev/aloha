.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FB78
/* 8378 8001FB78 1F008230 */  andi       $v0, $a0, 0x1F
/* 837C 8001FB7C 00110200 */  sll        $v0, $v0, 4
/* 8380 8001FB80 0580033C */  lui        $v1, %hi(D_80052060)
/* 8384 8001FB84 60206324 */  addiu      $v1, $v1, %lo(D_80052060)
/* 8388 8001FB88 21284300 */  addu       $a1, $v0, $v1
/* 838C 8001FB8C 0F00A390 */  lbu        $v1, 0xF($a1)
/* 8390 8001FB90 01000234 */  ori        $v0, $zero, 0x1
/* 8394 8001FB94 08006214 */  bne        $v1, $v0, .L8001FBB8
/* 8398 8001FB98 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 839C 8001FB9C 0400A384 */  lh         $v1, 0x4($a1)
/* 83A0 8001FBA0 E07F8230 */  andi       $v0, $a0, 0x7FE0
/* 83A4 8001FBA4 03006214 */  bne        $v1, $v0, .L8001FBB4
/* 83A8 8001FBA8 00140400 */   sll       $v0, $a0, 16
/* 83AC 8001FBAC EE7E0008 */  j          .L8001FBB8
/* 83B0 8001FBB0 03140200 */   sra       $v0, $v0, 16
.L8001FBB4:
/* 83B4 8001FBB4 FFFF0224 */  addiu      $v0, $zero, -0x1
.L8001FBB8:
/* 83B8 8001FBB8 0800E003 */  jr         $ra
/* 83BC 8001FBBC 00000000 */   nop
