.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E2E4
/* 16AE4 8002E2E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 16AE8 8002E2E8 1000BFAF */  sw         $ra, 0x10($sp)
/* 16AEC 8002E2EC C8AD000C */  jal        func_8002B720
/* 16AF0 8002E2F0 00000000 */   nop
/* 16AF4 8002E2F4 4FB9000C */  jal        func_8002E53C
/* 16AF8 8002E2F8 01000434 */   ori       $a0, $zero, 0x1
/* 16AFC 8002E2FC EBB8000C */  jal        func_8002E3AC
/* 16B00 8002E300 00000000 */   nop
/* 16B04 8002E304 0480043C */  lui        $a0, %hi(D_800478DC)
/* 16B08 8002E308 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 16B0C 8002E30C 0480023C */  lui        $v0, %hi(D_800475D4)
/* 16B10 8002E310 D475428C */  lw         $v0, %lo(D_800475D4)($v0)
/* 16B14 8002E314 0480063C */  lui        $a2, %hi(D_800478EC)
/* 16B18 8002E318 EC78C624 */  addiu      $a2, $a2, %lo(D_800478EC)
/* 16B1C 8002E31C 0480013C */  lui        $at, %hi(D_800478E4)
/* 16B20 8002E320 E47820AC */  sw         $zero, %lo(D_800478E4)($at)
/* 16B24 8002E324 0480013C */  lui        $at, %hi(D_800478E8)
/* 16B28 8002E328 E87820AC */  sw         $zero, %lo(D_800478E8)($at)
/* 16B2C 8002E32C 0580013C */  lui        $at, %hi(D_80054904)
/* 16B30 8002E330 044920AC */  sw         $zero, %lo(D_80054904)($at)
/* 16B34 8002E334 0580013C */  lui        $at, %hi(D_80054908)
/* 16B38 8002E338 084920A4 */  sh         $zero, %lo(D_80054908)($at)
/* 16B3C 8002E33C 0580013C */  lui        $at, %hi(D_8005490A)
/* 16B40 8002E340 0A4920A4 */  sh         $zero, %lo(D_8005490A)($at)
/* 16B44 8002E344 0580013C */  lui        $at, %hi(D_8005490C)
/* 16B48 8002E348 0C4920AC */  sw         $zero, %lo(D_8005490C)($at)
/* 16B4C 8002E34C 0580013C */  lui        $at, %hi(D_80054910)
/* 16B50 8002E350 104920AC */  sw         $zero, %lo(D_80054910)($at)
/* 16B54 8002E354 0480013C */  lui        $at, %hi(D_800478EC)
/* 16B58 8002E358 EC7822AC */  sw         $v0, %lo(D_800478EC)($at)
/* 16B5C 8002E35C 10BD000C */  jal        func_8002F440
/* 16B60 8002E360 61000534 */   ori       $a1, $zero, 0x61
/* 16B64 8002E364 0480043C */  lui        $a0, %hi(D_800478DC)
/* 16B68 8002E368 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 16B6C 8002E36C 0480063C */  lui        $a2, %hi(D_800478E0)
/* 16B70 8002E370 E078C624 */  addiu      $a2, $a2, %lo(D_800478E0)
/* 16B74 8002E374 0480013C */  lui        $at, %hi(D_800478E0)
/* 16B78 8002E378 E07820AC */  sw         $zero, %lo(D_800478E0)($at)
/* 16B7C 8002E37C 10BD000C */  jal        func_8002F440
/* 16B80 8002E380 21000534 */   ori       $a1, $zero, 0x21
/* 16B84 8002E384 0480013C */  lui        $at, %hi(D_800478F0)
/* 16B88 8002E388 F07820AC */  sw         $zero, %lo(D_800478F0)($at)
/* 16B8C 8002E38C 0480013C */  lui        $at, %hi(D_800478FC)
/* 16B90 8002E390 FC7820AC */  sw         $zero, %lo(D_800478FC)($at)
/* 16B94 8002E394 0480013C */  lui        $at, %hi(D_80047900)
/* 16B98 8002E398 007920AC */  sw         $zero, %lo(D_80047900)($at)
/* 16B9C 8002E39C 1000BF8F */  lw         $ra, 0x10($sp)
/* 16BA0 8002E3A0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 16BA4 8002E3A4 0800E003 */  jr         $ra
/* 16BA8 8002E3A8 00000000 */   nop
