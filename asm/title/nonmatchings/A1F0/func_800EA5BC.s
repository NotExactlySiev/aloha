.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EA5BC
/* ADBC 800EA5BC 00008F84 */  lh         $t7, 0x0($a0)
/* ADC0 800EA5C0 2110A000 */  addu       $v0, $a1, $zero
/* ADC4 800EA5C4 0E00E105 */  bgez       $t7, .L800EA600
/* ADC8 800EA5C8 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* ADCC 800EA5CC 23780F00 */  negu       $t7, $t7
/* ADD0 800EA5D0 0100E105 */  bgez       $t7, .L800EA5D8
/* ADD4 800EA5D4 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA5D8:
/* ADD8 800EA5D8 80C00F00 */  sll        $t8, $t7, 2
/* ADDC 800EA5DC 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* ADE0 800EA5E0 21C83803 */  addu       $t9, $t9, $t8
/* ADE4 800EA5E4 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* ADE8 800EA5E8 00000000 */  nop
/* ADEC 800EA5EC 00741900 */  sll        $t6, $t9, 16
/* ADF0 800EA5F0 03740E00 */  sra        $t6, $t6, 16
/* ADF4 800EA5F4 23580E00 */  negu       $t3, $t6
/* ADF8 800EA5F8 89A90308 */  j          .L800EA624
/* ADFC 800EA5FC 03441900 */   sra       $t0, $t9, 16
.L800EA600:
/* AE00 800EA600 80C01900 */  sll        $t8, $t9, 2
/* AE04 800EA604 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AE08 800EA608 21C83803 */  addu       $t9, $t9, $t8
/* AE0C 800EA60C 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AE10 800EA610 00000000 */  nop
/* AE14 800EA614 00C41900 */  sll        $t8, $t9, 16
/* AE18 800EA618 035C1800 */  sra        $t3, $t8, 16
/* AE1C 800EA61C 23700B00 */  negu       $t6, $t3
/* AE20 800EA620 03441900 */  sra        $t0, $t9, 16
.L800EA624:
/* AE24 800EA624 02008F84 */  lh         $t7, 0x2($a0)
/* AE28 800EA628 00000000 */  nop
/* AE2C 800EA62C 0E00E105 */  bgez       $t7, .L800EA668
/* AE30 800EA630 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* AE34 800EA634 23780F00 */  negu       $t7, $t7
/* AE38 800EA638 0100E105 */  bgez       $t7, .L800EA640
/* AE3C 800EA63C FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA640:
/* AE40 800EA640 80C00F00 */  sll        $t8, $t7, 2
/* AE44 800EA644 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AE48 800EA648 21C83803 */  addu       $t9, $t9, $t8
/* AE4C 800EA64C 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AE50 800EA650 00000000 */  nop
/* AE54 800EA654 00C41900 */  sll        $t8, $t9, 16
/* AE58 800EA658 03C41800 */  sra        $t8, $t8, 16
/* AE5C 800EA65C 23601800 */  negu       $t4, $t8
/* AE60 800EA660 A2A90308 */  j          .L800EA688
/* AE64 800EA664 034C1900 */   sra       $t1, $t9, 16
.L800EA668:
/* AE68 800EA668 80C01900 */  sll        $t8, $t9, 2
/* AE6C 800EA66C 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AE70 800EA670 21C83803 */  addu       $t9, $t9, $t8
/* AE74 800EA674 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AE78 800EA678 00000000 */  nop
/* AE7C 800EA67C 00C41900 */  sll        $t8, $t9, 16
/* AE80 800EA680 03641800 */  sra        $t4, $t8, 16
/* AE84 800EA684 034C1900 */  sra        $t1, $t9, 16
.L800EA688:
/* AE88 800EA688 19008801 */  multu      $t4, $t0
/* AE8C 800EA68C 04008F84 */  lh         $t7, 0x4($a0)
/* AE90 800EA690 0A00AEA4 */  sh         $t6, 0xA($a1)
/* AE94 800EA694 12C00000 */  mflo       $t8
/* AE98 800EA698 03731800 */  sra        $t6, $t8, 12
/* AE9C 800EA69C 00000000 */  nop
/* AEA0 800EA6A0 19002801 */  multu      $t1, $t0
/* AEA4 800EA6A4 0400AEA4 */  sh         $t6, 0x4($a1)
/* AEA8 800EA6A8 1100E105 */  bgez       $t7, .L800EA6F0
/* AEAC 800EA6AC FF0FF931 */   andi      $t9, $t7, 0xFFF
/* AEB0 800EA6B0 12C00000 */  mflo       $t8
/* AEB4 800EA6B4 03731800 */  sra        $t6, $t8, 12
/* AEB8 800EA6B8 1000AEA4 */  sh         $t6, 0x10($a1)
/* AEBC 800EA6BC 23780F00 */  negu       $t7, $t7
/* AEC0 800EA6C0 0100E105 */  bgez       $t7, .L800EA6C8
/* AEC4 800EA6C4 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA6C8:
/* AEC8 800EA6C8 80C00F00 */  sll        $t8, $t7, 2
/* AECC 800EA6CC 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AED0 800EA6D0 21C83803 */  addu       $t9, $t9, $t8
/* AED4 800EA6D4 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AED8 800EA6D8 00000000 */  nop
/* AEDC 800EA6DC 00C41900 */  sll        $t8, $t9, 16
/* AEE0 800EA6E0 03C41800 */  sra        $t8, $t8, 16
/* AEE4 800EA6E4 23681800 */  negu       $t5, $t8
/* AEE8 800EA6E8 C7A90308 */  j          .L800EA71C
/* AEEC 800EA6EC 03541900 */   sra       $t2, $t9, 16
.L800EA6F0:
/* AEF0 800EA6F0 12780000 */  mflo       $t7
/* AEF4 800EA6F4 03730F00 */  sra        $t6, $t7, 12
/* AEF8 800EA6F8 1000AEA4 */  sh         $t6, 0x10($a1)
/* AEFC 800EA6FC 80C01900 */  sll        $t8, $t9, 2
/* AF00 800EA700 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AF04 800EA704 21C83803 */  addu       $t9, $t9, $t8
/* AF08 800EA708 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AF0C 800EA70C 00000000 */  nop
/* AF10 800EA710 00C41900 */  sll        $t8, $t9, 16
/* AF14 800EA714 036C1800 */  sra        $t5, $t8, 16
/* AF18 800EA718 03541900 */  sra        $t2, $t9, 16
.L800EA71C:
/* AF1C 800EA71C 1900A801 */  multu      $t5, $t0
/* AF20 800EA720 00000000 */  nop
/* AF24 800EA724 00000000 */  nop
/* AF28 800EA728 12780000 */  mflo       $t7
/* AF2C 800EA72C 03730F00 */  sra        $t6, $t7, 12
/* AF30 800EA730 0600AEA4 */  sh         $t6, 0x6($a1)
/* AF34 800EA734 19004801 */  multu      $t2, $t0
/* AF38 800EA738 00000000 */  nop
/* AF3C 800EA73C 00000000 */  nop
/* AF40 800EA740 12780000 */  mflo       $t7
/* AF44 800EA744 03730F00 */  sra        $t6, $t7, 12
/* AF48 800EA748 00000000 */  nop
/* AF4C 800EA74C 19008B01 */  multu      $t4, $t3
/* AF50 800EA750 0800AEA4 */  sh         $t6, 0x8($a1)
/* AF54 800EA754 00000000 */  nop
/* AF58 800EA758 12780000 */  mflo       $t7
/* AF5C 800EA75C 03C30F00 */  sra        $t8, $t7, 12
/* AF60 800EA760 00000000 */  nop
/* AF64 800EA764 19000D03 */  multu      $t8, $t5
/* AF68 800EA768 00000000 */  nop
/* AF6C 800EA76C 00000000 */  nop
/* AF70 800EA770 12780000 */  mflo       $t7
/* AF74 800EA774 03730F00 */  sra        $t6, $t7, 12
/* AF78 800EA778 00000000 */  nop
/* AF7C 800EA77C 19002A01 */  multu      $t1, $t2
/* AF80 800EA780 00000000 */  nop
/* AF84 800EA784 00000000 */  nop
/* AF88 800EA788 12780000 */  mflo       $t7
/* AF8C 800EA78C 03CB0F00 */  sra        $t9, $t7, 12
/* AF90 800EA790 21782E03 */  addu       $t7, $t9, $t6
/* AF94 800EA794 19002D01 */  multu      $t1, $t5
/* AF98 800EA798 0000AFA4 */  sh         $t7, 0x0($a1)
/* AF9C 800EA79C 00000000 */  nop
/* AFA0 800EA7A0 12700000 */  mflo       $t6
/* AFA4 800EA7A4 03CB0E00 */  sra        $t9, $t6, 12
/* AFA8 800EA7A8 23781900 */  negu       $t7, $t9
/* AFAC 800EA7AC 19000A03 */  multu      $t8, $t2
/* AFB0 800EA7B0 00000000 */  nop
/* AFB4 800EA7B4 00000000 */  nop
/* AFB8 800EA7B8 12700000 */  mflo       $t6
/* AFBC 800EA7BC 03CB0E00 */  sra        $t9, $t6, 12
/* AFC0 800EA7C0 2170F901 */  addu       $t6, $t7, $t9
/* AFC4 800EA7C4 19002B01 */  multu      $t1, $t3
/* AFC8 800EA7C8 0200AEA4 */  sh         $t6, 0x2($a1)
/* AFCC 800EA7CC 00000000 */  nop
/* AFD0 800EA7D0 12780000 */  mflo       $t7
/* AFD4 800EA7D4 03C30F00 */  sra        $t8, $t7, 12
/* AFD8 800EA7D8 00000000 */  nop
/* AFDC 800EA7DC 19000A03 */  multu      $t8, $t2
/* AFE0 800EA7E0 00000000 */  nop
/* AFE4 800EA7E4 00000000 */  nop
/* AFE8 800EA7E8 12780000 */  mflo       $t7
/* AFEC 800EA7EC 03730F00 */  sra        $t6, $t7, 12
/* AFF0 800EA7F0 00000000 */  nop
/* AFF4 800EA7F4 19008D01 */  multu      $t4, $t5
/* AFF8 800EA7F8 00000000 */  nop
/* AFFC 800EA7FC 00000000 */  nop
/* B000 800EA800 12780000 */  mflo       $t7
/* B004 800EA804 03CB0F00 */  sra        $t9, $t7, 12
/* B008 800EA808 21782E03 */  addu       $t7, $t9, $t6
/* B00C 800EA80C 19008A01 */  multu      $t4, $t2
/* B010 800EA810 0E00AFA4 */  sh         $t7, 0xE($a1)
/* B014 800EA814 00000000 */  nop
/* B018 800EA818 12700000 */  mflo       $t6
/* B01C 800EA81C 03CB0E00 */  sra        $t9, $t6, 12
/* B020 800EA820 23781900 */  negu       $t7, $t9
/* B024 800EA824 19000D03 */  multu      $t8, $t5
/* B028 800EA828 00000000 */  nop
/* B02C 800EA82C 00000000 */  nop
/* B030 800EA830 12700000 */  mflo       $t6
/* B034 800EA834 03CB0E00 */  sra        $t9, $t6, 12
/* B038 800EA838 2170F901 */  addu       $t6, $t7, $t9
/* B03C 800EA83C 0C00AEA4 */  sh         $t6, 0xC($a1)
/* B040 800EA840 0800E003 */  jr         $ra
/* B044 800EA844 00000000 */   nop
