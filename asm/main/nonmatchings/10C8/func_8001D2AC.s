.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D2AC
/* 5AAC 8001D2AC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 5AB0 8001D2B0 2400BFAF */  sw         $ra, 0x24($sp)
/* 5AB4 8001D2B4 2000B2AF */  sw         $s2, 0x20($sp)
/* 5AB8 8001D2B8 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 5ABC 8001D2BC 1800B0AF */  sw         $s0, 0x18($sp)
/* 5AC0 8001D2C0 21808000 */  addu       $s0, $a0, $zero
/* 5AC4 8001D2C4 2188A000 */  addu       $s1, $a1, $zero
/* 5AC8 8001D2C8 4174000C */  jal        func_8001D104
/* 5ACC 8001D2CC 2190C000 */   addu      $s2, $a2, $zero
/* 5AD0 8001D2D0 DF69000C */  jal        func_8001A77C
/* 5AD4 8001D2D4 00000000 */   nop
/* 5AD8 8001D2D8 376E000C */  jal        func_8001B8DC
/* 5ADC 8001D2DC 00000000 */   nop
/* 5AE0 8001D2E0 B88A000C */  jal        func_80022AE0
/* 5AE4 8001D2E4 21200000 */   addu      $a0, $zero, $zero
/* 5AE8 8001D2E8 DD70000C */  jal        func_8001C374
/* 5AEC 8001D2EC 00000000 */   nop
/* 5AF0 8001D2F0 09000434 */  ori        $a0, $zero, 0x9
/* 5AF4 8001D2F4 21280000 */  addu       $a1, $zero, $zero
/* 5AF8 8001D2F8 086C000C */  jal        func_8001B020
/* 5AFC 8001D2FC 21300000 */   addu      $a2, $zero, $zero
/* 5B00 8001D300 FE000434 */  ori        $a0, $zero, 0xFE
/* 5B04 8001D304 04000534 */  ori        $a1, $zero, 0x4
/* 5B08 8001D308 086C000C */  jal        func_8001B020
/* 5B0C 8001D30C 21300000 */   addu      $a2, $zero, $zero
/* 5B10 8001D310 376E000C */  jal        func_8001B8DC
/* 5B14 8001D314 00000000 */   nop
/* 5B18 8001D318 21200002 */  addu       $a0, $s0, $zero
/* 5B1C 8001D31C 21282002 */  addu       $a1, $s1, $zero
/* 5B20 8001D320 1D89000C */  jal        func_80022474
/* 5B24 8001D324 21304002 */   addu      $a2, $s2, $zero
/* 5B28 8001D328 0480043C */  lui        $a0, %hi(D_80047D88)
/* 5B2C 8001D32C 887D848C */  lw         $a0, %lo(D_80047D88)($a0)
/* 5B30 8001D330 E770000C */  jal        func_8001C39C
/* 5B34 8001D334 21804000 */   addu      $s0, $v0, $zero
/* 5B38 8001D338 4373000C */  jal        func_8001CD0C
/* 5B3C 8001D33C 1000A427 */   addiu     $a0, $sp, 0x10
/* 5B40 8001D340 4D6A000C */  jal        func_8001A934
/* 5B44 8001D344 1000A427 */   addiu     $a0, $sp, 0x10
/* 5B48 8001D348 F9000434 */  ori        $a0, $zero, 0xF9
/* 5B4C 8001D34C 0480053C */  lui        $a1, %hi(D_80047EA4)
/* 5B50 8001D350 A47EA58C */  lw         $a1, %lo(D_80047EA4)($a1)
/* 5B54 8001D354 086C000C */  jal        func_8001B020
/* 5B58 8001D358 21300000 */   addu      $a2, $zero, $zero
/* 5B5C 8001D35C FE000434 */  ori        $a0, $zero, 0xFE
/* 5B60 8001D360 21280000 */  addu       $a1, $zero, $zero
/* 5B64 8001D364 086C000C */  jal        func_8001B020
/* 5B68 8001D368 21300000 */   addu      $a2, $zero, $zero
/* 5B6C 8001D36C 376E000C */  jal        func_8001B8DC
/* 5B70 8001D370 00000000 */   nop
/* 5B74 8001D374 E068000C */  jal        func_8001A380
/* 5B78 8001D378 00000000 */   nop
/* 5B7C 8001D37C 21100002 */  addu       $v0, $s0, $zero
/* 5B80 8001D380 2400BF8F */  lw         $ra, 0x24($sp)
/* 5B84 8001D384 2000B28F */  lw         $s2, 0x20($sp)
/* 5B88 8001D388 1C00B18F */  lw         $s1, 0x1C($sp)
/* 5B8C 8001D38C 1800B08F */  lw         $s0, 0x18($sp)
/* 5B90 8001D390 0800E003 */  jr         $ra
/* 5B94 8001D394 2800BD27 */   addiu     $sp, $sp, 0x28
