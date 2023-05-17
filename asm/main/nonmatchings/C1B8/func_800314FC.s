.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800314FC
/* 19CFC 800314FC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 19D00 80031500 06008010 */  beqz       $a0, .L8003151C
/* 19D04 80031504 1800BFAF */   sw        $ra, 0x18($sp)
/* 19D08 80031508 01000234 */  ori        $v0, $zero, 0x1
/* 19D0C 8003150C 04008214 */  bne        $a0, $v0, .L80031520
/* 19D10 80031510 00000000 */   nop
/* 19D14 80031514 49C50008 */  j          .L80031524
/* 19D18 80031518 1000A0AF */   sw        $zero, 0x10($sp)
.L8003151C:
/* 19D1C 8003151C 01000234 */  ori        $v0, $zero, 0x1
.L80031520:
/* 19D20 80031520 1000A2AF */  sw         $v0, 0x10($sp)
.L80031524:
/* 19D24 80031524 21000534 */  ori        $a1, $zero, 0x21
/* 19D28 80031528 0480013C */  lui        $at, %hi(D_800478E0)
/* 19D2C 8003152C E07824AC */  sw         $a0, %lo(D_800478E0)($at)
/* 19D30 80031530 0480043C */  lui        $a0, %hi(D_800478DC)
/* 19D34 80031534 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 19D38 80031538 10BD000C */  jal        func_8002F440
/* 19D3C 8003153C 1000A627 */   addiu     $a2, $sp, 0x10
/* 19D40 80031540 1800BF8F */  lw         $ra, 0x18($sp)
/* 19D44 80031544 2000BD27 */  addiu      $sp, $sp, 0x20
/* 19D48 80031548 0800E003 */  jr         $ra
/* 19D4C 8003154C 00000000 */   nop
