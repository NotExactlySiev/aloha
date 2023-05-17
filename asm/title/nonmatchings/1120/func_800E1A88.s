.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1A88
/* 2288 800E1A88 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 228C 800E1A8C D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 2290 800E1A90 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2294 800E1A94 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 2298 800E1A98 4585030C */  jal        func_800E1514
/* 229C 800E1A9C 1800B0AF */   sw        $s0, 0x18($sp)
/* 22A0 800E1AA0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 22A4 800E1AA4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 22A8 800E1AA8 00000000 */  nop
/* 22AC 800E1AAC FC0062AC */  sw         $v0, 0xFC($v1)
/* 22B0 800E1AB0 E2006490 */  lbu        $a0, 0xE2($v1)
/* 22B4 800E1AB4 F483030C */  jal        func_800E0FD0
/* 22B8 800E1AB8 00000000 */   nop
/* 22BC 800E1ABC 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 22C0 800E1AC0 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 22C4 800E1AC4 00000000 */  nop
/* 22C8 800E1AC8 14056590 */  lbu        $a1, 0x514($v1)
/* 22CC 800E1ACC 0E80043C */  lui        $a0, %hi(func_800E4D40)
/* 22D0 800E1AD0 404D8424 */  addiu      $a0, $a0, %lo(func_800E4D40)
/* 22D4 800E1AD4 21804000 */  addu       $s0, $v0, $zero
/* 22D8 800E1AD8 E40065A0 */  sb         $a1, 0xE4($v1)
/* 22DC 800E1ADC 6985030C */  jal        func_800E15A4
/* 22E0 800E1AE0 80801000 */   sll       $s0, $s0, 2
/* 22E4 800E1AE4 5093030C */  jal        func_800E4D40
/* 22E8 800E1AE8 00000000 */   nop
/* 22EC 800E1AEC 5093030C */  jal        func_800E4D40
/* 22F0 800E1AF0 00000000 */   nop
/* 22F4 800E1AF4 1A80063C */  lui        $a2, %hi(D_801A0FD8)
/* 22F8 800E1AF8 D80FC68C */  lw         $a2, %lo(D_801A0FD8)($a2)
/* 22FC 800E1AFC 0F80013C */  lui        $at, %hi(D_800EB948)
/* 2300 800E1B00 48B92124 */  addiu      $at, $at, %lo(D_800EB948)
/* 2304 800E1B04 21083000 */  addu       $at, $at, $s0
/* 2308 800E1B08 0000228C */  lw         $v0, 0x0($at)
/* 230C 800E1B0C 0C05C590 */  lbu        $a1, 0x50C($a2)
/* 2310 800E1B10 21200000 */  addu       $a0, $zero, $zero
/* 2314 800E1B14 00010734 */  ori        $a3, $zero, 0x100
/* 2318 800E1B18 679E030C */  jal        func_800E799C
/* 231C 800E1B1C 1000A2AF */   sw        $v0, 0x10($sp)
/* 2320 800E1B20 21200000 */  addu       $a0, $zero, $zero
/* 2324 800E1B24 6985030C */  jal        func_800E15A4
/* 2328 800E1B28 21804000 */   addu      $s0, $v0, $zero
/* 232C 800E1B2C 7F85030C */  jal        func_800E15FC
/* 2330 800E1B30 00000000 */   nop
/* 2334 800E1B34 01000234 */  ori        $v0, $zero, 0x1
/* 2338 800E1B38 19000216 */  bne        $s0, $v0, .L800E1BA0
/* 233C 800E1B3C 00000000 */   nop
/* 2340 800E1B40 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 2344 800E1B44 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2348 800E1B48 00000000 */  nop
/* 234C 800E1B4C 0C056290 */  lbu        $v0, 0x50C($v1)
/* 2350 800E1B50 21386000 */  addu       $a3, $v1, $zero
/* 2354 800E1B54 00016824 */  addiu      $t0, $v1, 0x100
/* 2358 800E1B58 00120200 */  sll        $v0, $v0, 8
/* 235C 800E1B5C 21104700 */  addu       $v0, $v0, $a3
/* 2360 800E1B60 00014624 */  addiu      $a2, $v0, 0x100
.L800E1B64:
/* 2364 800E1B64 0000E28C */  lw         $v0, 0x0($a3)
/* 2368 800E1B68 0400E38C */  lw         $v1, 0x4($a3)
/* 236C 800E1B6C 0800E48C */  lw         $a0, 0x8($a3)
/* 2370 800E1B70 0C00E58C */  lw         $a1, 0xC($a3)
/* 2374 800E1B74 0000C2AC */  sw         $v0, 0x0($a2)
/* 2378 800E1B78 0400C3AC */  sw         $v1, 0x4($a2)
/* 237C 800E1B7C 0800C4AC */  sw         $a0, 0x8($a2)
/* 2380 800E1B80 0C00C5AC */  sw         $a1, 0xC($a2)
/* 2384 800E1B84 1000E724 */  addiu      $a3, $a3, 0x10
/* 2388 800E1B88 F6FFE814 */  bne        $a3, $t0, .L800E1B64
/* 238C 800E1B8C 1000C624 */   addiu     $a2, $a2, 0x10
/* 2390 800E1B90 D582030C */  jal        func_800E0B54
/* 2394 800E1B94 00260434 */   ori       $a0, $zero, 0x2600
/* 2398 800E1B98 EF860308 */  j          .L800E1BBC
/* 239C 800E1B9C 00000000 */   nop
.L800E1BA0:
/* 23A0 800E1BA0 D582030C */  jal        func_800E0B54
/* 23A4 800E1BA4 00290434 */   ori       $a0, $zero, 0x2900
/* 23A8 800E1BA8 02000016 */  bnez       $s0, .L800E1BB4
/* 23AC 800E1BAC 23201000 */   negu      $a0, $s0
/* 23B0 800E1BB0 21200000 */  addu       $a0, $zero, $zero
.L800E1BB4:
/* 23B4 800E1BB4 2985030C */  jal        func_800E14A4
/* 23B8 800E1BB8 00000000 */   nop
.L800E1BBC:
/* 23BC 800E1BBC 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 23C0 800E1BC0 1800B08F */  lw         $s0, 0x18($sp)
/* 23C4 800E1BC4 0800E003 */  jr         $ra
/* 23C8 800E1BC8 2000BD27 */   addiu     $sp, $sp, 0x20
