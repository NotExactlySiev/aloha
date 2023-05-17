.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800219DC
/* A1DC 800219DC 50FFBD27 */  addiu      $sp, $sp, -0xB0
/* A1E0 800219E0 AC00BFAF */  sw         $ra, 0xAC($sp)
/* A1E4 800219E4 A800B6AF */  sw         $s6, 0xA8($sp)
/* A1E8 800219E8 A400B5AF */  sw         $s5, 0xA4($sp)
/* A1EC 800219EC A000B4AF */  sw         $s4, 0xA0($sp)
/* A1F0 800219F0 9C00B3AF */  sw         $s3, 0x9C($sp)
/* A1F4 800219F4 9800B2AF */  sw         $s2, 0x98($sp)
/* A1F8 800219F8 9400B1AF */  sw         $s1, 0x94($sp)
/* A1FC 800219FC 9000B0AF */  sw         $s0, 0x90($sp)
/* A200 80021A00 21808000 */  addu       $s0, $a0, $zero
/* A204 80021A04 2190A000 */  addu       $s2, $a1, $zero
/* A208 80021A08 21A8C000 */  addu       $s5, $a2, $zero
/* A20C 80021A0C C000B68F */  lw         $s6, 0xC0($sp)
/* A210 80021A10 C400B38F */  lw         $s3, 0xC4($sp)
/* A214 80021A14 3280000C */  jal        func_800200C8
/* A218 80021A18 21A0E000 */   addu      $s4, $a3, $zero
/* A21C 80021A1C 21884000 */  addu       $s1, $v0, $zero
/* A220 80021A20 02002016 */  bnez       $s1, .L80021A2C
/* A224 80021A24 00000000 */   nop
/* A228 80021A28 21880000 */  addu       $s1, $zero, $zero
.L80021A2C:
/* A22C 80021A2C 0300201E */  bgtz       $s1, .L80021A3C
/* A230 80021A30 21200002 */   addu      $a0, $s0, $zero
/* A234 80021A34 E9860008 */  j          .L80021BA4
/* A238 80021A38 21102002 */   addu      $v0, $s1, $zero
.L80021A3C:
/* A23C 80021A3C 21284002 */  addu       $a1, $s2, $zero
/* A240 80021A40 6880000C */  jal        func_800201A0
/* A244 80021A44 03800634 */   ori       $a2, $zero, 0x8003
/* A248 80021A48 21884000 */  addu       $s1, $v0, $zero
/* A24C 80021A4C FFFF0224 */  addiu      $v0, $zero, -0x1
/* A250 80021A50 03002216 */  bne        $s1, $v0, .L80021A60
/* A254 80021A54 21900000 */   addu      $s2, $zero, $zero
/* A258 80021A58 E9860008 */  j          .L80021BA4
/* A25C 80021A5C 21100000 */   addu      $v0, $zero, $zero
.L80021A60:
/* A260 80021A60 21202002 */  addu       $a0, $s1, $zero
/* A264 80021A64 21280000 */  addu       $a1, $zero, $zero
/* A268 80021A68 0581000C */  jal        func_80020414
/* A26C 80021A6C 21300000 */   addu      $a2, $zero, $zero
/* A270 80021A70 21202002 */  addu       $a0, $s1, $zero
/* A274 80021A74 1000A527 */  addiu      $a1, $sp, 0x10
/* A278 80021A78 EB80000C */  jal        func_800203AC
/* A27C 80021A7C 80000634 */   ori       $a2, $zero, 0x80
.L80021A80:
/* A280 80021A80 177F000C */  jal        func_8001FC5C
/* A284 80021A84 00000000 */   nop
/* A288 80021A88 07004014 */  bnez       $v0, .L80021AA8
/* A28C 80021A8C 53000234 */   ori       $v0, $zero, 0x53
/* A290 80021A90 286C000C */  jal        func_8001B0A0
/* A294 80021A94 00000000 */   nop
/* A298 80021A98 2C86000C */  jal        func_800218B0
/* A29C 80021A9C 00000000 */   nop
/* A2A0 80021AA0 A0860008 */  j          .L80021A80
/* A2A4 80021AA4 00000000 */   nop
.L80021AA8:
/* A2A8 80021AA8 1000A393 */  lbu        $v1, 0x10($sp)
/* A2AC 80021AAC 00000000 */  nop
/* A2B0 80021AB0 25006214 */  bne        $v1, $v0, .L80021B48
/* A2B4 80021AB4 21202002 */   addu      $a0, $s1, $zero
/* A2B8 80021AB8 1100A393 */  lbu        $v1, 0x11($sp)
/* A2BC 80021ABC 43000234 */  ori        $v0, $zero, 0x43
/* A2C0 80021AC0 22006214 */  bne        $v1, $v0, .L80021B4C
/* A2C4 80021AC4 21285402 */   addu      $a1, $s2, $s4
/* A2C8 80021AC8 1200A293 */  lbu        $v0, 0x12($sp)
/* A2CC 80021ACC 00000000 */  nop
/* A2D0 80021AD0 0F004230 */  andi       $v0, $v0, 0xF
/* A2D4 80021AD4 01004224 */  addiu      $v0, $v0, 0x1
/* A2D8 80021AD8 1B006012 */  beqz       $s3, .L80021B48
/* A2DC 80021ADC C0910200 */   sll       $s2, $v0, 7
/* A2E0 80021AE0 1400B027 */  addiu      $s0, $sp, 0x14
/* A2E4 80021AE4 21200002 */  addu       $a0, $s0, $zero
/* A2E8 80021AE8 40000534 */  ori        $a1, $zero, 0x40
/* A2EC 80021AEC 328C000C */  jal        func_800230C8
/* A2F0 80021AF0 21300000 */   addu      $a2, $zero, $zero
/* A2F4 80021AF4 21206002 */  addu       $a0, $s3, $zero
/* A2F8 80021AF8 BA8B000C */  jal        func_80022EE8
/* A2FC 80021AFC 21280002 */   addu      $a1, $s0, $zero
/* A300 80021B00 21202002 */  addu       $a0, $s1, $zero
/* A304 80021B04 21280000 */  addu       $a1, $zero, $zero
/* A308 80021B08 0581000C */  jal        func_80020414
/* A30C 80021B0C 21300000 */   addu      $a2, $zero, $zero
/* A310 80021B10 21202002 */  addu       $a0, $s1, $zero
/* A314 80021B14 1000A527 */  addiu      $a1, $sp, 0x10
/* A318 80021B18 A880000C */  jal        func_800202A0
/* A31C 80021B1C 80000634 */   ori       $a2, $zero, 0x80
.L80021B20:
/* A320 80021B20 177F000C */  jal        func_8001FC5C
/* A324 80021B24 00000000 */   nop
/* A328 80021B28 07004014 */  bnez       $v0, .L80021B48
/* A32C 80021B2C 21202002 */   addu      $a0, $s1, $zero
/* A330 80021B30 286C000C */  jal        func_8001B0A0
/* A334 80021B34 00000000 */   nop
/* A338 80021B38 2C86000C */  jal        func_800218B0
/* A33C 80021B3C 00000000 */   nop
/* A340 80021B40 C8860008 */  j          .L80021B20
/* A344 80021B44 00000000 */   nop
.L80021B48:
/* A348 80021B48 21285402 */  addu       $a1, $s2, $s4
.L80021B4C:
/* A34C 80021B4C 0581000C */  jal        func_80020414
/* A350 80021B50 21300000 */   addu      $a2, $zero, $zero
/* A354 80021B54 21202002 */  addu       $a0, $s1, $zero
/* A358 80021B58 2128A002 */  addu       $a1, $s5, $zero
/* A35C 80021B5C A880000C */  jal        func_800202A0
/* A360 80021B60 2130C002 */   addu      $a2, $s6, $zero
.L80021B64:
/* A364 80021B64 177F000C */  jal        func_8001FC5C
/* A368 80021B68 00000000 */   nop
/* A36C 80021B6C 07004014 */  bnez       $v0, .L80021B8C
/* A370 80021B70 04004238 */   xori      $v0, $v0, 0x4
/* A374 80021B74 286C000C */  jal        func_8001B0A0
/* A378 80021B78 00000000 */   nop
/* A37C 80021B7C 2C86000C */  jal        func_800218B0
/* A380 80021B80 00000000 */   nop
/* A384 80021B84 D9860008 */  j          .L80021B64
/* A388 80021B88 00000000 */   nop
.L80021B8C:
/* A38C 80021B8C 0100422C */  sltiu      $v0, $v0, 0x1
/* A390 80021B90 23100200 */  negu       $v0, $v0
/* A394 80021B94 2490C202 */  and        $s2, $s6, $v0
/* A398 80021B98 8280000C */  jal        func_80020208
/* A39C 80021B9C 21202002 */   addu      $a0, $s1, $zero
/* A3A0 80021BA0 21104002 */  addu       $v0, $s2, $zero
.L80021BA4:
/* A3A4 80021BA4 AC00BF8F */  lw         $ra, 0xAC($sp)
/* A3A8 80021BA8 A800B68F */  lw         $s6, 0xA8($sp)
/* A3AC 80021BAC A400B58F */  lw         $s5, 0xA4($sp)
/* A3B0 80021BB0 A000B48F */  lw         $s4, 0xA0($sp)
/* A3B4 80021BB4 9C00B38F */  lw         $s3, 0x9C($sp)
/* A3B8 80021BB8 9800B28F */  lw         $s2, 0x98($sp)
/* A3BC 80021BBC 9400B18F */  lw         $s1, 0x94($sp)
/* A3C0 80021BC0 9000B08F */  lw         $s0, 0x90($sp)
/* A3C4 80021BC4 0800E003 */  jr         $ra
/* A3C8 80021BC8 B000BD27 */   addiu     $sp, $sp, 0xB0
