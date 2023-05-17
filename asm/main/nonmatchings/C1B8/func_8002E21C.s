.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E21C
/* 16A1C 8002E21C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 16A20 8002E220 1000BFAF */  sw         $ra, 0x10($sp)
/* 16A24 8002E224 C8AD000C */  jal        func_8002B720
/* 16A28 8002E228 00000000 */   nop
/* 16A2C 8002E22C 4FB9000C */  jal        func_8002E53C
/* 16A30 8002E230 21200000 */   addu      $a0, $zero, $zero
/* 16A34 8002E234 EBB8000C */  jal        func_8002E3AC
/* 16A38 8002E238 00000000 */   nop
/* 16A3C 8002E23C 0480043C */  lui        $a0, %hi(D_800478DC)
/* 16A40 8002E240 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 16A44 8002E244 0480023C */  lui        $v0, %hi(D_800475D4)
/* 16A48 8002E248 D475428C */  lw         $v0, %lo(D_800475D4)($v0)
/* 16A4C 8002E24C 0480063C */  lui        $a2, %hi(D_800478EC)
/* 16A50 8002E250 EC78C624 */  addiu      $a2, $a2, %lo(D_800478EC)
/* 16A54 8002E254 0480013C */  lui        $at, %hi(D_800478E4)
/* 16A58 8002E258 E47820AC */  sw         $zero, %lo(D_800478E4)($at)
/* 16A5C 8002E25C 0480013C */  lui        $at, %hi(D_800478E8)
/* 16A60 8002E260 E87820AC */  sw         $zero, %lo(D_800478E8)($at)
/* 16A64 8002E264 0580013C */  lui        $at, %hi(D_80054904)
/* 16A68 8002E268 044920AC */  sw         $zero, %lo(D_80054904)($at)
/* 16A6C 8002E26C 0580013C */  lui        $at, %hi(D_80054908)
/* 16A70 8002E270 084920A4 */  sh         $zero, %lo(D_80054908)($at)
/* 16A74 8002E274 0580013C */  lui        $at, %hi(D_8005490A)
/* 16A78 8002E278 0A4920A4 */  sh         $zero, %lo(D_8005490A)($at)
/* 16A7C 8002E27C 0580013C */  lui        $at, %hi(D_8005490C)
/* 16A80 8002E280 0C4920AC */  sw         $zero, %lo(D_8005490C)($at)
/* 16A84 8002E284 0580013C */  lui        $at, %hi(D_80054910)
/* 16A88 8002E288 104920AC */  sw         $zero, %lo(D_80054910)($at)
/* 16A8C 8002E28C 0480013C */  lui        $at, %hi(D_800478EC)
/* 16A90 8002E290 EC7822AC */  sw         $v0, %lo(D_800478EC)($at)
/* 16A94 8002E294 10BD000C */  jal        func_8002F440
/* 16A98 8002E298 61000534 */   ori       $a1, $zero, 0x61
/* 16A9C 8002E29C 0480043C */  lui        $a0, %hi(D_800478DC)
/* 16AA0 8002E2A0 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 16AA4 8002E2A4 0480063C */  lui        $a2, %hi(D_800478E0)
/* 16AA8 8002E2A8 E078C624 */  addiu      $a2, $a2, %lo(D_800478E0)
/* 16AAC 8002E2AC 0480013C */  lui        $at, %hi(D_800478E0)
/* 16AB0 8002E2B0 E07820AC */  sw         $zero, %lo(D_800478E0)($at)
/* 16AB4 8002E2B4 10BD000C */  jal        func_8002F440
/* 16AB8 8002E2B8 21000534 */   ori       $a1, $zero, 0x21
/* 16ABC 8002E2BC 0480013C */  lui        $at, %hi(D_800478F0)
/* 16AC0 8002E2C0 F07820AC */  sw         $zero, %lo(D_800478F0)($at)
/* 16AC4 8002E2C4 0480013C */  lui        $at, %hi(D_800478FC)
/* 16AC8 8002E2C8 FC7820AC */  sw         $zero, %lo(D_800478FC)($at)
/* 16ACC 8002E2CC 0480013C */  lui        $at, %hi(D_80047900)
/* 16AD0 8002E2D0 007920AC */  sw         $zero, %lo(D_80047900)($at)
/* 16AD4 8002E2D4 1000BF8F */  lw         $ra, 0x10($sp)
/* 16AD8 8002E2D8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 16ADC 8002E2DC 0800E003 */  jr         $ra
/* 16AE0 8002E2E0 00000000 */   nop
