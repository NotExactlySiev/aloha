.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019B1C
/* 231C 80019B1C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2320 80019B20 1000BFAF */  sw         $ra, 0x10($sp)
/* 2324 80019B24 C8AD000C */  jal        func_8002B720
/* 2328 80019B28 00000000 */   nop
/* 232C 80019B2C D08E000C */  jal        func_80023B40
/* 2330 80019B30 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 2334 80019B34 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 2338 80019B38 D08E000C */  jal        func_80023B40
/* 233C 80019B3C 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
/* 2340 80019B40 00F2043C */  lui        $a0, (0xF2000002 >> 16)
/* 2344 80019B44 D08E000C */  jal        func_80023B40
/* 2348 80019B48 02008434 */   ori       $a0, $a0, (0xF2000002 & 0xFFFF)
/* 234C 80019B4C 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 2350 80019B50 D08E000C */  jal        func_80023B40
/* 2354 80019B54 03008434 */   ori       $a0, $a0, (0xF2000003 & 0xFFFF)
/* 2358 80019B58 21200000 */  addu       $a0, $zero, $zero
/* 235C 80019B5C ECAD000C */  jal        func_8002B7B0
/* 2360 80019B60 21280000 */   addu      $a1, $zero, $zero
/* 2364 80019B64 0280043C */  lui        $a0, %hi(func_800232D4)
/* 2368 80019B68 D4328424 */  addiu      $a0, $a0, %lo(func_800232D4)
/* 236C 80019B6C F265000C */  jal        func_800197C8
/* 2370 80019B70 00000000 */   nop
/* 2374 80019B74 0480013C */  lui        $at, %hi(D_80047E74)
/* 2378 80019B78 747E22AC */  sw         $v0, %lo(D_80047E74)($at)
/* 237C 80019B7C B18C000C */  jal        func_800232C4
/* 2380 80019B80 01000434 */   ori       $a0, $zero, 0x1
/* 2384 80019B84 A065000C */  jal        func_80019680
/* 2388 80019B88 00000000 */   nop
/* 238C 80019B8C EA8E000C */  jal        func_80023BA8
/* 2390 80019B90 21200000 */   addu      $a0, $zero, $zero
/* 2394 80019B94 0280043C */  lui        $a0, %hi(func_80019908)
/* 2398 80019B98 08998424 */  addiu      $a0, $a0, %lo(func_80019908)
/* 239C 80019B9C 4266000C */  jal        func_80019908
/* 23A0 80019BA0 01000534 */   ori       $a1, $zero, 0x1
/* 23A4 80019BA4 0280043C */  lui        $a0, %hi(func_80023144)
/* 23A8 80019BA8 44318424 */  addiu      $a0, $a0, %lo(func_80023144)
/* 23AC 80019BAC 4266000C */  jal        func_80019908
/* 23B0 80019BB0 E0000534 */   ori       $a1, $zero, 0xE0
/* 23B4 80019BB4 0280043C */  lui        $a0, %hi(func_800231CC)
/* 23B8 80019BB8 CC318424 */  addiu      $a0, $a0, %lo(func_800231CC)
/* 23BC 80019BBC 4266000C */  jal        func_80019908
/* 23C0 80019BC0 E1000534 */   ori       $a1, $zero, 0xE1
/* 23C4 80019BC4 0280043C */  lui        $a0, %hi(parser)
/* 23C8 80019BC8 B8348424 */  addiu      $a0, $a0, %lo(parser)
/* 23CC 80019BCC 4266000C */  jal        func_80019908
/* 23D0 80019BD0 C0000534 */   ori       $a1, $zero, 0xC0
/* 23D4 80019BD4 0280043C */  lui        $a0, %hi(wtf)
/* 23D8 80019BD8 3C358424 */  addiu      $a0, $a0, %lo(wtf)
/* 23DC 80019BDC 4266000C */  jal        func_80019908
/* 23E0 80019BE0 C1000534 */   ori       $a1, $zero, 0xC1
/* 23E4 80019BE4 0280043C */  lui        $a0, %hi(func_80019DD8)
/* 23E8 80019BE8 D89D8424 */  addiu      $a0, $a0, %lo(func_80019DD8)
/* 23EC 80019BEC 4266000C */  jal        func_80019908
/* 23F0 80019BF0 03000534 */   ori       $a1, $zero, 0x3
/* 23F4 80019BF4 0280043C */  lui        $a0, %hi(func_80019DE8)
/* 23F8 80019BF8 E89D8424 */  addiu      $a0, $a0, %lo(func_80019DE8)
/* 23FC 80019BFC 4266000C */  jal        func_80019908
/* 2400 80019C00 04000534 */   ori       $a1, $zero, 0x4
/* 2404 80019C04 0280043C */  lui        $a0, %hi(func_80019DF8)
/* 2408 80019C08 F89D8424 */  addiu      $a0, $a0, %lo(func_80019DF8)
/* 240C 80019C0C 4266000C */  jal        func_80019908
/* 2410 80019C10 05000534 */   ori       $a1, $zero, 0x5
/* 2414 80019C14 0280043C */  lui        $a0, %hi(func_800199D4)
/* 2418 80019C18 D4998424 */  addiu      $a0, $a0, %lo(func_800199D4)
/* 241C 80019C1C 4266000C */  jal        func_80019908
/* 2420 80019C20 07000534 */   ori       $a1, $zero, 0x7
/* 2424 80019C24 0280043C */  lui        $a0, %hi(func_80019AE8)
/* 2428 80019C28 E89A8424 */  addiu      $a0, $a0, %lo(func_80019AE8)
/* 242C 80019C2C 4266000C */  jal        func_80019908
/* 2430 80019C30 08000534 */   ori       $a1, $zero, 0x8
/* 2434 80019C34 0280043C */  lui        $a0, %hi(func_80018A7C)
/* 2438 80019C38 7C8A8424 */  addiu      $a0, $a0, %lo(func_80018A7C)
/* 243C 80019C3C 4266000C */  jal        func_80019908
/* 2440 80019C40 09000534 */   ori       $a1, $zero, 0x9
/* 2444 80019C44 0280043C */  lui        $a0, %hi(func_80018A8C)
/* 2448 80019C48 8C8A8424 */  addiu      $a0, $a0, %lo(func_80018A8C)
/* 244C 80019C4C 4266000C */  jal        func_80019908
/* 2450 80019C50 0A000534 */   ori       $a1, $zero, 0xA
/* 2454 80019C54 0280043C */  lui        $a0, %hi(func_80019AF8)
/* 2458 80019C58 F89A8424 */  addiu      $a0, $a0, %lo(func_80019AF8)
/* 245C 80019C5C 4266000C */  jal        func_80019908
/* 2460 80019C60 0B000534 */   ori       $a1, $zero, 0xB
/* 2464 80019C64 0180043C */  lui        $a0, (0x80014000 >> 16)
/* 2468 80019C68 00408434 */  ori        $a0, $a0, (0x80014000 & 0xFFFF)
/* 246C 80019C6C 00400534 */  ori        $a1, $zero, 0x4000
/* 2470 80019C70 328C000C */  jal        func_800230C8
/* 2474 80019C74 21300000 */   addu      $a2, $zero, $zero
/* 2478 80019C78 05000434 */  ori        $a0, $zero, 0x5
/* 247C 80019C7C E783000C */  jal        func_80020F9C
/* 2480 80019C80 21280000 */   addu      $a1, $zero, $zero
/* 2484 80019C84 F07E000C */  jal        func_8001FBC0
/* 2488 80019C88 21200000 */   addu      $a0, $zero, $zero
/* 248C 80019C8C 0080000C */  jal        func_80020000
/* 2490 80019C90 21200000 */   addu      $a0, $zero, $zero
/* 2494 80019C94 1000BF8F */  lw         $ra, 0x10($sp)
/* 2498 80019C98 00000000 */  nop
/* 249C 80019C9C 0800E003 */  jr         $ra
/* 24A0 80019CA0 1800BD27 */   addiu     $sp, $sp, 0x18
