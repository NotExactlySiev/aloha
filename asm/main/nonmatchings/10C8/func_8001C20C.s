.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C20C
/* 4A0C 8001C20C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4A10 8001C210 1400BFAF */  sw         $ra, 0x14($sp)
/* 4A14 8001C214 1000B0AF */  sw         $s0, 0x10($sp)
/* 4A18 8001C218 21808000 */  addu       $s0, $a0, $zero
/* 4A1C 8001C21C 0480013C */  lui        $at, %hi(D_80047D78)
/* 4A20 8001C220 787D20AC */  sw         $zero, %lo(D_80047D78)($at)
/* 4A24 8001C224 0480013C */  lui        $at, %hi(D_80047F24)
/* 4A28 8001C228 247F20AC */  sw         $zero, %lo(D_80047F24)($at)
/* 4A2C 8001C22C 00000292 */  lbu        $v0, 0x0($s0)
/* 4A30 8001C230 00000000 */  nop
/* 4A34 8001C234 0580013C */  lui        $at, %hi(D_80048085)
/* 4A38 8001C238 858022A0 */  sb         $v0, %lo(D_80048085)($at)
/* 4A3C 8001C23C 01000292 */  lbu        $v0, 0x1($s0)
/* 4A40 8001C240 00000000 */  nop
/* 4A44 8001C244 0580013C */  lui        $at, %hi(D_80048086)
/* 4A48 8001C248 868022A0 */  sb         $v0, %lo(D_80048086)($at)
/* 4A4C 8001C24C 02000292 */  lbu        $v0, 0x2($s0)
/* 4A50 8001C250 00000000 */  nop
/* 4A54 8001C254 0580013C */  lui        $at, %hi(D_80048087)
/* 4A58 8001C258 878022A0 */  sb         $v0, %lo(D_80048087)($at)
/* 4A5C 8001C25C C6A2000C */  jal        func_80028B18
/* 4A60 8001C260 00000000 */   nop
/* 4A64 8001C264 0480013C */  lui        $at, %hi(D_80047EAC)
/* 4A68 8001C268 AC7E22AC */  sw         $v0, %lo(D_80047EAC)($at)
/* 4A6C 8001C26C FC000434 */  ori        $a0, $zero, 0xFC
/* 4A70 8001C270 0480053C */  lui        $a1, %hi(D_80047D8C)
/* 4A74 8001C274 8C7DA524 */  addiu      $a1, $a1, %lo(D_80047D8C)
/* 4A78 8001C278 086C000C */  jal        func_8001B020
/* 4A7C 8001C27C 21300000 */   addu      $a2, $zero, $zero
/* 4A80 8001C280 FE000434 */  ori        $a0, $zero, 0xFE
/* 4A84 8001C284 21280000 */  addu       $a1, $zero, $zero
/* 4A88 8001C288 086C000C */  jal        func_8001B020
/* 4A8C 8001C28C 21300000 */   addu      $a2, $zero, $zero
/* 4A90 8001C290 DD70000C */  jal        func_8001C374
/* 4A94 8001C294 00000000 */   nop
/* 4A98 8001C298 16000434 */  ori        $a0, $zero, 0x16
/* 4A9C 8001C29C 21280002 */  addu       $a1, $s0, $zero
/* 4AA0 8001C2A0 086C000C */  jal        func_8001B020
/* 4AA4 8001C2A4 21300000 */   addu      $a2, $zero, $zero
/* 4AA8 8001C2A8 03000434 */  ori        $a0, $zero, 0x3
/* 4AAC 8001C2AC 21280000 */  addu       $a1, $zero, $zero
/* 4AB0 8001C2B0 086C000C */  jal        func_8001B020
/* 4AB4 8001C2B4 21300000 */   addu      $a2, $zero, $zero
/* 4AB8 8001C2B8 FB000434 */  ori        $a0, $zero, 0xFB
/* 4ABC 8001C2BC 21280000 */  addu       $a1, $zero, $zero
/* 4AC0 8001C2C0 086C000C */  jal        func_8001B020
/* 4AC4 8001C2C4 21300000 */   addu      $a2, $zero, $zero
/* 4AC8 8001C2C8 FD000434 */  ori        $a0, $zero, 0xFD
/* 4ACC 8001C2CC 0480053C */  lui        $a1, %hi(D_80047E9C)
/* 4AD0 8001C2D0 9C7EA524 */  addiu      $a1, $a1, %lo(D_80047E9C)
/* 4AD4 8001C2D4 086C000C */  jal        func_8001B020
/* 4AD8 8001C2D8 21300000 */   addu      $a2, $zero, $zero
/* 4ADC 8001C2DC 766E000C */  jal        func_8001B9D8
/* 4AE0 8001C2E0 00000000 */   nop
/* 4AE4 8001C2E4 1400BF8F */  lw         $ra, 0x14($sp)
/* 4AE8 8001C2E8 1000B08F */  lw         $s0, 0x10($sp)
/* 4AEC 8001C2EC 0800E003 */  jr         $ra
/* 4AF0 8001C2F0 1800BD27 */   addiu     $sp, $sp, 0x18
