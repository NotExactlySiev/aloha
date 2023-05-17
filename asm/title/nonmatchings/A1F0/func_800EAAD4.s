.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EAAD4
/* B2D4 800EAAD4 21788000 */  addu       $t7, $a0, $zero
/* B2D8 800EAAD8 2110A000 */  addu       $v0, $a1, $zero
/* B2DC 800EAADC 0E00E105 */  bgez       $t7, .L800EAB18
/* B2E0 800EAAE0 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B2E4 800EAAE4 23780F00 */  negu       $t7, $t7
/* B2E8 800EAAE8 0100E105 */  bgez       $t7, .L800EAAF0
/* B2EC 800EAAEC FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EAAF0:
/* B2F0 800EAAF0 80C00F00 */  sll        $t8, $t7, 2
/* B2F4 800EAAF4 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B2F8 800EAAF8 21C83803 */  addu       $t9, $t9, $t8
/* B2FC 800EAAFC 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B300 800EAB00 00000000 */  nop
/* B304 800EAB04 00741900 */  sll        $t6, $t9, 16
/* B308 800EAB08 03740E00 */  sra        $t6, $t6, 16
/* B30C 800EAB0C 23480E00 */  negu       $t1, $t6
/* B310 800EAB10 CEAA0308 */  j          .L800EAB38
/* B314 800EAB14 03441900 */   sra       $t0, $t9, 16
.L800EAB18:
/* B318 800EAB18 80C01900 */  sll        $t8, $t9, 2
/* B31C 800EAB1C 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B320 800EAB20 21C83803 */  addu       $t9, $t9, $t8
/* B324 800EAB24 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B328 800EAB28 00000000 */  nop
/* B32C 800EAB2C 00C41900 */  sll        $t8, $t9, 16
/* B330 800EAB30 034C1800 */  sra        $t1, $t8, 16
/* B334 800EAB34 03441900 */  sra        $t0, $t9, 16
.L800EAB38:
/* B338 800EAB38 0600AA84 */  lh         $t2, 0x6($a1)
/* B33C 800EAB3C 0C00AD84 */  lh         $t5, 0xC($a1)
/* B340 800EAB40 19000A01 */  multu      $t0, $t2
/* B344 800EAB44 0800AB84 */  lh         $t3, 0x8($a1)
/* B348 800EAB48 0E00AE84 */  lh         $t6, 0xE($a1)
/* B34C 800EAB4C 12C00000 */  mflo       $t8
/* B350 800EAB50 0A00AC84 */  lh         $t4, 0xA($a1)
/* B354 800EAB54 1000AF84 */  lh         $t7, 0x10($a1)
/* B358 800EAB58 19002D01 */  multu      $t1, $t5
/* B35C 800EAB5C 00000000 */  nop
/* B360 800EAB60 00000000 */  nop
/* B364 800EAB64 12C80000 */  mflo       $t9
/* B368 800EAB68 23C81903 */  subu       $t9, $t8, $t9
/* B36C 800EAB6C 03C31900 */  sra        $t8, $t9, 12
/* B370 800EAB70 19000B01 */  multu      $t0, $t3
/* B374 800EAB74 0600B8A4 */  sh         $t8, 0x6($a1)
/* B378 800EAB78 00000000 */  nop
/* B37C 800EAB7C 12C00000 */  mflo       $t8
/* B380 800EAB80 00000000 */  nop
/* B384 800EAB84 00000000 */  nop
/* B388 800EAB88 19002E01 */  multu      $t1, $t6
/* B38C 800EAB8C 00000000 */  nop
/* B390 800EAB90 00000000 */  nop
/* B394 800EAB94 12C80000 */  mflo       $t9
/* B398 800EAB98 23C81903 */  subu       $t9, $t8, $t9
/* B39C 800EAB9C 03C31900 */  sra        $t8, $t9, 12
/* B3A0 800EABA0 19000C01 */  multu      $t0, $t4
/* B3A4 800EABA4 0800B8A4 */  sh         $t8, 0x8($a1)
/* B3A8 800EABA8 00000000 */  nop
/* B3AC 800EABAC 12C00000 */  mflo       $t8
/* B3B0 800EABB0 00000000 */  nop
/* B3B4 800EABB4 00000000 */  nop
/* B3B8 800EABB8 19002F01 */  multu      $t1, $t7
/* B3BC 800EABBC 00000000 */  nop
/* B3C0 800EABC0 00000000 */  nop
/* B3C4 800EABC4 12C80000 */  mflo       $t9
/* B3C8 800EABC8 23C81903 */  subu       $t9, $t8, $t9
/* B3CC 800EABCC 03C31900 */  sra        $t8, $t9, 12
/* B3D0 800EABD0 19002A01 */  multu      $t1, $t2
/* B3D4 800EABD4 0A00B8A4 */  sh         $t8, 0xA($a1)
/* B3D8 800EABD8 00000000 */  nop
/* B3DC 800EABDC 12C00000 */  mflo       $t8
/* B3E0 800EABE0 00000000 */  nop
/* B3E4 800EABE4 00000000 */  nop
/* B3E8 800EABE8 19000D01 */  multu      $t0, $t5
/* B3EC 800EABEC 00000000 */  nop
/* B3F0 800EABF0 00000000 */  nop
/* B3F4 800EABF4 12C80000 */  mflo       $t9
/* B3F8 800EABF8 21C81903 */  addu       $t9, $t8, $t9
/* B3FC 800EABFC 03C31900 */  sra        $t8, $t9, 12
/* B400 800EAC00 19002B01 */  multu      $t1, $t3
/* B404 800EAC04 0C00B8A4 */  sh         $t8, 0xC($a1)
/* B408 800EAC08 00000000 */  nop
/* B40C 800EAC0C 12C00000 */  mflo       $t8
/* B410 800EAC10 00000000 */  nop
/* B414 800EAC14 00000000 */  nop
/* B418 800EAC18 19000E01 */  multu      $t0, $t6
/* B41C 800EAC1C 00000000 */  nop
/* B420 800EAC20 00000000 */  nop
/* B424 800EAC24 12C80000 */  mflo       $t9
/* B428 800EAC28 21C81903 */  addu       $t9, $t8, $t9
/* B42C 800EAC2C 03C31900 */  sra        $t8, $t9, 12
/* B430 800EAC30 19002C01 */  multu      $t1, $t4
/* B434 800EAC34 0E00B8A4 */  sh         $t8, 0xE($a1)
/* B438 800EAC38 00000000 */  nop
/* B43C 800EAC3C 12C00000 */  mflo       $t8
/* B440 800EAC40 00000000 */  nop
/* B444 800EAC44 00000000 */  nop
/* B448 800EAC48 19000F01 */  multu      $t0, $t7
/* B44C 800EAC4C 00000000 */  nop
/* B450 800EAC50 00000000 */  nop
/* B454 800EAC54 12C80000 */  mflo       $t9
/* B458 800EAC58 21C81903 */  addu       $t9, $t8, $t9
/* B45C 800EAC5C 03C31900 */  sra        $t8, $t9, 12
/* B460 800EAC60 1000B8A4 */  sh         $t8, 0x10($a1)
/* B464 800EAC64 0800E003 */  jr         $ra
/* B468 800EAC68 00000000 */   nop
