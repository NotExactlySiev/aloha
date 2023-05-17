.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A22C
/* 2A2C 8001A22C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2A30 8001A230 1800BFAF */  sw         $ra, 0x18($sp)
/* 2A34 8001A234 1400B1AF */  sw         $s1, 0x14($sp)
/* 2A38 8001A238 1000B0AF */  sw         $s0, 0x10($sp)
/* 2A3C 8001A23C 21808000 */  addu       $s0, $a0, $zero
/* 2A40 8001A240 2188A000 */  addu       $s1, $a1, $zero
/* 2A44 8001A244 21200002 */  addu       $a0, $s0, $zero
.L8001A248:
/* 2A48 8001A248 BBA1000C */  jal        func_800286EC
/* 2A4C 8001A24C 21282002 */   addu      $a1, $s1, $zero
/* 2A50 8001A250 FDFF4010 */  beqz       $v0, .L8001A248
/* 2A54 8001A254 21200002 */   addu      $a0, $s0, $zero
/* 2A58 8001A258 01000234 */  ori        $v0, $zero, 0x1
/* 2A5C 8001A25C 1800BF8F */  lw         $ra, 0x18($sp)
/* 2A60 8001A260 1400B18F */  lw         $s1, 0x14($sp)
/* 2A64 8001A264 1000B08F */  lw         $s0, 0x10($sp)
/* 2A68 8001A268 0800E003 */  jr         $ra
/* 2A6C 8001A26C 2000BD27 */   addiu     $sp, $sp, 0x20
