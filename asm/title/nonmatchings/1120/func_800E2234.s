.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E2234
/* 2A34 800E2234 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2A38 800E2238 FCFF8224 */  addiu      $v0, $a0, -0x4
/* 2A3C 800E223C 0200422C */  sltiu      $v0, $v0, 0x2
/* 2A40 800E2240 04004014 */  bnez       $v0, .L800E2254
/* 2A44 800E2244 1000BFAF */   sw        $ra, 0x10($sp)
/* 2A48 800E2248 06000234 */  ori        $v0, $zero, 0x6
/* 2A4C 800E224C 02008214 */  bne        $a0, $v0, .L800E2258
/* 2A50 800E2250 80000734 */   ori       $a3, $zero, 0x80
.L800E2254:
/* 2A54 800E2254 64000734 */  ori        $a3, $zero, 0x64
.L800E2258:
/* 2A58 800E2258 0F80033C */  lui        $v1, %hi(D_800F4E70)
/* 2A5C 800E225C 704E638C */  lw         $v1, %lo(D_800F4E70)($v1)
/* 2A60 800E2260 01000234 */  ori        $v0, $zero, 0x1
/* 2A64 800E2264 0C006214 */  bne        $v1, $v0, .L800E2298
/* 2A68 800E2268 00000000 */   nop
/* 2A6C 800E226C 0F80043C */  lui        $a0, %hi(D_800F4D14)
/* 2A70 800E2270 144D848C */  lw         $a0, %lo(D_800F4D14)($a0)
/* 2A74 800E2274 0F80053C */  lui        $a1, %hi(D_800F4D18)
/* 2A78 800E2278 184DA58C */  lw         $a1, %lo(D_800F4D18)($a1)
/* 2A7C 800E227C 0F80063C */  lui        $a2, %hi(D_800F4EC0)
/* 2A80 800E2280 C04EC68C */  lw         $a2, %lo(D_800F4EC0)($a2)
/* 2A84 800E2284 FAFF8424 */  addiu      $a0, $a0, -0x6
/* 2A88 800E2288 D697030C */  jal        func_800E5F58
/* 2A8C 800E228C F6FFA524 */   addiu     $a1, $a1, -0xA
/* 2A90 800E2290 B0880308 */  j          .L800E22C0
/* 2A94 800E2294 FAFF0424 */   addiu     $a0, $zero, -0x6
.L800E2298:
/* 2A98 800E2298 0F80043C */  lui        $a0, %hi(D_800F4D14)
/* 2A9C 800E229C 144D848C */  lw         $a0, %lo(D_800F4D14)($a0)
/* 2AA0 800E22A0 0F80053C */  lui        $a1, %hi(D_800F4D18)
/* 2AA4 800E22A4 184DA58C */  lw         $a1, %lo(D_800F4D18)($a1)
/* 2AA8 800E22A8 0F80063C */  lui        $a2, %hi(D_800F4EC0)
/* 2AAC 800E22AC C04EC68C */  lw         $a2, %lo(D_800F4EC0)($a2)
/* 2AB0 800E22B0 FAFF8424 */  addiu      $a0, $a0, -0x6
/* 2AB4 800E22B4 C098030C */  jal        func_800E6300
/* 2AB8 800E22B8 F6FFA524 */   addiu     $a1, $a1, -0xA
/* 2ABC 800E22BC FAFF0424 */  addiu      $a0, $zero, -0x6
.L800E22C0:
/* 2AC0 800E22C0 0097030C */  jal        func_800E5C00
/* 2AC4 800E22C4 C8000534 */   ori       $a1, $zero, 0xC8
/* 2AC8 800E22C8 1000BF8F */  lw         $ra, 0x10($sp)
/* 2ACC 800E22CC 00000000 */  nop
/* 2AD0 800E22D0 0800E003 */  jr         $ra
/* 2AD4 800E22D4 1800BD27 */   addiu     $sp, $sp, 0x18
