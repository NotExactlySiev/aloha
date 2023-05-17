.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EA848
/* B048 800EA848 00008F84 */  lh         $t7, 0x0($a0)
/* B04C 800EA84C 2110A000 */  addu       $v0, $a1, $zero
/* B050 800EA850 0E00E105 */  bgez       $t7, .L800EA88C
/* B054 800EA854 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B058 800EA858 23780F00 */  negu       $t7, $t7
/* B05C 800EA85C 0100E105 */  bgez       $t7, .L800EA864
/* B060 800EA860 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA864:
/* B064 800EA864 80C00F00 */  sll        $t8, $t7, 2
/* B068 800EA868 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B06C 800EA86C 21C83803 */  addu       $t9, $t9, $t8
/* B070 800EA870 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B074 800EA874 00000000 */  nop
/* B078 800EA878 00741900 */  sll        $t6, $t9, 16
/* B07C 800EA87C 03740E00 */  sra        $t6, $t6, 16
/* B080 800EA880 23580E00 */  negu       $t3, $t6
/* B084 800EA884 2BAA0308 */  j          .L800EA8AC
/* B088 800EA888 03441900 */   sra       $t0, $t9, 16
.L800EA88C:
/* B08C 800EA88C 80C01900 */  sll        $t8, $t9, 2
/* B090 800EA890 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B094 800EA894 21C83803 */  addu       $t9, $t9, $t8
/* B098 800EA898 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B09C 800EA89C 00000000 */  nop
/* B0A0 800EA8A0 00C41900 */  sll        $t8, $t9, 16
/* B0A4 800EA8A4 035C1800 */  sra        $t3, $t8, 16
/* B0A8 800EA8A8 03441900 */  sra        $t0, $t9, 16
.L800EA8AC:
/* B0AC 800EA8AC 02008F84 */  lh         $t7, 0x2($a0)
/* B0B0 800EA8B0 00000000 */  nop
/* B0B4 800EA8B4 0E00E105 */  bgez       $t7, .L800EA8F0
/* B0B8 800EA8B8 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B0BC 800EA8BC 23780F00 */  negu       $t7, $t7
/* B0C0 800EA8C0 0100E105 */  bgez       $t7, .L800EA8C8
/* B0C4 800EA8C4 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA8C8:
/* B0C8 800EA8C8 80C00F00 */  sll        $t8, $t7, 2
/* B0CC 800EA8CC 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B0D0 800EA8D0 21C83803 */  addu       $t9, $t9, $t8
/* B0D4 800EA8D4 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B0D8 800EA8D8 00000000 */  nop
/* B0DC 800EA8DC 00741900 */  sll        $t6, $t9, 16
/* B0E0 800EA8E0 03740E00 */  sra        $t6, $t6, 16
/* B0E4 800EA8E4 23600E00 */  negu       $t4, $t6
/* B0E8 800EA8E8 45AA0308 */  j          .L800EA914
/* B0EC 800EA8EC 034C1900 */   sra       $t1, $t9, 16
.L800EA8F0:
/* B0F0 800EA8F0 80C01900 */  sll        $t8, $t9, 2
/* B0F4 800EA8F4 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B0F8 800EA8F8 21C83803 */  addu       $t9, $t9, $t8
/* B0FC 800EA8FC 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B100 800EA900 00000000 */  nop
/* B104 800EA904 00741900 */  sll        $t6, $t9, 16
/* B108 800EA908 03640E00 */  sra        $t4, $t6, 16
/* B10C 800EA90C 23700C00 */  negu       $t6, $t4
/* B110 800EA910 034C1900 */  sra        $t1, $t9, 16
.L800EA914:
/* B114 800EA914 19006901 */  multu      $t3, $t1
/* B118 800EA918 04008F84 */  lh         $t7, 0x4($a0)
/* B11C 800EA91C 0C00AEA4 */  sh         $t6, 0xC($a1)
/* B120 800EA920 12C00000 */  mflo       $t8
/* B124 800EA924 03731800 */  sra        $t6, $t8, 12
/* B128 800EA928 00000000 */  nop
/* B12C 800EA92C 19000901 */  multu      $t0, $t1
/* B130 800EA930 0E00AEA4 */  sh         $t6, 0xE($a1)
/* B134 800EA934 1100E105 */  bgez       $t7, .L800EA97C
/* B138 800EA938 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* B13C 800EA93C 12C00000 */  mflo       $t8
/* B140 800EA940 03731800 */  sra        $t6, $t8, 12
/* B144 800EA944 1000AEA4 */  sh         $t6, 0x10($a1)
/* B148 800EA948 23780F00 */  negu       $t7, $t7
/* B14C 800EA94C 0100E105 */  bgez       $t7, .L800EA954
/* B150 800EA950 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA954:
/* B154 800EA954 80C00F00 */  sll        $t8, $t7, 2
/* B158 800EA958 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B15C 800EA95C 21C83803 */  addu       $t9, $t9, $t8
/* B160 800EA960 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B164 800EA964 00000000 */  nop
/* B168 800EA968 00C41900 */  sll        $t8, $t9, 16
/* B16C 800EA96C 03C41800 */  sra        $t8, $t8, 16
/* B170 800EA970 23681800 */  negu       $t5, $t8
/* B174 800EA974 6AAA0308 */  j          .L800EA9A8
/* B178 800EA978 03541900 */   sra       $t2, $t9, 16
.L800EA97C:
/* B17C 800EA97C 12780000 */  mflo       $t7
/* B180 800EA980 03730F00 */  sra        $t6, $t7, 12
/* B184 800EA984 1000AEA4 */  sh         $t6, 0x10($a1)
/* B188 800EA988 80C01900 */  sll        $t8, $t9, 2
/* B18C 800EA98C 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* B190 800EA990 21C83803 */  addu       $t9, $t9, $t8
/* B194 800EA994 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* B198 800EA998 00000000 */  nop
/* B19C 800EA99C 00C41900 */  sll        $t8, $t9, 16
/* B1A0 800EA9A0 036C1800 */  sra        $t5, $t8, 16
/* B1A4 800EA9A4 03541900 */  sra        $t2, $t9, 16
.L800EA9A8:
/* B1A8 800EA9A8 19002A01 */  multu      $t1, $t2
/* B1AC 800EA9AC 00000000 */  nop
/* B1B0 800EA9B0 00000000 */  nop
/* B1B4 800EA9B4 12780000 */  mflo       $t7
/* B1B8 800EA9B8 03730F00 */  sra        $t6, $t7, 12
/* B1BC 800EA9BC 0000AEA4 */  sh         $t6, 0x0($a1)
/* B1C0 800EA9C0 1900A901 */  multu      $t5, $t1
/* B1C4 800EA9C4 00000000 */  nop
/* B1C8 800EA9C8 00000000 */  nop
/* B1CC 800EA9CC 12780000 */  mflo       $t7
/* B1D0 800EA9D0 03730F00 */  sra        $t6, $t7, 12
/* B1D4 800EA9D4 00000000 */  nop
/* B1D8 800EA9D8 19006C01 */  multu      $t3, $t4
/* B1DC 800EA9DC 0600AEA4 */  sh         $t6, 0x6($a1)
/* B1E0 800EA9E0 00000000 */  nop
/* B1E4 800EA9E4 12780000 */  mflo       $t7
/* B1E8 800EA9E8 03C30F00 */  sra        $t8, $t7, 12
/* B1EC 800EA9EC 00000000 */  nop
/* B1F0 800EA9F0 19000A03 */  multu      $t8, $t2
/* B1F4 800EA9F4 00000000 */  nop
/* B1F8 800EA9F8 00000000 */  nop
/* B1FC 800EA9FC 12780000 */  mflo       $t7
/* B200 800EAA00 03730F00 */  sra        $t6, $t7, 12
/* B204 800EAA04 00000000 */  nop
/* B208 800EAA08 1900A801 */  multu      $t5, $t0
/* B20C 800EAA0C 00000000 */  nop
/* B210 800EAA10 00000000 */  nop
/* B214 800EAA14 12780000 */  mflo       $t7
/* B218 800EAA18 03CB0F00 */  sra        $t9, $t7, 12
/* B21C 800EAA1C 2378D901 */  subu       $t7, $t6, $t9
/* B220 800EAA20 19000A01 */  multu      $t0, $t2
/* B224 800EAA24 0200AFA4 */  sh         $t7, 0x2($a1)
/* B228 800EAA28 00000000 */  nop
/* B22C 800EAA2C 12700000 */  mflo       $t6
/* B230 800EAA30 037B0E00 */  sra        $t7, $t6, 12
/* B234 800EAA34 00000000 */  nop
/* B238 800EAA38 19000D03 */  multu      $t8, $t5
/* B23C 800EAA3C 00000000 */  nop
/* B240 800EAA40 00000000 */  nop
/* B244 800EAA44 12700000 */  mflo       $t6
/* B248 800EAA48 03CB0E00 */  sra        $t9, $t6, 12
/* B24C 800EAA4C 21702F03 */  addu       $t6, $t9, $t7
/* B250 800EAA50 19008801 */  multu      $t4, $t0
/* B254 800EAA54 0800AEA4 */  sh         $t6, 0x8($a1)
/* B258 800EAA58 00000000 */  nop
/* B25C 800EAA5C 12780000 */  mflo       $t7
/* B260 800EAA60 03C30F00 */  sra        $t8, $t7, 12
/* B264 800EAA64 00000000 */  nop
/* B268 800EAA68 19000A03 */  multu      $t8, $t2
/* B26C 800EAA6C 00000000 */  nop
/* B270 800EAA70 00000000 */  nop
/* B274 800EAA74 12780000 */  mflo       $t7
/* B278 800EAA78 03730F00 */  sra        $t6, $t7, 12
/* B27C 800EAA7C 00000000 */  nop
/* B280 800EAA80 19006D01 */  multu      $t3, $t5
/* B284 800EAA84 00000000 */  nop
/* B288 800EAA88 00000000 */  nop
/* B28C 800EAA8C 12780000 */  mflo       $t7
/* B290 800EAA90 03CB0F00 */  sra        $t9, $t7, 12
/* B294 800EAA94 2178D901 */  addu       $t7, $t6, $t9
/* B298 800EAA98 19006A01 */  multu      $t3, $t2
/* B29C 800EAA9C 0400AFA4 */  sh         $t7, 0x4($a1)
/* B2A0 800EAAA0 00000000 */  nop
/* B2A4 800EAAA4 12700000 */  mflo       $t6
/* B2A8 800EAAA8 037B0E00 */  sra        $t7, $t6, 12
/* B2AC 800EAAAC 00000000 */  nop
/* B2B0 800EAAB0 19000D03 */  multu      $t8, $t5
/* B2B4 800EAAB4 00000000 */  nop
/* B2B8 800EAAB8 00000000 */  nop
/* B2BC 800EAABC 12700000 */  mflo       $t6
/* B2C0 800EAAC0 03CB0E00 */  sra        $t9, $t6, 12
/* B2C4 800EAAC4 23702F03 */  subu       $t6, $t9, $t7
/* B2C8 800EAAC8 0A00AEA4 */  sh         $t6, 0xA($a1)
/* B2CC 800EAACC 0800E003 */  jr         $ra
/* B2D0 800EAAD0 00000000 */   nop
