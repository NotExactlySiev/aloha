.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A270
/* 2A70 8001A270 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2A74 8001A274 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 2A78 8001A278 1800B2AF */  sw         $s2, 0x18($sp)
/* 2A7C 8001A27C 1400B1AF */  sw         $s1, 0x14($sp)
/* 2A80 8001A280 1000B0AF */  sw         $s0, 0x10($sp)
/* 2A84 8001A284 21808000 */  addu       $s0, $a0, $zero
/* 2A88 8001A288 2188A000 */  addu       $s1, $a1, $zero
/* 2A8C 8001A28C 5266000C */  jal        func_80019948
/* 2A90 8001A290 2190C000 */   addu      $s2, $a2, $zero
/* 2A94 8001A294 21200002 */  addu       $a0, $s0, $zero
.L8001A298:
/* 2A98 8001A298 21282002 */  addu       $a1, $s1, $zero
/* 2A9C 8001A29C DDA1000C */  jal        func_80028774
/* 2AA0 8001A2A0 21304002 */   addu      $a2, $s2, $zero
/* 2AA4 8001A2A4 FCFF4010 */  beqz       $v0, .L8001A298
/* 2AA8 8001A2A8 21200002 */   addu      $a0, $s0, $zero
/* 2AAC 8001A2AC 01000234 */  ori        $v0, $zero, 0x1
/* 2AB0 8001A2B0 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 2AB4 8001A2B4 1800B28F */  lw         $s2, 0x18($sp)
/* 2AB8 8001A2B8 1400B18F */  lw         $s1, 0x14($sp)
/* 2ABC 8001A2BC 1000B08F */  lw         $s0, 0x10($sp)
/* 2AC0 8001A2C0 0800E003 */  jr         $ra
/* 2AC4 8001A2C4 2000BD27 */   addiu     $sp, $sp, 0x20
