.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EAE04
/* B604 800EAE04 21788000 */  addu       $t7, $a0, $zero
/* B608 800EAE08 2110A000 */  addu       $v0, $a1, $zero
/* B60C 800EAE0C 0E00E105 */  bgez       $t7, .L800EAE48
/* B610 800EAE10 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B614 800EAE14 23780F00 */  negu       $t7, $t7
/* B618 800EAE18 0100E105 */  bgez       $t7, .L800EAE20
/* B61C 800EAE1C FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EAE20:
/* B620 800EAE20 80C00F00 */  sll        $t8, $t7, 2
/* B624 800EAE24 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B628 800EAE28 21C83803 */  addu       $t9, $t9, $t8
/* B62C 800EAE2C 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B630 800EAE30 00000000 */  nop
/* B634 800EAE34 00741900 */  sll        $t6, $t9, 16
/* B638 800EAE38 03740E00 */  sra        $t6, $t6, 16
/* B63C 800EAE3C 23480E00 */  negu       $t1, $t6
/* B640 800EAE40 9AAB0308 */  j          .L800EAE68
/* B644 800EAE44 03441900 */   sra       $t0, $t9, 16
.L800EAE48:
/* B648 800EAE48 80C01900 */  sll        $t8, $t9, 2
/* B64C 800EAE4C 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B650 800EAE50 21C83803 */  addu       $t9, $t9, $t8
/* B654 800EAE54 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B658 800EAE58 00000000 */  nop
/* B65C 800EAE5C 00C41900 */  sll        $t8, $t9, 16
/* B660 800EAE60 034C1800 */  sra        $t1, $t8, 16
/* B664 800EAE64 03441900 */  sra        $t0, $t9, 16
.L800EAE68:
/* B668 800EAE68 0000AA84 */  lh         $t2, 0x0($a1)
/* B66C 800EAE6C 0600AD84 */  lh         $t5, 0x6($a1)
/* B670 800EAE70 19000A01 */  multu      $t0, $t2
/* B674 800EAE74 0200AB84 */  lh         $t3, 0x2($a1)
/* B678 800EAE78 0800AE84 */  lh         $t6, 0x8($a1)
/* B67C 800EAE7C 12C00000 */  mflo       $t8
/* B680 800EAE80 0400AC84 */  lh         $t4, 0x4($a1)
/* B684 800EAE84 0A00AF84 */  lh         $t7, 0xA($a1)
/* B688 800EAE88 19002D01 */  multu      $t1, $t5
/* B68C 800EAE8C 00000000 */  nop
/* B690 800EAE90 00000000 */  nop
/* B694 800EAE94 12C80000 */  mflo       $t9
/* B698 800EAE98 23C81903 */  subu       $t9, $t8, $t9
/* B69C 800EAE9C 03C31900 */  sra        $t8, $t9, 12
/* B6A0 800EAEA0 19000B01 */  multu      $t0, $t3
/* B6A4 800EAEA4 0000B8A4 */  sh         $t8, 0x0($a1)
/* B6A8 800EAEA8 00000000 */  nop
/* B6AC 800EAEAC 12C00000 */  mflo       $t8
/* B6B0 800EAEB0 00000000 */  nop
/* B6B4 800EAEB4 00000000 */  nop
/* B6B8 800EAEB8 19002E01 */  multu      $t1, $t6
/* B6BC 800EAEBC 00000000 */  nop
/* B6C0 800EAEC0 00000000 */  nop
/* B6C4 800EAEC4 12C80000 */  mflo       $t9
/* B6C8 800EAEC8 23C81903 */  subu       $t9, $t8, $t9
/* B6CC 800EAECC 03C31900 */  sra        $t8, $t9, 12
/* B6D0 800EAED0 19000C01 */  multu      $t0, $t4
/* B6D4 800EAED4 0200B8A4 */  sh         $t8, 0x2($a1)
/* B6D8 800EAED8 00000000 */  nop
/* B6DC 800EAEDC 12C00000 */  mflo       $t8
/* B6E0 800EAEE0 00000000 */  nop
/* B6E4 800EAEE4 00000000 */  nop
/* B6E8 800EAEE8 19002F01 */  multu      $t1, $t7
/* B6EC 800EAEEC 00000000 */  nop
/* B6F0 800EAEF0 00000000 */  nop
/* B6F4 800EAEF4 12C80000 */  mflo       $t9
/* B6F8 800EAEF8 23C81903 */  subu       $t9, $t8, $t9
/* B6FC 800EAEFC 03C31900 */  sra        $t8, $t9, 12
/* B700 800EAF00 19002A01 */  multu      $t1, $t2
/* B704 800EAF04 0400B8A4 */  sh         $t8, 0x4($a1)
/* B708 800EAF08 00000000 */  nop
/* B70C 800EAF0C 12C00000 */  mflo       $t8
/* B710 800EAF10 00000000 */  nop
/* B714 800EAF14 00000000 */  nop
/* B718 800EAF18 19000D01 */  multu      $t0, $t5
/* B71C 800EAF1C 00000000 */  nop
/* B720 800EAF20 00000000 */  nop
/* B724 800EAF24 12C80000 */  mflo       $t9
/* B728 800EAF28 21C81903 */  addu       $t9, $t8, $t9
/* B72C 800EAF2C 03C31900 */  sra        $t8, $t9, 12
/* B730 800EAF30 19002B01 */  multu      $t1, $t3
/* B734 800EAF34 0600B8A4 */  sh         $t8, 0x6($a1)
/* B738 800EAF38 00000000 */  nop
/* B73C 800EAF3C 12C00000 */  mflo       $t8
/* B740 800EAF40 00000000 */  nop
/* B744 800EAF44 00000000 */  nop
/* B748 800EAF48 19000E01 */  multu      $t0, $t6
/* B74C 800EAF4C 00000000 */  nop
/* B750 800EAF50 00000000 */  nop
/* B754 800EAF54 12C80000 */  mflo       $t9
/* B758 800EAF58 21C81903 */  addu       $t9, $t8, $t9
/* B75C 800EAF5C 03C31900 */  sra        $t8, $t9, 12
/* B760 800EAF60 19002C01 */  multu      $t1, $t4
/* B764 800EAF64 0800B8A4 */  sh         $t8, 0x8($a1)
/* B768 800EAF68 00000000 */  nop
/* B76C 800EAF6C 12C00000 */  mflo       $t8
/* B770 800EAF70 00000000 */  nop
/* B774 800EAF74 00000000 */  nop
/* B778 800EAF78 19000F01 */  multu      $t0, $t7
/* B77C 800EAF7C 00000000 */  nop
/* B780 800EAF80 00000000 */  nop
/* B784 800EAF84 12C80000 */  mflo       $t9
/* B788 800EAF88 21C81903 */  addu       $t9, $t8, $t9
/* B78C 800EAF8C 03C31900 */  sra        $t8, $t9, 12
/* B790 800EAF90 0A00B8A4 */  sh         $t8, 0xA($a1)
/* B794 800EAF94 0800E003 */  jr         $ra
/* B798 800EAF98 00000000 */   nop
