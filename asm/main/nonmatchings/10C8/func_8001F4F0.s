.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F4F0
/* 7CF0 8001F4F0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 7CF4 8001F4F4 5400BFAF */  sw         $ra, 0x54($sp)
/* 7CF8 8001F4F8 5000B0AF */  sw         $s0, 0x50($sp)
/* 7CFC 8001F4FC 21808000 */  addu       $s0, $a0, $zero
/* 7D00 8001F500 01000534 */  ori        $a1, $zero, 0x1
/* 7D04 8001F504 21200000 */  addu       $a0, $zero, $zero
/* 7D08 8001F508 FFFF0734 */  ori        $a3, $zero, 0xFFFF
/* 7D0C 8001F50C 02000634 */  ori        $a2, $zero, 0x2
/* 7D10 8001F510 0580033C */  lui        $v1, %hi(D_80052060)
/* 7D14 8001F514 60206324 */  addiu      $v1, $v1, %lo(D_80052060)
.L8001F518:
/* 7D18 8001F518 24100502 */  and        $v0, $s0, $a1
/* 7D1C 8001F51C 05004010 */  beqz       $v0, .L8001F534
/* 7D20 8001F520 01008424 */   addiu     $a0, $a0, 0x1
/* 7D24 8001F524 0F0060A0 */  sb         $zero, 0xF($v1)
/* 7D28 8001F528 0C0067A4 */  sh         $a3, 0xC($v1)
/* 7D2C 8001F52C 060060A4 */  sh         $zero, 0x6($v1)
/* 7D30 8001F530 0E0066A0 */  sb         $a2, 0xE($v1)
.L8001F534:
/* 7D34 8001F534 10006324 */  addiu      $v1, $v1, 0x10
/* 7D38 8001F538 18008228 */  slti       $v0, $a0, 0x18
/* 7D3C 8001F53C F6FF4014 */  bnez       $v0, .L8001F518
/* 7D40 8001F540 40280500 */   sll       $a1, $a1, 1
/* 7D44 8001F544 03000234 */  ori        $v0, $zero, 0x3
/* 7D48 8001F548 1400A2AF */  sw         $v0, 0x14($sp)
/* 7D4C 8001F54C 1000B0AF */  sw         $s0, 0x10($sp)
/* 7D50 8001F550 1800A0A7 */  sh         $zero, 0x18($sp)
/* 7D54 8001F554 1A00A0A7 */  sh         $zero, 0x1A($sp)
/* 7D58 8001F558 3378000C */  jal        func_8001E0CC
/* 7D5C 8001F55C 1000A427 */   addiu     $a0, $sp, 0x10
/* 7D60 8001F560 8B78000C */  jal        func_8001E22C
/* 7D64 8001F564 21200002 */   addu      $a0, $s0, $zero
/* 7D68 8001F568 5400BF8F */  lw         $ra, 0x54($sp)
/* 7D6C 8001F56C 5000B08F */  lw         $s0, 0x50($sp)
/* 7D70 8001F570 0800E003 */  jr         $ra
/* 7D74 8001F574 5800BD27 */   addiu     $sp, $sp, 0x58
