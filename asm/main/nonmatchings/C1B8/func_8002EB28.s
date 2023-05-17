.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002EB28
/* 17328 8002EB28 0480033C */  lui        $v1, %hi(D_80047D08)
/* 1732C 8002EB2C 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 17330 8002EB30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 17334 8002EB34 1400BFAF */  sw         $ra, 0x14($sp)
/* 17338 8002EB38 1000B0AF */  sw         $s0, 0x10($sp)
/* 1733C 8002EB3C AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17340 8002EB40 2180A000 */  addu       $s0, $a1, $zero
/* 17344 8002EB44 CFFF4230 */  andi       $v0, $v0, 0xFFCF
/* 17348 8002EB48 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* 1734C 8002EB4C 0580033C */  lui        $v1, %hi(D_800546E4)
/* 17350 8002EB50 E446638C */  lw         $v1, %lo(D_800546E4)($v1)
/* 17354 8002EB54 01000234 */  ori        $v0, $zero, 0x1
/* 17358 8002EB58 05006214 */  bne        $v1, $v0, .L8002EB70
/* 1735C 8002EB5C 00000000 */   nop
/* 17360 8002EB60 08BC000C */  jal        func_8002F020
/* 17364 8002EB64 00000000 */   nop
/* 17368 8002EB68 DFBA0008 */  j          .L8002EB7C
/* 1736C 8002EB6C 21100002 */   addu      $v0, $s0, $zero
.L8002EB70:
/* 17370 8002EB70 E4BA000C */  jal        func_8002EB90
/* 17374 8002EB74 21280002 */   addu      $a1, $s0, $zero
/* 17378 8002EB78 21100002 */  addu       $v0, $s0, $zero
.L8002EB7C:
/* 1737C 8002EB7C 1400BF8F */  lw         $ra, 0x14($sp)
/* 17380 8002EB80 1000B08F */  lw         $s0, 0x10($sp)
/* 17384 8002EB84 1800BD27 */  addiu      $sp, $sp, 0x18
/* 17388 8002EB88 0800E003 */  jr         $ra
/* 1738C 8002EB8C 00000000 */   nop
