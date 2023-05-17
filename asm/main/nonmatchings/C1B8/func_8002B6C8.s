.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B6C8
/* 13EC8 8002B6C8 F8FFBD27 */  addiu      $sp, $sp, -0x8
/* 13ECC 8002B6CC 0800C010 */  beqz       $a2, .L8002B6F0
/* 13ED0 8002B6D0 21180000 */   addu      $v1, $zero, $zero
.L8002B6D4:
/* 13ED4 8002B6D4 0000A28C */  lw         $v0, 0x0($a1)
/* 13ED8 8002B6D8 0400A524 */  addiu      $a1, $a1, 0x4
/* 13EDC 8002B6DC 01006324 */  addiu      $v1, $v1, 0x1
/* 13EE0 8002B6E0 000082AC */  sw         $v0, 0x0($a0)
/* 13EE4 8002B6E4 2B106600 */  sltu       $v0, $v1, $a2
/* 13EE8 8002B6E8 FAFF4014 */  bnez       $v0, .L8002B6D4
/* 13EEC 8002B6EC 04008424 */   addiu     $a0, $a0, 0x4
.L8002B6F0:
/* 13EF0 8002B6F0 0800BD27 */  addiu      $sp, $sp, 0x8
/* 13EF4 8002B6F4 0800E003 */  jr         $ra
/* 13EF8 8002B6F8 00000000 */   nop
