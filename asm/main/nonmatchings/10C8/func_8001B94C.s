.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001B94C
/* 414C 8001B94C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4150 8001B950 1000BFAF */  sw         $ra, 0x10($sp)
/* 4154 8001B954 0480033C */  lui        $v1, %hi(D_80047F1C)
/* 4158 8001B958 1C7F638C */  lw         $v1, %lo(D_80047F1C)($v1)
/* 415C 8001B95C 03000234 */  ori        $v0, $zero, 0x3
/* 4160 8001B960 0480013C */  lui        $at, %hi(D_80047F24)
/* 4164 8001B964 247F22AC */  sw         $v0, %lo(D_80047F24)($at)
/* 4168 8001B968 0580013C */  lui        $at, %hi(D_800548EC)
/* 416C 8001B96C EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 4170 8001B970 15006210 */  beq        $v1, $v0, .L8001B9C8
/* 4174 8001B974 21100000 */   addu      $v0, $zero, $zero
/* 4178 8001B978 BD70000C */  jal        func_8001C2F4
/* 417C 8001B97C 00000000 */   nop
/* 4180 8001B980 0E000434 */  ori        $a0, $zero, 0xE
/* 4184 8001B984 0480053C */  lui        $a1, %hi(D_80047DA0)
/* 4188 8001B988 A07DA524 */  addiu      $a1, $a1, %lo(D_80047DA0)
/* 418C 8001B98C 086C000C */  jal        func_8001B020
/* 4190 8001B990 21300000 */   addu      $a2, $zero, $zero
/* 4194 8001B994 D370000C */  jal        func_8001C34C
/* 4198 8001B998 00000000 */   nop
/* 419C 8001B99C FC000434 */  ori        $a0, $zero, 0xFC
/* 41A0 8001B9A0 0480053C */  lui        $a1, %hi(D_80047D8C)
/* 41A4 8001B9A4 8C7DA524 */  addiu      $a1, $a1, %lo(D_80047D8C)
/* 41A8 8001B9A8 086C000C */  jal        func_8001B020
/* 41AC 8001B9AC 21300000 */   addu      $a2, $zero, $zero
/* 41B0 8001B9B0 FE000434 */  ori        $a0, $zero, 0xFE
/* 41B4 8001B9B4 03000534 */  ori        $a1, $zero, 0x3
/* 41B8 8001B9B8 086C000C */  jal        func_8001B020
/* 41BC 8001B9BC 21300000 */   addu      $a2, $zero, $zero
/* 41C0 8001B9C0 376E000C */  jal        func_8001B8DC
/* 41C4 8001B9C4 00000000 */   nop
.L8001B9C8:
/* 41C8 8001B9C8 1000BF8F */  lw         $ra, 0x10($sp)
/* 41CC 8001B9CC 00000000 */  nop
/* 41D0 8001B9D0 0800E003 */  jr         $ra
/* 41D4 8001B9D4 1800BD27 */   addiu     $sp, $sp, 0x18
