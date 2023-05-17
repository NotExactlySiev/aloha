.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001BA50
/* 4250 8001BA50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4254 8001BA54 1000BFAF */  sw         $ra, 0x10($sp)
/* 4258 8001BA58 A873000C */  jal        func_8001CEA0
/* 425C 8001BA5C 00000000 */   nop
/* 4260 8001BA60 FC000434 */  ori        $a0, $zero, 0xFC
/* 4264 8001BA64 0480053C */  lui        $a1, %hi(D_80047D8C)
/* 4268 8001BA68 8C7DA524 */  addiu      $a1, $a1, %lo(D_80047D8C)
/* 426C 8001BA6C 086C000C */  jal        func_8001B020
/* 4270 8001BA70 21300000 */   addu      $a2, $zero, $zero
/* 4274 8001BA74 FE000434 */  ori        $a0, $zero, 0xFE
/* 4278 8001BA78 21280000 */  addu       $a1, $zero, $zero
/* 427C 8001BA7C 086C000C */  jal        func_8001B020
/* 4280 8001BA80 21300000 */   addu      $a2, $zero, $zero
/* 4284 8001BA84 D370000C */  jal        func_8001C34C
/* 4288 8001BA88 00000000 */   nop
/* 428C 8001BA8C BD70000C */  jal        func_8001C2F4
/* 4290 8001BA90 00000000 */   nop
/* 4294 8001BA94 0E000434 */  ori        $a0, $zero, 0xE
/* 4298 8001BA98 0480053C */  lui        $a1, %hi(D_80047EC4)
/* 429C 8001BA9C C47EA524 */  addiu      $a1, $a1, %lo(D_80047EC4)
/* 42A0 8001BAA0 086C000C */  jal        func_8001B020
/* 42A4 8001BAA4 21300000 */   addu      $a2, $zero, $zero
/* 42A8 8001BAA8 0D000434 */  ori        $a0, $zero, 0xD
/* 42AC 8001BAAC 0480053C */  lui        $a1, %hi(D_80047ECC)
/* 42B0 8001BAB0 CC7EA524 */  addiu      $a1, $a1, %lo(D_80047ECC)
/* 42B4 8001BAB4 086C000C */  jal        func_8001B020
/* 42B8 8001BAB8 21300000 */   addu      $a2, $zero, $zero
/* 42BC 8001BABC 15000434 */  ori        $a0, $zero, 0x15
/* 42C0 8001BAC0 0580053C */  lui        $a1, %hi(D_8004D0E0)
/* 42C4 8001BAC4 E0D0A524 */  addiu      $a1, $a1, %lo(D_8004D0E0)
/* 42C8 8001BAC8 086C000C */  jal        func_8001B020
/* 42CC 8001BACC 21300000 */   addu      $a2, $zero, $zero
/* 42D0 8001BAD0 09000434 */  ori        $a0, $zero, 0x9
/* 42D4 8001BAD4 21280000 */  addu       $a1, $zero, $zero
/* 42D8 8001BAD8 086C000C */  jal        func_8001B020
/* 42DC 8001BADC 21300000 */   addu      $a2, $zero, $zero
/* 42E0 8001BAE0 1B000434 */  ori        $a0, $zero, 0x1B
/* 42E4 8001BAE4 0580053C */  lui        $a1, %hi(D_8004D0E0)
/* 42E8 8001BAE8 E0D0A524 */  addiu      $a1, $a1, %lo(D_8004D0E0)
/* 42EC 8001BAEC 086C000C */  jal        func_8001B020
/* 42F0 8001BAF0 21300000 */   addu      $a2, $zero, $zero
/* 42F4 8001BAF4 DD70000C */  jal        func_8001C374
/* 42F8 8001BAF8 00000000 */   nop
/* 42FC 8001BAFC FC000434 */  ori        $a0, $zero, 0xFC
/* 4300 8001BB00 0480053C */  lui        $a1, %hi(D_80047E9C)
/* 4304 8001BB04 9C7EA524 */  addiu      $a1, $a1, %lo(D_80047E9C)
/* 4308 8001BB08 086C000C */  jal        func_8001B020
/* 430C 8001BB0C 21300000 */   addu      $a2, $zero, $zero
/* 4310 8001BB10 F7000434 */  ori        $a0, $zero, 0xF7
/* 4314 8001BB14 0480053C */  lui        $a1, %hi(D_80047EEC)
/* 4318 8001BB18 EC7EA58C */  lw         $a1, %lo(D_80047EEC)($a1)
/* 431C 8001BB1C 086C000C */  jal        func_8001B020
/* 4320 8001BB20 21300000 */   addu      $a2, $zero, $zero
/* 4324 8001BB24 FE000434 */  ori        $a0, $zero, 0xFE
/* 4328 8001BB28 02000534 */  ori        $a1, $zero, 0x2
/* 432C 8001BB2C 086C000C */  jal        func_8001B020
/* 4330 8001BB30 21300000 */   addu      $a2, $zero, $zero
/* 4334 8001BB34 01000234 */  ori        $v0, $zero, 0x1
/* 4338 8001BB38 0480013C */  lui        $at, %hi(D_80047DE4)
/* 433C 8001BB3C E47D22AC */  sw         $v0, %lo(D_80047DE4)($at)
/* 4340 8001BB40 1000BF8F */  lw         $ra, 0x10($sp)
/* 4344 8001BB44 00000000 */  nop
/* 4348 8001BB48 0800E003 */  jr         $ra
/* 434C 8001BB4C 1800BD27 */   addiu     $sp, $sp, 0x18
