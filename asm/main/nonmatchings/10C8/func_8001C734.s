.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C734
/* 4F34 8001C734 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4F38 8001C738 1400BFAF */  sw         $ra, 0x14($sp)
/* 4F3C 8001C73C B268000C */  jal        func_8001A2C8
/* 4F40 8001C740 1000B0AF */   sw        $s0, 0x10($sp)
/* 4F44 8001C744 21804000 */  addu       $s0, $v0, $zero
/* 4F48 8001C748 02000234 */  ori        $v0, $zero, 0x2
/* 4F4C 8001C74C 08000216 */  bne        $s0, $v0, .L8001C770
/* 4F50 8001C750 21100002 */   addu      $v0, $s0, $zero
/* 4F54 8001C754 09000434 */  ori        $a0, $zero, 0x9
/* 4F58 8001C758 21280000 */  addu       $a1, $zero, $zero
/* 4F5C 8001C75C 5B68000C */  jal        func_8001A16C
/* 4F60 8001C760 21300000 */   addu      $a2, $zero, $zero
/* 4F64 8001C764 2166000C */  jal        func_80019884
/* 4F68 8001C768 00000000 */   nop
/* 4F6C 8001C76C 21100002 */  addu       $v0, $s0, $zero
.L8001C770:
/* 4F70 8001C770 1400BF8F */  lw         $ra, 0x14($sp)
/* 4F74 8001C774 1000B08F */  lw         $s0, 0x10($sp)
/* 4F78 8001C778 0800E003 */  jr         $ra
/* 4F7C 8001C77C 1800BD27 */   addiu     $sp, $sp, 0x18
