.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AA80
/* 3280 8001AA80 0480023C */  lui        $v0, %hi(D_80047ED4)
/* 3284 8001AA84 D47E428C */  lw         $v0, %lo(D_80047ED4)($v0)
/* 3288 8001AA88 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 328C 8001AA8C 3A004014 */  bnez       $v0, .L8001AB78
/* 3290 8001AA90 1000BFAF */   sw        $ra, 0x10($sp)
/* 3294 8001AA94 0480033C */  lui        $v1, %hi(D_80047DC0)
/* 3298 8001AA98 C07D638C */  lw         $v1, %lo(D_80047DC0)($v1)
/* 329C 8001AA9C 01000234 */  ori        $v0, $zero, 0x1
/* 32A0 8001AAA0 35006214 */  bne        $v1, $v0, .L8001AB78
/* 32A4 8001AAA4 00000000 */   nop
/* 32A8 8001AAA8 0480023C */  lui        $v0, %hi(D_80047DD4)
/* 32AC 8001AAAC D47D428C */  lw         $v0, %lo(D_80047DD4)($v0)
/* 32B0 8001AAB0 0480033C */  lui        $v1, %hi(D_80047DD0)
/* 32B4 8001AAB4 D07D638C */  lw         $v1, %lo(D_80047DD0)($v1)
/* 32B8 8001AAB8 00000000 */  nop
/* 32BC 8001AABC 2A104300 */  slt        $v0, $v0, $v1
/* 32C0 8001AAC0 11004010 */  beqz       $v0, .L8001AB08
/* 32C4 8001AAC4 00000000 */   nop
/* 32C8 8001AAC8 0480053C */  lui        $a1, %hi(D_80047DD4)
/* 32CC 8001AACC D47DA58C */  lw         $a1, %lo(D_80047DD4)($a1)
/* 32D0 8001AAD0 0480043C */  lui        $a0, %hi(D_80047E9C)
/* 32D4 8001AAD4 9C7E8424 */  addiu      $a0, $a0, %lo(D_80047E9C)
/* 32D8 8001AAD8 286A000C */  jal        func_8001A8A0
/* 32DC 8001AADC 00000000 */   nop
/* 32E0 8001AAE0 0480023C */  lui        $v0, %hi(D_80047DD4)
/* 32E4 8001AAE4 D47D428C */  lw         $v0, %lo(D_80047DD4)($v0)
/* 32E8 8001AAE8 0480033C */  lui        $v1, %hi(D_80047DC4)
/* 32EC 8001AAEC C47D638C */  lw         $v1, %lo(D_80047DC4)($v1)
/* 32F0 8001AAF0 00000000 */  nop
/* 32F4 8001AAF4 21104300 */  addu       $v0, $v0, $v1
/* 32F8 8001AAF8 0480013C */  lui        $at, %hi(D_80047DD4)
/* 32FC 8001AAFC D47D22AC */  sw         $v0, %lo(D_80047DD4)($at)
/* 3300 8001AB00 DE6A0008 */  j          .L8001AB78
/* 3304 8001AB04 00000000 */   nop
.L8001AB08:
/* 3308 8001AB08 0480043C */  lui        $a0, %hi(D_80047F04)
/* 330C 8001AB0C 047F848C */  lw         $a0, %lo(D_80047F04)($a0)
/* 3310 8001AB10 988C000C */  jal        func_80023260
/* 3314 8001AB14 00000000 */   nop
/* 3318 8001AB18 0480023C */  lui        $v0, %hi(D_80047DD0)
/* 331C 8001AB1C D07D428C */  lw         $v0, %lo(D_80047DD0)($v0)
/* 3320 8001AB20 0480033C */  lui        $v1, %hi(D_80047F14)
/* 3324 8001AB24 147F638C */  lw         $v1, %lo(D_80047F14)($v1)
/* 3328 8001AB28 0480013C */  lui        $at, %hi(D_80047DD4)
/* 332C 8001AB2C D47D22AC */  sw         $v0, %lo(D_80047DD4)($at)
/* 3330 8001AB30 0480013C */  lui        $at, %hi(D_80047DC0)
/* 3334 8001AB34 C07D20AC */  sw         $zero, %lo(D_80047DC0)($at)
/* 3338 8001AB38 0480013C */  lui        $at, %hi(D_80047DBC)
/* 333C 8001AB3C BC7D20AC */  sw         $zero, %lo(D_80047DBC)($at)
/* 3340 8001AB40 0480013C */  lui        $at, %hi(D_80047DB4)
/* 3344 8001AB44 B47D20AC */  sw         $zero, %lo(D_80047DB4)($at)
/* 3348 8001AB48 03006010 */  beqz       $v1, .L8001AB58
/* 334C 8001AB4C 00000000 */   nop
/* 3350 8001AB50 09F86000 */  jalr       $v1
/* 3354 8001AB54 00000000 */   nop
.L8001AB58:
/* 3358 8001AB58 0480013C */  lui        $at, %hi(D_80047F14)
/* 335C 8001AB5C 147F20AC */  sw         $zero, %lo(D_80047F14)($at)
/* 3360 8001AB60 0480053C */  lui        $a1, %hi(D_80047DD4)
/* 3364 8001AB64 D47DA58C */  lw         $a1, %lo(D_80047DD4)($a1)
/* 3368 8001AB68 0480043C */  lui        $a0, %hi(D_80047E9C)
/* 336C 8001AB6C 9C7E8424 */  addiu      $a0, $a0, %lo(D_80047E9C)
/* 3370 8001AB70 286A000C */  jal        func_8001A8A0
/* 3374 8001AB74 00000000 */   nop
.L8001AB78:
/* 3378 8001AB78 1000BF8F */  lw         $ra, 0x10($sp)
/* 337C 8001AB7C 00000000 */  nop
/* 3380 8001AB80 0800E003 */  jr         $ra
/* 3384 8001AB84 1800BD27 */   addiu     $sp, $sp, 0x18
