.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A318
/* 2B18 8001A318 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2B1C 8001A31C 1400BFAF */  sw         $ra, 0x14($sp)
/* 2B20 8001A320 1000B0AF */  sw         $s0, 0x10($sp)
/* 2B24 8001A324 21808000 */  addu       $s0, $a0, $zero
.L8001A328:
/* 2B28 8001A328 B2A1000C */  jal        func_800286C8
/* 2B2C 8001A32C 21200002 */   addu      $a0, $s0, $zero
/* 2B30 8001A330 FDFF4010 */  beqz       $v0, .L8001A328
/* 2B34 8001A334 01000234 */   ori       $v0, $zero, 0x1
/* 2B38 8001A338 1400BF8F */  lw         $ra, 0x14($sp)
/* 2B3C 8001A33C 1000B08F */  lw         $s0, 0x10($sp)
/* 2B40 8001A340 0800E003 */  jr         $ra
/* 2B44 8001A344 1800BD27 */   addiu     $sp, $sp, 0x18
