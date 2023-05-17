.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022474
/* AC74 80022474 30F7BD27 */  addiu      $sp, $sp, -0x8D0
/* AC78 80022478 CC08BFAF */  sw         $ra, 0x8CC($sp)
/* AC7C 8002247C C808B4AF */  sw         $s4, 0x8C8($sp)
/* AC80 80022480 C408B3AF */  sw         $s3, 0x8C4($sp)
/* AC84 80022484 C008B2AF */  sw         $s2, 0x8C0($sp)
/* AC88 80022488 BC08B1AF */  sw         $s1, 0x8BC($sp)
/* AC8C 8002248C B808B0AF */  sw         $s0, 0x8B8($sp)
/* AC90 80022490 21808000 */  addu       $s0, $a0, $zero
/* AC94 80022494 2198A000 */  addu       $s3, $a1, $zero
/* AC98 80022498 21A0C000 */  addu       $s4, $a2, $zero
/* AC9C 8002249C 0580013C */  lui        $at, %hi(D_8004803C)
/* ACA0 800224A0 3C8020AC */  sw         $zero, %lo(D_8004803C)($at)
/* ACA4 800224A4 D58A000C */  jal        func_80022B54
/* ACA8 800224A8 21200000 */   addu      $a0, $zero, $zero
/* ACAC 800224AC 078B000C */  jal        func_80022C1C
/* ACB0 800224B0 21200000 */   addu      $a0, $zero, $zero
/* ACB4 800224B4 9000A427 */  addiu      $a0, $sp, 0x90
/* ACB8 800224B8 0671000C */  jal        func_8001C418
/* ACBC 800224BC 21280002 */   addu      $a1, $s0, $zero
/* ACC0 800224C0 DC004010 */  beqz       $v0, .L80022834
/* ACC4 800224C4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* ACC8 800224C8 0580103C */  lui        $s0, %hi(D_8004801C)
/* ACCC 800224CC 1C801026 */  addiu      $s0, $s0, %lo(D_8004801C)
/* ACD0 800224D0 9300A28B */  lwl        $v0, 0x93($sp)
/* ACD4 800224D4 9000A29B */  lwr        $v0, 0x90($sp)
/* ACD8 800224D8 00000000 */  nop
/* ACDC 800224DC 030002AA */  swl        $v0, 0x3($s0)
/* ACE0 800224E0 000002BA */  swr        $v0, 0x0($s0)
/* ACE4 800224E4 0580043C */  lui        $a0, %hi(D_80052218)
/* ACE8 800224E8 18228424 */  addiu      $a0, $a0, %lo(D_80052218)
/* ACEC 800224EC BD87000C */  jal        func_80021EF4
/* ACF0 800224F0 21286002 */   addu      $a1, $s3, $zero
/* ACF4 800224F4 21200002 */  addu       $a0, $s0, $zero
/* ACF8 800224F8 0280063C */  lui        $a2, %hi(func_80022260)
/* ACFC 800224FC 6022C624 */  addiu      $a2, $a2, %lo(func_80022260)
/* AD00 80022500 F487000C */  jal        func_80021FD0
/* AD04 80022504 21286002 */   addu      $a1, $s3, $zero
/* AD08 80022508 0580043C */  lui        $a0, %hi(D_80052218)
/* AD0C 8002250C 18228424 */  addiu      $a0, $a0, %lo(D_80052218)
/* AD10 80022510 DF88000C */  jal        func_8002237C
/* AD14 80022514 00000000 */   nop
.L80022518:
/* AD18 80022518 0580023C */  lui        $v0, %hi(D_80052220)
/* AD1C 8002251C 2022428C */  lw         $v0, %lo(D_80052220)($v0)
/* AD20 80022520 00000000 */  nop
/* AD24 80022524 80100200 */  sll        $v0, $v0, 2
/* AD28 80022528 0580013C */  lui        $at, %hi(D_80052218)
/* AD2C 8002252C 18222124 */  addiu      $at, $at, %lo(D_80052218)
/* AD30 80022530 21082200 */  addu       $at, $at, $v0
/* AD34 80022534 0000248C */  lw         $a0, 0x0($at)
/* AD38 80022538 708F000C */  jal        func_80023DC0
/* AD3C 8002253C 03000534 */   ori       $a1, $zero, 0x3
/* AD40 80022540 0580033C */  lui        $v1, %hi(D_80052240)
/* AD44 80022544 40226384 */  lh         $v1, %lo(D_80052240)($v1)
/* AD48 80022548 0580023C */  lui        $v0, %hi(D_80052242)
/* AD4C 8002254C 42224284 */  lh         $v0, %lo(D_80052242)($v0)
/* AD50 80022550 00000000 */  nop
/* AD54 80022554 18006200 */  mult       $v1, $v0
/* AD58 80022558 12280000 */  mflo       $a1
/* AD5C 8002255C 00000000 */  nop
/* AD60 80022560 0580043C */  lui        $a0, %hi(D_80052224)
/* AD64 80022564 2422848C */  lw         $a0, %lo(D_80052224)($a0)
/* AD68 80022568 C2170500 */  srl        $v0, $a1, 31
/* AD6C 8002256C 2128A200 */  addu       $a1, $a1, $v0
/* AD70 80022570 8F8F000C */  jal        func_80023E3C
/* AD74 80022574 43280500 */   sra       $a1, $a1, 1
/* AD78 80022578 0580103C */  lui        $s0, %hi(D_80052218)
/* AD7C 8002257C 18221026 */  addiu      $s0, $s0, %lo(D_80052218)
/* AD80 80022580 DF88000C */  jal        func_8002237C
/* AD84 80022584 21200002 */   addu      $a0, $s0, $zero
/* AD88 80022588 21200002 */  addu       $a0, $s0, $zero
/* AD8C 8002258C FB88000C */  jal        func_800223EC
/* AD90 80022590 21280000 */   addu      $a1, $zero, $zero
/* AD94 80022594 29008012 */  beqz       $s4, .L8002263C
/* AD98 80022598 00000000 */   nop
/* AD9C 8002259C 09F88002 */  jalr       $s4
/* ADA0 800225A0 00000000 */   nop
/* ADA4 800225A4 01000334 */  ori        $v1, $zero, 0x1
/* ADA8 800225A8 24004314 */  bne        $v0, $v1, .L8002263C
/* ADAC 800225AC 21200000 */   addu      $a0, $zero, $zero
/* ADB0 800225B0 81A0000C */  jal        func_80028204
/* ADB4 800225B4 21280000 */   addu      $a1, $zero, $zero
/* ADB8 800225B8 80000234 */  ori        $v0, $zero, 0x80
/* ADBC 800225BC A800A2A3 */  sb         $v0, 0xA8($sp)
/* ADC0 800225C0 01001034 */  ori        $s0, $zero, 0x1
/* ADC4 800225C4 0E000434 */  ori        $a0, $zero, 0xE
.L800225C8:
/* ADC8 800225C8 A800A527 */  addiu      $a1, $sp, 0xA8
/* ADCC 800225CC 60A1000C */  jal        func_80028580
/* ADD0 800225D0 21300000 */   addu      $a2, $zero, $zero
/* ADD4 800225D4 FCFF5014 */  bne        $v0, $s0, .L800225C8
/* ADD8 800225D8 0E000434 */   ori       $a0, $zero, 0xE
/* ADDC 800225DC 01000434 */  ori        $a0, $zero, 0x1
/* ADE0 800225E0 89A0000C */  jal        func_80028224
/* ADE4 800225E4 21280000 */   addu      $a1, $zero, $zero
/* ADE8 800225E8 01000334 */  ori        $v1, $zero, 0x1
/* ADEC 800225EC 03004314 */  bne        $v0, $v1, .L800225FC
/* ADF0 800225F0 B000A427 */   addiu     $a0, $sp, 0xB0
/* ADF4 800225F4 BBA1000C */  jal        func_800286EC
/* ADF8 800225F8 00020534 */   ori       $a1, $zero, 0x200
.L800225FC:
/* ADFC 800225FC B08F000C */  jal        func_80023EC0
/* AE00 80022600 21200000 */   addu      $a0, $zero, $zero
/* AE04 80022604 C4A1000C */  jal        func_80028710
/* AE08 80022608 21200000 */   addu      $a0, $zero, $zero
/* AE0C 8002260C B9A0000C */  jal        func_800282E4
/* AE10 80022610 21200000 */   addu      $a0, $zero, $zero
/* AE14 80022614 B7A9000C */  jal        func_8002A6DC
/* AE18 80022618 01001034 */   ori       $s0, $zero, 0x1
/* AE1C 8002261C 09000434 */  ori        $a0, $zero, 0x9
.L80022620:
/* AE20 80022620 21280000 */  addu       $a1, $zero, $zero
/* AE24 80022624 60A1000C */  jal        func_80028580
/* AE28 80022628 21300000 */   addu      $a2, $zero, $zero
/* AE2C 8002262C FCFF5014 */  bne        $v0, $s0, .L80022620
/* AE30 80022630 09000434 */   ori       $a0, $zero, 0x9
/* AE34 80022634 0D8A0008 */  j          .L80022834
/* AE38 80022638 01000234 */   ori       $v0, $zero, 0x1
.L8002263C:
/* AE3C 8002263C 0580023C */  lui        $v0, %hi(D_80048024)
/* AE40 80022640 2480428C */  lw         $v0, %lo(D_80048024)($v0)
/* AE44 80022644 01001234 */  ori        $s2, $zero, 0x1
/* AE48 80022648 24005214 */  bne        $v0, $s2, .L800226DC
/* AE4C 8002264C 21200000 */   addu      $a0, $zero, $zero
/* AE50 80022650 81A0000C */  jal        func_80028204
/* AE54 80022654 21280000 */   addu      $a1, $zero, $zero
/* AE58 80022658 80000234 */  ori        $v0, $zero, 0x80
/* AE5C 8002265C A800A2A3 */  sb         $v0, 0xA8($sp)
/* AE60 80022660 01001034 */  ori        $s0, $zero, 0x1
/* AE64 80022664 0E000434 */  ori        $a0, $zero, 0xE
.L80022668:
/* AE68 80022668 A800A527 */  addiu      $a1, $sp, 0xA8
/* AE6C 8002266C 60A1000C */  jal        func_80028580
/* AE70 80022670 21300000 */   addu      $a2, $zero, $zero
/* AE74 80022674 FCFF5014 */  bne        $v0, $s0, .L80022668
/* AE78 80022678 0E000434 */   ori       $a0, $zero, 0xE
/* AE7C 8002267C 01000434 */  ori        $a0, $zero, 0x1
/* AE80 80022680 89A0000C */  jal        func_80028224
/* AE84 80022684 21280000 */   addu      $a1, $zero, $zero
/* AE88 80022688 01000334 */  ori        $v1, $zero, 0x1
/* AE8C 8002268C 03004314 */  bne        $v0, $v1, .L8002269C
/* AE90 80022690 B000A427 */   addiu     $a0, $sp, 0xB0
/* AE94 80022694 BBA1000C */  jal        func_800286EC
/* AE98 80022698 00020534 */   ori       $a1, $zero, 0x200
.L8002269C:
/* AE9C 8002269C B08F000C */  jal        func_80023EC0
/* AEA0 800226A0 21200000 */   addu      $a0, $zero, $zero
/* AEA4 800226A4 C4A1000C */  jal        func_80028710
/* AEA8 800226A8 21200000 */   addu      $a0, $zero, $zero
/* AEAC 800226AC B9A0000C */  jal        func_800282E4
/* AEB0 800226B0 21200000 */   addu      $a0, $zero, $zero
/* AEB4 800226B4 B7A9000C */  jal        func_8002A6DC
/* AEB8 800226B8 01001034 */   ori       $s0, $zero, 0x1
/* AEBC 800226BC 09000434 */  ori        $a0, $zero, 0x9
.L800226C0:
/* AEC0 800226C0 21280000 */  addu       $a1, $zero, $zero
/* AEC4 800226C4 60A1000C */  jal        func_80028580
/* AEC8 800226C8 21300000 */   addu      $a2, $zero, $zero
/* AECC 800226CC FCFF5014 */  bne        $v0, $s0, .L800226C0
/* AED0 800226D0 09000434 */   ori       $a0, $zero, 0x9
/* AED4 800226D4 0D8A0008 */  j          .L80022834
/* AED8 800226D8 21100000 */   addu      $v0, $zero, $zero
.L800226DC:
/* AEDC 800226DC 0580103C */  lui        $s0, %hi(D_80052238)
/* AEE0 800226E0 3822108E */  lw         $s0, %lo(D_80052238)($s0)
/* AEE4 800226E4 00000000 */  nop
/* AEE8 800226E8 0100103A */  xori       $s0, $s0, 0x1
/* AEEC 800226EC DD8A000C */  jal        func_80022B74
/* AEF0 800226F0 2B801000 */   sltu      $s0, $zero, $s0
/* AEF4 800226F4 C0881000 */  sll        $s1, $s0, 3
/* AEF8 800226F8 0580013C */  lui        $at, %hi(D_80052228)
/* AEFC 800226FC 28222124 */  addiu      $at, $at, %lo(D_80052228)
/* AF00 80022700 21083100 */  addu       $at, $at, $s1
/* AF04 80022704 00002584 */  lh         $a1, 0x0($at)
/* AF08 80022708 0580013C */  lui        $at, %hi(D_8005222A)
/* AF0C 8002270C 2A222124 */  addiu      $at, $at, %lo(D_8005222A)
/* AF10 80022710 21083100 */  addu       $at, $at, $s1
/* AF14 80022714 00002684 */  lh         $a2, 0x0($at)
/* AF18 80022718 0580013C */  lui        $at, %hi(D_8005222C)
/* AF1C 8002271C 2C222124 */  addiu      $at, $at, %lo(D_8005222C)
/* AF20 80022720 21083100 */  addu       $at, $at, $s1
/* AF24 80022724 00002784 */  lh         $a3, 0x0($at)
/* AF28 80022728 0580013C */  lui        $at, %hi(D_8005222E)
/* AF2C 8002272C 2E222124 */  addiu      $at, $at, %lo(D_8005222E)
/* AF30 80022730 21083100 */  addu       $at, $at, $s1
/* AF34 80022734 00002284 */  lh         $v0, 0x0($at)
/* AF38 80022738 1800A427 */  addiu      $a0, $sp, 0x18
/* AF3C 8002273C 558A000C */  jal        func_80022954
/* AF40 80022740 1000A2AF */   sw        $v0, 0x10($sp)
/* AF44 80022744 7566000C */  jal        func_800199D4
/* AF48 80022748 00000000 */   nop
/* AF4C 8002274C 05005214 */  bne        $v0, $s2, .L80022764
/* AF50 80022750 3000B027 */   addiu     $s0, $sp, 0x30
/* AF54 80022754 2200A297 */  lhu        $v0, 0x22($sp)
/* AF58 80022758 00000000 */  nop
/* AF5C 8002275C 18004224 */  addiu      $v0, $v0, 0x18
/* AF60 80022760 2200A2A7 */  sh         $v0, 0x22($sp)
.L80022764:
/* AF64 80022764 0580013C */  lui        $at, %hi(D_80052228)
/* AF68 80022768 28222124 */  addiu      $at, $at, %lo(D_80052228)
/* AF6C 8002276C 21083100 */  addu       $at, $at, $s1
/* AF70 80022770 00002584 */  lh         $a1, 0x0($at)
/* AF74 80022774 0580013C */  lui        $at, %hi(D_8005222A)
/* AF78 80022778 2A222124 */  addiu      $at, $at, %lo(D_8005222A)
/* AF7C 8002277C 21083100 */  addu       $at, $at, $s1
/* AF80 80022780 00002684 */  lh         $a2, 0x0($at)
/* AF84 80022784 0580013C */  lui        $at, %hi(D_8005222C)
/* AF88 80022788 2C222124 */  addiu      $at, $at, %lo(D_8005222C)
/* AF8C 8002278C 21083100 */  addu       $at, $at, $s1
/* AF90 80022790 00002784 */  lh         $a3, 0x0($at)
/* AF94 80022794 0580013C */  lui        $at, %hi(D_8005222E)
/* AF98 80022798 2E222124 */  addiu      $at, $at, %lo(D_8005222E)
/* AF9C 8002279C 21083100 */  addu       $at, $at, $s1
/* AFA0 800227A0 00002284 */  lh         $v0, 0x0($at)
/* AFA4 800227A4 21200002 */  addu       $a0, $s0, $zero
/* AFA8 800227A8 46A0000C */  jal        func_80028118
/* AFAC 800227AC 1000A2AF */   sw        $v0, 0x10($sp)
/* AFB0 800227B0 0300628A */  lwl        $v0, 0x3($s3)
/* AFB4 800227B4 0000629A */  lwr        $v0, 0x0($s3)
/* AFB8 800227B8 0700638A */  lwl        $v1, 0x7($s3)
/* AFBC 800227BC 0400639A */  lwr        $v1, 0x4($s3)
/* AFC0 800227C0 2300A2AB */  swl        $v0, 0x23($sp)
/* AFC4 800227C4 2000A2BB */  swr        $v0, 0x20($sp)
/* AFC8 800227C8 2700A3AB */  swl        $v1, 0x27($sp)
/* AFCC 800227CC 2400A3BB */  swr        $v1, 0x24($sp)
/* AFD0 800227D0 1C00A387 */  lh         $v1, 0x1C($sp)
/* AFD4 800227D4 03000234 */  ori        $v0, $zero, 0x3
/* AFD8 800227D8 40180300 */  sll        $v1, $v1, 1
/* AFDC 800227DC 1A006200 */  div        $zero, $v1, $v0
/* AFE0 800227E0 02004014 */  bnez       $v0, .L800227EC
/* AFE4 800227E4 00000000 */   nop
/* AFE8 800227E8 0D000700 */  break      7
.L800227EC:
/* AFEC 800227EC FFFF0124 */  addiu      $at, $zero, -0x1
/* AFF0 800227F0 04004114 */  bne        $v0, $at, .L80022804
/* AFF4 800227F4 0080013C */   lui       $at, (0x80000000 >> 16)
/* AFF8 800227F8 02006114 */  bne        $v1, $at, .L80022804
/* AFFC 800227FC 00000000 */   nop
/* B000 80022800 0D000600 */  break      6
.L80022804:
/* B004 80022804 12180000 */  mflo       $v1
/* B008 80022808 1800A427 */  addiu      $a0, $sp, 0x18
/* B00C 8002280C 01000234 */  ori        $v0, $zero, 0x1
/* B010 80022810 2900A2A3 */  sb         $v0, 0x29($sp)
/* B014 80022814 A88A000C */  jal        func_80022AA0
/* B018 80022818 1C00A3A7 */   sh        $v1, 0x1C($sp)
/* B01C 8002281C 8A95000C */  jal        func_80025628
/* B020 80022820 21200002 */   addu      $a0, $s0, $zero
/* B024 80022824 078B000C */  jal        func_80022C1C
/* B028 80022828 01000434 */   ori       $a0, $zero, 0x1
/* B02C 8002282C 46890008 */  j          .L80022518
/* B030 80022830 00000000 */   nop
.L80022834:
/* B034 80022834 CC08BF8F */  lw         $ra, 0x8CC($sp)
/* B038 80022838 C808B48F */  lw         $s4, 0x8C8($sp)
/* B03C 8002283C C408B38F */  lw         $s3, 0x8C4($sp)
/* B040 80022840 C008B28F */  lw         $s2, 0x8C0($sp)
/* B044 80022844 BC08B18F */  lw         $s1, 0x8BC($sp)
/* B048 80022848 B808B08F */  lw         $s0, 0x8B8($sp)
/* B04C 8002284C 0800E003 */  jr         $ra
/* B050 80022850 D008BD27 */   addiu     $sp, $sp, 0x8D0
