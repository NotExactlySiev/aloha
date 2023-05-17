.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A1CC
/* 29CC 8001A1CC D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 29D0 8001A1D0 2000BFAF */  sw         $ra, 0x20($sp)
/* 29D4 8001A1D4 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 29D8 8001A1D8 1800B2AF */  sw         $s2, 0x18($sp)
/* 29DC 8001A1DC 1400B1AF */  sw         $s1, 0x14($sp)
/* 29E0 8001A1E0 1000B0AF */  sw         $s0, 0x10($sp)
/* 29E4 8001A1E4 2188A000 */  addu       $s1, $a1, $zero
/* 29E8 8001A1E8 2190C000 */  addu       $s2, $a2, $zero
/* 29EC 8001A1EC 21808000 */  addu       $s0, $a0, $zero
/* 29F0 8001A1F0 01001334 */  ori        $s3, $zero, 0x1
/* 29F4 8001A1F4 FF000432 */  andi       $a0, $s0, 0xFF
.L8001A1F8:
/* 29F8 8001A1F8 21282002 */  addu       $a1, $s1, $zero
/* 29FC 8001A1FC 60A1000C */  jal        func_80028580
/* 2A00 8001A200 21304002 */   addu      $a2, $s2, $zero
/* 2A04 8001A204 FCFF5314 */  bne        $v0, $s3, .L8001A1F8
/* 2A08 8001A208 FF000432 */   andi      $a0, $s0, 0xFF
/* 2A0C 8001A20C 01000234 */  ori        $v0, $zero, 0x1
/* 2A10 8001A210 2000BF8F */  lw         $ra, 0x20($sp)
/* 2A14 8001A214 1C00B38F */  lw         $s3, 0x1C($sp)
/* 2A18 8001A218 1800B28F */  lw         $s2, 0x18($sp)
/* 2A1C 8001A21C 1400B18F */  lw         $s1, 0x14($sp)
/* 2A20 8001A220 1000B08F */  lw         $s0, 0x10($sp)
/* 2A24 8001A224 0800E003 */  jr         $ra
/* 2A28 8001A228 2800BD27 */   addiu     $sp, $sp, 0x28
