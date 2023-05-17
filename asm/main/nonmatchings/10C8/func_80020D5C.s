.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020D5C
/* 955C 80020D5C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 9560 80020D60 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 9564 80020D64 1800B2AF */  sw         $s2, 0x18($sp)
/* 9568 80020D68 1400B1AF */  sw         $s1, 0x14($sp)
/* 956C 80020D6C 1000B0AF */  sw         $s0, 0x10($sp)
/* 9570 80020D70 2188A000 */  addu       $s1, $a1, $zero
/* 9574 80020D74 2190C000 */  addu       $s2, $a2, $zero
/* 9578 80020D78 002C0400 */  sll        $a1, $a0, 16
/* 957C 80020D7C 21202002 */  addu       $a0, $s1, $zero
/* 9580 80020D80 667A000C */  jal        func_8001E998
/* 9584 80020D84 032C0500 */   sra       $a1, $a1, 16
/* 9588 80020D88 00140200 */  sll        $v0, $v0, 16
/* 958C 80020D8C 03840200 */  sra        $s0, $v0, 16
/* 9590 80020D90 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 9594 80020D94 05000212 */  beq        $s0, $v0, .L80020DAC
/* 9598 80020D98 21202002 */   addu      $a0, $s1, $zero
/* 959C 80020D9C 21284002 */  addu       $a1, $s2, $zero
/* 95A0 80020DA0 A97B000C */  jal        func_8001EEA4
/* 95A4 80020DA4 21300002 */   addu      $a2, $s0, $zero
/* 95A8 80020DA8 21100002 */  addu       $v0, $s0, $zero
.L80020DAC:
/* 95AC 80020DAC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 95B0 80020DB0 1800B28F */  lw         $s2, 0x18($sp)
/* 95B4 80020DB4 1400B18F */  lw         $s1, 0x14($sp)
/* 95B8 80020DB8 1000B08F */  lw         $s0, 0x10($sp)
/* 95BC 80020DBC 0800E003 */  jr         $ra
/* 95C0 80020DC0 2000BD27 */   addiu     $sp, $sp, 0x20
