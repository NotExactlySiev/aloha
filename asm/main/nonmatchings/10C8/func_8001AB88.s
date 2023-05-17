.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AB88
/* 3388 8001AB88 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 338C 8001AB8C 2000BFAF */  sw         $ra, 0x20($sp)
/* 3390 8001AB90 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 3394 8001AB94 1800B2AF */  sw         $s2, 0x18($sp)
/* 3398 8001AB98 1400B1AF */  sw         $s1, 0x14($sp)
/* 339C 8001AB9C 1000B0AF */  sw         $s0, 0x10($sp)
/* 33A0 8001ABA0 21808000 */  addu       $s0, $a0, $zero
/* 33A4 8001ABA4 2188A000 */  addu       $s1, $a1, $zero
/* 33A8 8001ABA8 2198C000 */  addu       $s3, $a2, $zero
/* 33AC 8001ABAC 0480023C */  lui        $v0, %hi(D_80047DB4)
/* 33B0 8001ABB0 B47D428C */  lw         $v0, %lo(D_80047DB4)($v0)
/* 33B4 8001ABB4 01001234 */  ori        $s2, $zero, 0x1
/* 33B8 8001ABB8 4D005210 */  beq        $v0, $s2, .L8001ACF0
/* 33BC 8001ABBC 21100000 */   addu      $v0, $zero, $zero
/* 33C0 8001ABC0 7566000C */  jal        func_800199D4
/* 33C4 8001ABC4 00000000 */   nop
/* 33C8 8001ABC8 14005214 */  bne        $v0, $s2, .L8001AC1C
/* 33CC 8001ABCC 01000234 */   ori       $v0, $zero, 0x1
/* 33D0 8001ABD0 80101000 */  sll        $v0, $s0, 2
/* 33D4 8001ABD4 21800202 */  addu       $s0, $s0, $v0
/* 33D8 8001ABD8 06000234 */  ori        $v0, $zero, 0x6
/* 33DC 8001ABDC 1A000202 */  div        $zero, $s0, $v0
/* 33E0 8001ABE0 02004014 */  bnez       $v0, .L8001ABEC
/* 33E4 8001ABE4 00000000 */   nop
/* 33E8 8001ABE8 0D000700 */  break      7
.L8001ABEC:
/* 33EC 8001ABEC FFFF0124 */  addiu      $at, $zero, -0x1
/* 33F0 8001ABF0 04004114 */  bne        $v0, $at, .L8001AC04
/* 33F4 8001ABF4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 33F8 8001ABF8 02000116 */  bne        $s0, $at, .L8001AC04
/* 33FC 8001ABFC 00000000 */   nop
/* 3400 8001AC00 0D000600 */  break      6
.L8001AC04:
/* 3404 8001AC04 12800000 */  mflo       $s0
/* 3408 8001AC08 00000000 */  nop
/* 340C 8001AC0C FFFF1026 */  addiu      $s0, $s0, -0x1
/* 3410 8001AC10 0200001E */  bgtz       $s0, .L8001AC1C
/* 3414 8001AC14 01000234 */   ori       $v0, $zero, 0x1
/* 3418 8001AC18 01001034 */  ori        $s0, $zero, 0x1
.L8001AC1C:
/* 341C 8001AC1C 0480013C */  lui        $at, %hi(D_80047DB4)
/* 3420 8001AC20 B47D22AC */  sw         $v0, %lo(D_80047DB4)($at)
/* 3424 8001AC24 0480013C */  lui        $at, %hi(D_80047F0C)
/* 3428 8001AC28 0C7F33AC */  sw         $s3, %lo(D_80047F0C)($at)
/* 342C 8001AC2C 0300001E */  bgtz       $s0, .L8001AC3C
/* 3430 8001AC30 0104022A */   slti      $v0, $s0, 0x401
/* 3434 8001AC34 01001034 */  ori        $s0, $zero, 0x1
/* 3438 8001AC38 0104022A */  slti       $v0, $s0, 0x401
.L8001AC3C:
/* 343C 8001AC3C 02004014 */  bnez       $v0, .L8001AC48
/* 3440 8001AC40 0104222A */   slti      $v0, $s1, 0x401
/* 3444 8001AC44 00041034 */  ori        $s0, $zero, 0x400
.L8001AC48:
/* 3448 8001AC48 02004014 */  bnez       $v0, .L8001AC54
/* 344C 8001AC4C 00000000 */   nop
/* 3450 8001AC50 00041134 */  ori        $s1, $zero, 0x400
.L8001AC54:
/* 3454 8001AC54 02002106 */  bgez       $s1, .L8001AC60
/* 3458 8001AC58 00040234 */   ori       $v0, $zero, 0x400
/* 345C 8001AC5C 21880000 */  addu       $s1, $zero, $zero
.L8001AC60:
/* 3460 8001AC60 1A005000 */  div        $zero, $v0, $s0
/* 3464 8001AC64 02000016 */  bnez       $s0, .L8001AC70
/* 3468 8001AC68 00000000 */   nop
/* 346C 8001AC6C 0D000700 */  break      7
.L8001AC70:
/* 3470 8001AC70 FFFF0124 */  addiu      $at, $zero, -0x1
/* 3474 8001AC74 04000116 */  bne        $s0, $at, .L8001AC88
/* 3478 8001AC78 0080013C */   lui       $at, (0x80000000 >> 16)
/* 347C 8001AC7C 02004114 */  bne        $v0, $at, .L8001AC88
/* 3480 8001AC80 00000000 */   nop
/* 3484 8001AC84 0D000600 */  break      6
.L8001AC88:
/* 3488 8001AC88 12100000 */  mflo       $v0
/* 348C 8001AC8C 0480013C */  lui        $at, %hi(D_80047DCC)
/* 3490 8001AC90 CC7D31AC */  sw         $s1, %lo(D_80047DCC)($at)
/* 3494 8001AC94 0280043C */  lui        $a0, %hi(func_8001A978)
/* 3498 8001AC98 78A98424 */  addiu      $a0, $a0, %lo(func_8001A978)
/* 349C 8001AC9C 0480013C */  lui        $at, %hi(D_80047DC8)
/* 34A0 8001ACA0 C87D22AC */  sw         $v0, %lo(D_80047DC8)($at)
/* 34A4 8001ACA4 628C000C */  jal        func_80023188
/* 34A8 8001ACA8 01000534 */   ori       $a1, $zero, 0x1
/* 34AC 8001ACAC 0480013C */  lui        $at, %hi(D_80047EFC)
/* 34B0 8001ACB0 FC7E22AC */  sw         $v0, %lo(D_80047EFC)($at)
/* 34B4 8001ACB4 0480023C */  lui        $v0, %hi(D_80047EFC)
/* 34B8 8001ACB8 FC7E428C */  lw         $v0, %lo(D_80047EFC)($v0)
/* 34BC 8001ACBC 00000000 */  nop
/* 34C0 8001ACC0 06004004 */  bltz       $v0, .L8001ACDC
/* 34C4 8001ACC4 FB000434 */   ori       $a0, $zero, 0xFB
/* 34C8 8001ACC8 01000534 */  ori        $a1, $zero, 0x1
/* 34CC 8001ACCC 086C000C */  jal        func_8001B020
/* 34D0 8001ACD0 21300000 */   addu      $a2, $zero, $zero
/* 34D4 8001ACD4 3C6B0008 */  j          .L8001ACF0
/* 34D8 8001ACD8 01000234 */   ori       $v0, $zero, 0x1
.L8001ACDC:
/* 34DC 8001ACDC 0480013C */  lui        $at, %hi(D_80047DB4)
/* 34E0 8001ACE0 B47D20AC */  sw         $zero, %lo(D_80047DB4)($at)
/* 34E4 8001ACE4 0480013C */  lui        $at, %hi(D_80047DBC)
/* 34E8 8001ACE8 BC7D20AC */  sw         $zero, %lo(D_80047DBC)($at)
/* 34EC 8001ACEC 21100000 */  addu       $v0, $zero, $zero
.L8001ACF0:
/* 34F0 8001ACF0 2000BF8F */  lw         $ra, 0x20($sp)
/* 34F4 8001ACF4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 34F8 8001ACF8 1800B28F */  lw         $s2, 0x18($sp)
/* 34FC 8001ACFC 1400B18F */  lw         $s1, 0x14($sp)
/* 3500 8001AD00 1000B08F */  lw         $s0, 0x10($sp)
/* 3504 8001AD04 0800E003 */  jr         $ra
/* 3508 8001AD08 2800BD27 */   addiu     $sp, $sp, 0x28
