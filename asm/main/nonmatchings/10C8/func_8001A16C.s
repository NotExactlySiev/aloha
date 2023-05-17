.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A16C
/* 296C 8001A16C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 2970 8001A170 2000BFAF */  sw         $ra, 0x20($sp)
/* 2974 8001A174 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 2978 8001A178 1800B2AF */  sw         $s2, 0x18($sp)
/* 297C 8001A17C 1400B1AF */  sw         $s1, 0x14($sp)
/* 2980 8001A180 1000B0AF */  sw         $s0, 0x10($sp)
/* 2984 8001A184 2188A000 */  addu       $s1, $a1, $zero
/* 2988 8001A188 2190C000 */  addu       $s2, $a2, $zero
/* 298C 8001A18C 21808000 */  addu       $s0, $a0, $zero
/* 2990 8001A190 01001334 */  ori        $s3, $zero, 0x1
/* 2994 8001A194 FF000432 */  andi       $a0, $s0, 0xFF
.L8001A198:
/* 2998 8001A198 21282002 */  addu       $a1, $s1, $zero
/* 299C 8001A19C C5A0000C */  jal        func_80028314
/* 29A0 8001A1A0 21304002 */   addu      $a2, $s2, $zero
/* 29A4 8001A1A4 FCFF5314 */  bne        $v0, $s3, .L8001A198
/* 29A8 8001A1A8 FF000432 */   andi      $a0, $s0, 0xFF
/* 29AC 8001A1AC 01000234 */  ori        $v0, $zero, 0x1
/* 29B0 8001A1B0 2000BF8F */  lw         $ra, 0x20($sp)
/* 29B4 8001A1B4 1C00B38F */  lw         $s3, 0x1C($sp)
/* 29B8 8001A1B8 1800B28F */  lw         $s2, 0x18($sp)
/* 29BC 8001A1BC 1400B18F */  lw         $s1, 0x14($sp)
/* 29C0 8001A1C0 1000B08F */  lw         $s0, 0x10($sp)
/* 29C4 8001A1C4 0800E003 */  jr         $ra
/* 29C8 8001A1C8 2800BD27 */   addiu     $sp, $sp, 0x28
