.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002CC60
/* 15460 8002CC60 FFFFE730 */  andi       $a3, $a3, 0xFFFF
/* 15464 8002CC64 FFFFA530 */  andi       $a1, $a1, 0xFFFF
/* 15468 8002CC68 2110E500 */  addu       $v0, $a3, $a1
/* 1546C 8002CC6C 02004104 */  bgez       $v0, .L8002CC78
/* 15470 8002CC70 21408000 */   addu      $t0, $a0, $zero
/* 15474 8002CC74 07004224 */  addiu      $v0, $v0, 0x7
.L8002CC78:
/* 15478 8002CC78 C3100200 */  sra        $v0, $v0, 3
/* 1547C 8002CC7C 21284000 */  addu       $a1, $v0, $zero
/* 15480 8002CC80 10004228 */  slti       $v0, $v0, 0x10
/* 15484 8002CC84 08004014 */  bnez       $v0, .L8002CCA8
/* 15488 8002CC88 21180000 */   addu      $v1, $zero, $zero
.L8002CC8C:
/* 1548C 8002CC8C F0FFA224 */  addiu      $v0, $a1, -0x10
/* 15490 8002CC90 21284000 */  addu       $a1, $v0, $zero
/* 15494 8002CC94 00140200 */  sll        $v0, $v0, 16
/* 15498 8002CC98 03140200 */  sra        $v0, $v0, 16
/* 1549C 8002CC9C 10004228 */  slti       $v0, $v0, 0x10
/* 154A0 8002CCA0 FAFF4010 */  beqz       $v0, .L8002CC8C
/* 154A4 8002CCA4 01006324 */   addiu     $v1, $v1, 0x1
.L8002CCA8:
/* 154A8 8002CCA8 00140500 */  sll        $v0, $a1, 16
/* 154AC 8002CCAC 02004104 */  bgez       $v0, .L8002CCB8
/* 154B0 8002CCB0 AA2A043C */   lui       $a0, (0x2AAAAAAB >> 16)
/* 154B4 8002CCB4 21280000 */  addu       $a1, $zero, $zero
.L8002CCB8:
/* 154B8 8002CCB8 ABAA8434 */  ori        $a0, $a0, (0x2AAAAAAB & 0xFFFF)
/* 154BC 8002CCBC 3C00C224 */  addiu      $v0, $a2, 0x3C
/* 154C0 8002CCC0 23104800 */  subu       $v0, $v0, $t0
/* 154C4 8002CCC4 21106200 */  addu       $v0, $v1, $v0
/* 154C8 8002CCC8 00140200 */  sll        $v0, $v0, 16
/* 154CC 8002CCCC 031C0200 */  sra        $v1, $v0, 16
/* 154D0 8002CCD0 18006400 */  mult       $v1, $a0
/* 154D4 8002CCD4 C3170200 */  sra        $v0, $v0, 31
/* 154D8 8002CCD8 10200000 */  mfhi       $a0
/* 154DC 8002CCDC 43200400 */  sra        $a0, $a0, 1
/* 154E0 8002CCE0 23208200 */  subu       $a0, $a0, $v0
/* 154E4 8002CCE4 40100400 */  sll        $v0, $a0, 1
/* 154E8 8002CCE8 21104400 */  addu       $v0, $v0, $a0
/* 154EC 8002CCEC 80100200 */  sll        $v0, $v0, 2
/* 154F0 8002CCF0 23186200 */  subu       $v1, $v1, $v0
/* 154F4 8002CCF4 001C0300 */  sll        $v1, $v1, 16
/* 154F8 8002CCF8 031B0300 */  sra        $v1, $v1, 12
/* 154FC 8002CCFC 00140500 */  sll        $v0, $a1, 16
/* 15500 8002CD00 03140200 */  sra        $v0, $v0, 16
/* 15504 8002CD04 21186200 */  addu       $v1, $v1, $v0
/* 15508 8002CD08 40180300 */  sll        $v1, $v1, 1
/* 1550C 8002CD0C 0480013C */  lui        $at, %hi(D_80047450)
/* 15510 8002CD10 50742124 */  addiu      $at, $at, %lo(D_80047450)
/* 15514 8002CD14 21082300 */  addu       $at, $at, $v1
/* 15518 8002CD18 00002394 */  lhu        $v1, 0x0($at)
/* 1551C 8002CD1C FBFF8424 */  addiu      $a0, $a0, -0x5
/* 15520 8002CD20 00240400 */  sll        $a0, $a0, 16
/* 15524 8002CD24 03140400 */  sra        $v0, $a0, 16
/* 15528 8002CD28 03004018 */  blez       $v0, .L8002CD38
/* 1552C 8002CD2C 00000000 */   nop
/* 15530 8002CD30 53B30008 */  j          .L8002CD4C
/* 15534 8002CD34 04184300 */   sllv      $v1, $v1, $v0
.L8002CD38:
/* 15538 8002CD38 04004104 */  bgez       $v0, .L8002CD4C
/* 1553C 8002CD3C 00000000 */   nop
/* 15540 8002CD40 FFFF6330 */  andi       $v1, $v1, 0xFFFF
/* 15544 8002CD44 23100200 */  negu       $v0, $v0
/* 15548 8002CD48 07184300 */  srav       $v1, $v1, $v0
.L8002CD4C:
/* 1554C 8002CD4C 0800E003 */  jr         $ra
/* 15550 8002CD50 FFFF6230 */   andi      $v0, $v1, 0xFFFF
