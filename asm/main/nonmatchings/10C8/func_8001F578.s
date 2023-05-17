.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F578
/* 7D78 8001F578 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 7D7C 8001F57C 5000BFAF */  sw         $ra, 0x50($sp)
/* 7D80 8001F580 01000634 */  ori        $a2, $zero, 0x1
/* 7D84 8001F584 21280000 */  addu       $a1, $zero, $zero
/* 7D88 8001F588 FF7F0834 */  ori        $t0, $zero, 0x7FFF
/* 7D8C 8001F58C 02000734 */  ori        $a3, $zero, 0x2
/* 7D90 8001F590 0580033C */  lui        $v1, %hi(D_80052060)
/* 7D94 8001F594 60206324 */  addiu      $v1, $v1, %lo(D_80052060)
.L8001F598:
/* 7D98 8001F598 24108600 */  and        $v0, $a0, $a2
/* 7D9C 8001F59C 05004010 */  beqz       $v0, .L8001F5B4
/* 7DA0 8001F5A0 0100A524 */   addiu     $a1, $a1, 0x1
/* 7DA4 8001F5A4 0F0060A0 */  sb         $zero, 0xF($v1)
/* 7DA8 8001F5A8 0C0068A4 */  sh         $t0, 0xC($v1)
/* 7DAC 8001F5AC 060060A4 */  sh         $zero, 0x6($v1)
/* 7DB0 8001F5B0 0E0067A0 */  sb         $a3, 0xE($v1)
.L8001F5B4:
/* 7DB4 8001F5B4 10006324 */  addiu      $v1, $v1, 0x10
/* 7DB8 8001F5B8 1800A228 */  slti       $v0, $a1, 0x18
/* 7DBC 8001F5BC F6FF4014 */  bnez       $v0, .L8001F598
/* 7DC0 8001F5C0 40300600 */   sll       $a2, $a2, 1
/* 7DC4 8001F5C4 9478000C */  jal        func_8001E250
/* 7DC8 8001F5C8 00000000 */   nop
/* 7DCC 8001F5CC 5000BF8F */  lw         $ra, 0x50($sp)
/* 7DD0 8001F5D0 00000000 */  nop
/* 7DD4 8001F5D4 0800E003 */  jr         $ra
/* 7DD8 8001F5D8 5800BD27 */   addiu     $sp, $sp, 0x58
