.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D94
/* 10594 80027D94 03008290 */  lbu        $v0, 0x3($a0)
/* 10598 80027D98 0300A390 */  lbu        $v1, 0x3($a1)
/* 1059C 80027D9C 00000000 */  nop
/* 105A0 80027DA0 21104300 */  addu       $v0, $v0, $v1
/* 105A4 80027DA4 01004324 */  addiu      $v1, $v0, 0x1
/* 105A8 80027DA8 21006228 */  slti       $v0, $v1, 0x21
/* 105AC 80027DAC 03004010 */  beqz       $v0, .L80027DBC
/* 105B0 80027DB0 21100000 */   addu      $v0, $zero, $zero
/* 105B4 80027DB4 709F0008 */  j          .L80027DC0
/* 105B8 80027DB8 030083A0 */   sb        $v1, 0x3($a0)
.L80027DBC:
/* 105BC 80027DBC FFFF0224 */  addiu      $v0, $zero, -0x1
.L80027DC0:
/* 105C0 80027DC0 0800E003 */  jr         $ra
/* 105C4 80027DC4 00000000 */   nop
