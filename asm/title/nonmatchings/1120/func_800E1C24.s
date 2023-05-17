.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1C24
/* 2424 800E1C24 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 2428 800E1C28 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 242C 800E1C2C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 2430 800E1C30 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2434 800E1C34 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2438 800E1C38 1800BFAF */  sw         $ra, 0x18($sp)
/* 243C 800E1C3C 1400B1AF */  sw         $s1, 0x14($sp)
/* 2440 800E1C40 1000B0AF */  sw         $s0, 0x10($sp)
/* 2444 800E1C44 0004428C */  lw         $v0, 0x400($v0)
/* 2448 800E1C48 13057090 */  lbu        $s0, 0x513($v1)
/* 244C 800E1C4C 09F84000 */  jalr       $v0
/* 2450 800E1C50 00000000 */   nop
/* 2454 800E1C54 40004230 */  andi       $v0, $v0, 0x40
/* 2458 800E1C58 36004014 */  bnez       $v0, .L800E1D34
/* 245C 800E1C5C FF001032 */   andi      $s0, $s0, 0xFF
/* 2460 800E1C60 0C000016 */  bnez       $s0, .L800E1C94
/* 2464 800E1C64 01001134 */   ori       $s1, $zero, 0x1
/* 2468 800E1C68 0F80033C */  lui        $v1, %hi(D_800F4E40)
/* 246C 800E1C6C 404E638C */  lw         $v1, %lo(D_800F4E40)($v1)
/* 2470 800E1C70 01000234 */  ori        $v0, $zero, 0x1
/* 2474 800E1C74 2F006214 */  bne        $v1, $v0, .L800E1D34
/* 2478 800E1C78 00000000 */   nop
/* 247C 800E1C7C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 2480 800E1C80 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 2484 800E1C84 00000000 */  nop
/* 2488 800E1C88 E404428C */  lw         $v0, 0x4E4($v0)
/* 248C 800E1C8C 32870308 */  j          .L800E1CC8
/* 2490 800E1C90 00000000 */   nop
.L800E1C94:
/* 2494 800E1C94 12001116 */  bne        $s0, $s1, .L800E1CE0
/* 2498 800E1C98 00000000 */   nop
/* 249C 800E1C9C 0F80023C */  lui        $v0, %hi(D_800F4E40)
/* 24A0 800E1CA0 404E428C */  lw         $v0, %lo(D_800F4E40)($v0)
/* 24A4 800E1CA4 00000000 */  nop
/* 24A8 800E1CA8 22005114 */  bne        $v0, $s1, .L800E1D34
/* 24AC 800E1CAC 3C000434 */   ori       $a0, $zero, 0x3C
/* 24B0 800E1CB0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 24B4 800E1CB4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 24B8 800E1CB8 00000000 */  nop
/* 24BC 800E1CBC 9C04428C */  lw         $v0, 0x49C($v0)
/* 24C0 800E1CC0 21280000 */  addu       $a1, $zero, $zero
/* 24C4 800E1CC4 21300000 */  addu       $a2, $zero, $zero
.L800E1CC8:
/* 24C8 800E1CC8 09F84000 */  jalr       $v0
/* 24CC 800E1CCC 00000000 */   nop
/* 24D0 800E1CD0 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 24D4 800E1CD4 404E20AC */  sw         $zero, %lo(D_800F4E40)($at)
/* 24D8 800E1CD8 4D870308 */  j          .L800E1D34
/* 24DC 800E1CDC 00000000 */   nop
.L800E1CE0:
/* 24E0 800E1CE0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 24E4 800E1CE4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 24E8 800E1CE8 00000000 */  nop
/* 24EC 800E1CEC C80C428C */  lw         $v0, 0xCC8($v0)
/* 24F0 800E1CF0 00000000 */  nop
/* 24F4 800E1CF4 09F84000 */  jalr       $v0
/* 24F8 800E1CF8 01000434 */   ori       $a0, $zero, 0x1
/* 24FC 800E1CFC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 2500 800E1D00 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 2504 800E1D04 0F80013C */  lui        $at, %hi(D_800EB00E)
/* 2508 800E1D08 0EB02124 */  addiu      $at, $at, %lo(D_800EB00E)
/* 250C 800E1D0C 21083000 */  addu       $at, $at, $s0
/* 2510 800E1D10 00002490 */  lbu        $a0, 0x0($at)
/* 2514 800E1D14 C40C428C */  lw         $v0, 0xCC4($v0)
/* 2518 800E1D18 00000000 */  nop
/* 251C 800E1D1C 09F84000 */  jalr       $v0
/* 2520 800E1D20 00000000 */   nop
/* 2524 800E1D24 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 2528 800E1D28 404E31AC */  sw         $s1, %lo(D_800F4E40)($at)
/* 252C 800E1D2C 0F80013C */  lui        $at, %hi(D_800F4E50)
/* 2530 800E1D30 504E31AC */  sw         $s1, %lo(D_800F4E50)($at)
.L800E1D34:
/* 2534 800E1D34 1800BF8F */  lw         $ra, 0x18($sp)
/* 2538 800E1D38 1400B18F */  lw         $s1, 0x14($sp)
/* 253C 800E1D3C 1000B08F */  lw         $s0, 0x10($sp)
/* 2540 800E1D40 0800E003 */  jr         $ra
/* 2544 800E1D44 2000BD27 */   addiu     $sp, $sp, 0x20
