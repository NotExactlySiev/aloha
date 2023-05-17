.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002542C
/* DC2C 8002542C 0480023C */  lui        $v0, %hi(D_80046EE0)
/* DC30 80025430 E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* DC34 80025434 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DC38 80025438 1000B0AF */  sw         $s0, 0x10($sp)
/* DC3C 8002543C 21808000 */  addu       $s0, $a0, $zero
/* DC40 80025440 1400B1AF */  sw         $s1, 0x14($sp)
/* DC44 80025444 2188A000 */  addu       $s1, $a1, $zero
/* DC48 80025448 02004228 */  slti       $v0, $v0, 0x2
/* DC4C 8002544C 08004014 */  bnez       $v0, .L80025470
/* DC50 80025450 1800BFAF */   sw        $ra, 0x18($sp)
/* DC54 80025454 0480023C */  lui        $v0, %hi(D_80046EDC)
/* DC58 80025458 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* DC5C 8002545C 0280043C */  lui        $a0, %hi(D_80018348)
/* DC60 80025460 48838424 */  addiu      $a0, $a0, %lo(D_80018348)
/* DC64 80025464 21280002 */  addu       $a1, $s0, $zero
/* DC68 80025468 09F84000 */  jalr       $v0
/* DC6C 8002546C 21302002 */   addu      $a2, $s1, $zero
.L80025470:
/* DC70 80025470 FFFF3126 */  addiu      $s1, $s1, -0x1
/* DC74 80025474 0F002012 */  beqz       $s1, .L800254B4
/* DC78 80025478 FF00023C */   lui       $v0, (0xFFFFFF >> 16)
/* DC7C 8002547C FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* DC80 80025480 FFFFA534 */  ori        $a1, $a1, (0xFFFFFF & 0xFFFF)
/* DC84 80025484 00FF063C */  lui        $a2, (0xFF000000 >> 16)
.L80025488:
/* DC88 80025488 FFFF3126 */  addiu      $s1, $s1, -0x1
/* DC8C 8002548C 04000426 */  addiu      $a0, $s0, 0x4
/* DC90 80025490 030000A2 */  sb         $zero, 0x3($s0)
/* DC94 80025494 0000028E */  lw         $v0, 0x0($s0)
/* DC98 80025498 24188500 */  and        $v1, $a0, $a1
/* DC9C 8002549C 24104600 */  and        $v0, $v0, $a2
/* DCA0 800254A0 25104300 */  or         $v0, $v0, $v1
/* DCA4 800254A4 000002AE */  sw         $v0, 0x0($s0)
/* DCA8 800254A8 F7FF2016 */  bnez       $s1, .L80025488
/* DCAC 800254AC 21808000 */   addu      $s0, $a0, $zero
/* DCB0 800254B0 FF00023C */  lui        $v0, (0xFFFFFF >> 16)
.L800254B4:
/* DCB4 800254B4 FFFF4234 */  ori        $v0, $v0, (0xFFFFFF & 0xFFFF)
/* DCB8 800254B8 000002AE */  sw         $v0, 0x0($s0)
/* DCBC 800254BC 21100002 */  addu       $v0, $s0, $zero
/* DCC0 800254C0 1800BF8F */  lw         $ra, 0x18($sp)
/* DCC4 800254C4 1400B18F */  lw         $s1, 0x14($sp)
/* DCC8 800254C8 1000B08F */  lw         $s0, 0x10($sp)
/* DCCC 800254CC 2000BD27 */  addiu      $sp, $sp, 0x20
/* DCD0 800254D0 0800E003 */  jr         $ra
/* DCD4 800254D4 00000000 */   nop
