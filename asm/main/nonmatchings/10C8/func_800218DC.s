.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800218DC
/* A0DC 800218DC 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* A0E0 800218E0 A800BFAF */  sw         $ra, 0xA8($sp)
/* A0E4 800218E4 A400B5AF */  sw         $s5, 0xA4($sp)
/* A0E8 800218E8 A000B4AF */  sw         $s4, 0xA0($sp)
/* A0EC 800218EC 9C00B3AF */  sw         $s3, 0x9C($sp)
/* A0F0 800218F0 9800B2AF */  sw         $s2, 0x98($sp)
/* A0F4 800218F4 9400B1AF */  sw         $s1, 0x94($sp)
/* A0F8 800218F8 9000B0AF */  sw         $s0, 0x90($sp)
/* A0FC 800218FC 21808000 */  addu       $s0, $a0, $zero
/* A100 80021900 2190A000 */  addu       $s2, $a1, $zero
/* A104 80021904 21A0C000 */  addu       $s4, $a2, $zero
/* A108 80021908 C000B58F */  lw         $s5, 0xC0($sp)
/* A10C 8002190C 3280000C */  jal        func_800200C8
/* A110 80021910 2198E000 */   addu      $s3, $a3, $zero
/* A114 80021914 21884000 */  addu       $s1, $v0, $zero
/* A118 80021918 02002016 */  bnez       $s1, .L80021924
/* A11C 8002191C 00000000 */   nop
/* A120 80021920 21880000 */  addu       $s1, $zero, $zero
.L80021924:
/* A124 80021924 0300201E */  bgtz       $s1, .L80021934
/* A128 80021928 21200002 */   addu      $a0, $s0, $zero
/* A12C 8002192C 6E860008 */  j          .L800219B8
/* A130 80021930 21102002 */   addu      $v0, $s1, $zero
.L80021934:
/* A134 80021934 21284002 */  addu       $a1, $s2, $zero
/* A138 80021938 6880000C */  jal        func_800201A0
/* A13C 8002193C 01800634 */   ori       $a2, $zero, 0x8001
/* A140 80021940 21884000 */  addu       $s1, $v0, $zero
/* A144 80021944 FFFF0224 */  addiu      $v0, $zero, -0x1
/* A148 80021948 03002216 */  bne        $s1, $v0, .L80021958
/* A14C 8002194C 21202002 */   addu      $a0, $s1, $zero
/* A150 80021950 6E860008 */  j          .L800219B8
/* A154 80021954 21100000 */   addu      $v0, $zero, $zero
.L80021958:
/* A158 80021958 00026526 */  addiu      $a1, $s3, 0x200
/* A15C 8002195C 0581000C */  jal        func_80020414
/* A160 80021960 21300000 */   addu      $a2, $zero, $zero
/* A164 80021964 21202002 */  addu       $a0, $s1, $zero
/* A168 80021968 21288002 */  addu       $a1, $s4, $zero
/* A16C 8002196C EB80000C */  jal        func_800203AC
/* A170 80021970 2130A002 */   addu      $a2, $s5, $zero
.L80021974:
/* A174 80021974 177F000C */  jal        func_8001FC5C
/* A178 80021978 00000000 */   nop
/* A17C 8002197C 21804000 */  addu       $s0, $v0, $zero
/* A180 80021980 07000016 */  bnez       $s0, .L800219A0
/* A184 80021984 00000000 */   nop
/* A188 80021988 286C000C */  jal        func_8001B0A0
/* A18C 8002198C 00000000 */   nop
/* A190 80021990 2C86000C */  jal        func_800218B0
/* A194 80021994 00000000 */   nop
/* A198 80021998 5D860008 */  j          .L80021974
/* A19C 8002199C 00000000 */   nop
.L800219A0:
/* A1A0 800219A0 8280000C */  jal        func_80020208
/* A1A4 800219A4 21202002 */   addu      $a0, $s1, $zero
/* A1A8 800219A8 0400023A */  xori       $v0, $s0, 0x4
/* A1AC 800219AC 0100422C */  sltiu      $v0, $v0, 0x1
/* A1B0 800219B0 23100200 */  negu       $v0, $v0
/* A1B4 800219B4 2410A202 */  and        $v0, $s5, $v0
.L800219B8:
/* A1B8 800219B8 A800BF8F */  lw         $ra, 0xA8($sp)
/* A1BC 800219BC A400B58F */  lw         $s5, 0xA4($sp)
/* A1C0 800219C0 A000B48F */  lw         $s4, 0xA0($sp)
/* A1C4 800219C4 9C00B38F */  lw         $s3, 0x9C($sp)
/* A1C8 800219C8 9800B28F */  lw         $s2, 0x98($sp)
/* A1CC 800219CC 9400B18F */  lw         $s1, 0x94($sp)
/* A1D0 800219D0 9000B08F */  lw         $s0, 0x90($sp)
/* A1D4 800219D4 0800E003 */  jr         $ra
/* A1D8 800219D8 B000BD27 */   addiu     $sp, $sp, 0xB0
