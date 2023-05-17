.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EAC6C
/* B46C 800EAC6C 21788000 */  addu       $t7, $a0, $zero
/* B470 800EAC70 2110A000 */  addu       $v0, $a1, $zero
/* B474 800EAC74 0D00E105 */  bgez       $t7, .L800EACAC
/* B478 800EAC78 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B47C 800EAC7C 23780F00 */  negu       $t7, $t7
/* B480 800EAC80 0100E105 */  bgez       $t7, .L800EAC88
/* B484 800EAC84 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EAC88:
/* B488 800EAC88 80C00F00 */  sll        $t8, $t7, 2
/* B48C 800EAC8C 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B490 800EAC90 21C83803 */  addu       $t9, $t9, $t8
/* B494 800EAC94 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B498 800EAC98 00000000 */  nop
/* B49C 800EAC9C 00741900 */  sll        $t6, $t9, 16
/* B4A0 800EACA0 034C0E00 */  sra        $t1, $t6, 16
/* B4A4 800EACA4 34AB0308 */  j          .L800EACD0
/* B4A8 800EACA8 03441900 */   sra       $t0, $t9, 16
.L800EACAC:
/* B4AC 800EACAC 80C01900 */  sll        $t8, $t9, 2
/* B4B0 800EACB0 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B4B4 800EACB4 21C83803 */  addu       $t9, $t9, $t8
/* B4B8 800EACB8 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B4BC 800EACBC 00000000 */  nop
/* B4C0 800EACC0 00C41900 */  sll        $t8, $t9, 16
/* B4C4 800EACC4 037C1800 */  sra        $t7, $t8, 16
/* B4C8 800EACC8 23480F00 */  negu       $t1, $t7
/* B4CC 800EACCC 03441900 */  sra        $t0, $t9, 16
.L800EACD0:
/* B4D0 800EACD0 0000AA84 */  lh         $t2, 0x0($a1)
/* B4D4 800EACD4 0C00AD84 */  lh         $t5, 0xC($a1)
/* B4D8 800EACD8 19000A01 */  multu      $t0, $t2
/* B4DC 800EACDC 0200AB84 */  lh         $t3, 0x2($a1)
/* B4E0 800EACE0 0E00AE84 */  lh         $t6, 0xE($a1)
/* B4E4 800EACE4 12C00000 */  mflo       $t8
/* B4E8 800EACE8 0400AC84 */  lh         $t4, 0x4($a1)
/* B4EC 800EACEC 1000AF84 */  lh         $t7, 0x10($a1)
/* B4F0 800EACF0 19002D01 */  multu      $t1, $t5
/* B4F4 800EACF4 00000000 */  nop
/* B4F8 800EACF8 00000000 */  nop
/* B4FC 800EACFC 12C80000 */  mflo       $t9
/* B500 800EAD00 23C81903 */  subu       $t9, $t8, $t9
/* B504 800EAD04 03C31900 */  sra        $t8, $t9, 12
/* B508 800EAD08 19000B01 */  multu      $t0, $t3
/* B50C 800EAD0C 0000B8A4 */  sh         $t8, 0x0($a1)
/* B510 800EAD10 00000000 */  nop
/* B514 800EAD14 12C00000 */  mflo       $t8
/* B518 800EAD18 00000000 */  nop
/* B51C 800EAD1C 00000000 */  nop
/* B520 800EAD20 19002E01 */  multu      $t1, $t6
/* B524 800EAD24 00000000 */  nop
/* B528 800EAD28 00000000 */  nop
/* B52C 800EAD2C 12C80000 */  mflo       $t9
/* B530 800EAD30 23C81903 */  subu       $t9, $t8, $t9
/* B534 800EAD34 03C31900 */  sra        $t8, $t9, 12
/* B538 800EAD38 19000C01 */  multu      $t0, $t4
/* B53C 800EAD3C 0200B8A4 */  sh         $t8, 0x2($a1)
/* B540 800EAD40 00000000 */  nop
/* B544 800EAD44 12C00000 */  mflo       $t8
/* B548 800EAD48 00000000 */  nop
/* B54C 800EAD4C 00000000 */  nop
/* B550 800EAD50 19002F01 */  multu      $t1, $t7
/* B554 800EAD54 00000000 */  nop
/* B558 800EAD58 00000000 */  nop
/* B55C 800EAD5C 12C80000 */  mflo       $t9
/* B560 800EAD60 23C81903 */  subu       $t9, $t8, $t9
/* B564 800EAD64 03C31900 */  sra        $t8, $t9, 12
/* B568 800EAD68 19002A01 */  multu      $t1, $t2
/* B56C 800EAD6C 0400B8A4 */  sh         $t8, 0x4($a1)
/* B570 800EAD70 00000000 */  nop
/* B574 800EAD74 12C00000 */  mflo       $t8
/* B578 800EAD78 00000000 */  nop
/* B57C 800EAD7C 00000000 */  nop
/* B580 800EAD80 19000D01 */  multu      $t0, $t5
/* B584 800EAD84 00000000 */  nop
/* B588 800EAD88 00000000 */  nop
/* B58C 800EAD8C 12C80000 */  mflo       $t9
/* B590 800EAD90 21C81903 */  addu       $t9, $t8, $t9
/* B594 800EAD94 03C31900 */  sra        $t8, $t9, 12
/* B598 800EAD98 19002B01 */  multu      $t1, $t3
/* B59C 800EAD9C 0C00B8A4 */  sh         $t8, 0xC($a1)
/* B5A0 800EADA0 00000000 */  nop
/* B5A4 800EADA4 12C00000 */  mflo       $t8
/* B5A8 800EADA8 00000000 */  nop
/* B5AC 800EADAC 00000000 */  nop
/* B5B0 800EADB0 19000E01 */  multu      $t0, $t6
/* B5B4 800EADB4 00000000 */  nop
/* B5B8 800EADB8 00000000 */  nop
/* B5BC 800EADBC 12C80000 */  mflo       $t9
/* B5C0 800EADC0 21C81903 */  addu       $t9, $t8, $t9
/* B5C4 800EADC4 03C31900 */  sra        $t8, $t9, 12
/* B5C8 800EADC8 19002C01 */  multu      $t1, $t4
/* B5CC 800EADCC 0E00B8A4 */  sh         $t8, 0xE($a1)
/* B5D0 800EADD0 00000000 */  nop
/* B5D4 800EADD4 12C00000 */  mflo       $t8
/* B5D8 800EADD8 00000000 */  nop
/* B5DC 800EADDC 00000000 */  nop
/* B5E0 800EADE0 19000F01 */  multu      $t0, $t7
/* B5E4 800EADE4 00000000 */  nop
/* B5E8 800EADE8 00000000 */  nop
/* B5EC 800EADEC 12C80000 */  mflo       $t9
/* B5F0 800EADF0 21C81903 */  addu       $t9, $t8, $t9
/* B5F4 800EADF4 03C31900 */  sra        $t8, $t9, 12
/* B5F8 800EADF8 1000B8A4 */  sh         $t8, 0x10($a1)
/* B5FC 800EADFC 0800E003 */  jr         $ra
/* B600 800EAE00 00000000 */   nop
