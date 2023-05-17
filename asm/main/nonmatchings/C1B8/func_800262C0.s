.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800262C0
/* EAC0 800262C0 03008014 */  bnez       $a0, .L800262D0
/* EAC4 800262C4 F0FFBD27 */   addiu     $sp, $sp, -0x10
/* EAC8 800262C8 CE980008 */  j          .L80026338
/* EACC 800262CC 21100000 */   addu      $v0, $zero, $zero
.L800262D0:
/* EAD0 800262D0 00008590 */  lbu        $a1, 0x0($a0)
/* EAD4 800262D4 00000000 */  nop
/* EAD8 800262D8 C2280500 */  srl        $a1, $a1, 3
/* EADC 800262DC 0000A5AF */  sw         $a1, 0x0($sp)
/* EAE0 800262E0 04008684 */  lh         $a2, 0x4($a0)
/* EAE4 800262E4 00000000 */  nop
/* EAE8 800262E8 23300600 */  negu       $a2, $a2
/* EAEC 800262EC FF00C630 */  andi       $a2, $a2, 0xFF
/* EAF0 800262F0 C3300600 */  sra        $a2, $a2, 3
/* EAF4 800262F4 0800A6AF */  sw         $a2, 0x8($sp)
/* EAF8 800262F8 02008290 */  lbu        $v0, 0x2($a0)
/* EAFC 800262FC 802A0500 */  sll        $a1, $a1, 10
/* EB00 80026300 C2100200 */  srl        $v0, $v0, 3
/* EB04 80026304 0400A2AF */  sw         $v0, 0x4($sp)
/* EB08 80026308 C0130200 */  sll        $v0, $v0, 15
/* EB0C 8002630C 06008384 */  lh         $v1, 0x6($a0)
/* EB10 80026310 00E2043C */  lui        $a0, (0xE2000000 >> 16)
/* EB14 80026314 2528A400 */  or         $a1, $a1, $a0
/* EB18 80026318 25104500 */  or         $v0, $v0, $a1
/* EB1C 8002631C 23180300 */  negu       $v1, $v1
/* EB20 80026320 FF006330 */  andi       $v1, $v1, 0xFF
/* EB24 80026324 C3180300 */  sra        $v1, $v1, 3
/* EB28 80026328 40210300 */  sll        $a0, $v1, 5
/* EB2C 8002632C 25104400 */  or         $v0, $v0, $a0
/* EB30 80026330 25104600 */  or         $v0, $v0, $a2
/* EB34 80026334 0C00A3AF */  sw         $v1, 0xC($sp)
.L80026338:
/* EB38 80026338 1000BD27 */  addiu      $sp, $sp, 0x10
/* EB3C 8002633C 0800E003 */  jr         $ra
/* EB40 80026340 00000000 */   nop
