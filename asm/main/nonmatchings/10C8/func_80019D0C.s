.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019D0C
/* 250C 80019D0C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2510 80019D10 1400BFAF */  sw         $ra, 0x14($sp)
/* 2514 80019D14 1000B0AF */  sw         $s0, 0x10($sp)
/* 2518 80019D18 0801028C */  lw         $v0, 0x108($zero)
/* 251C 80019D1C 0480033C */  lui        $v1, %hi(D_80047D58)
/* 2520 80019D20 587D638C */  lw         $v1, %lo(D_80047D58)($v1)
/* 2524 80019D24 0000508C */  lw         $s0, 0x0($v0)
/* 2528 80019D28 09006014 */  bnez       $v1, .L80019D50
/* 252C 80019D2C 01000234 */   ori       $v0, $zero, 0x1
/* 2530 80019D30 0480013C */  lui        $at, %hi(D_80047D58)
/* 2534 80019D34 587D22AC */  sw         $v0, %lo(D_80047D58)($at)
/* 2538 80019D38 2D67000C */  jal        func_80019CB4
/* 253C 80019D3C 00000000 */   nop
/* 2540 80019D40 0280023C */  lui        $v0, %hi(func_80019B1C)
/* 2544 80019D44 1C9B4224 */  addiu      $v0, $v0, %lo(func_80019B1C)
/* 2548 80019D48 55670008 */  j          .L80019D54
/* 254C 80019D4C 100002AE */   sw        $v0, 0x10($s0)
.L80019D50:
/* 2550 80019D50 100000AE */  sw         $zero, 0x10($s0)
.L80019D54:
/* 2554 80019D54 1400BF8F */  lw         $ra, 0x14($sp)
/* 2558 80019D58 1000B08F */  lw         $s0, 0x10($sp)
/* 255C 80019D5C 0800E003 */  jr         $ra
/* 2560 80019D60 1800BD27 */   addiu     $sp, $sp, 0x18
