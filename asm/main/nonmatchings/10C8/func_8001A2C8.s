.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A2C8
/* 2AC8 8001A2C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2ACC 8001A2CC 1400BFAF */  sw         $ra, 0x14($sp)
/* 2AD0 8001A2D0 D5A1000C */  jal        func_80028754
/* 2AD4 8001A2D4 1000B0AF */   sw        $s0, 0x10($sp)
/* 2AD8 8001A2D8 21804000 */  addu       $s0, $v0, $zero
/* 2ADC 8001A2DC FFFF0224 */  addiu      $v0, $zero, -0x1
/* 2AE0 8001A2E0 05000216 */  bne        $s0, $v0, .L8001A2F8
/* 2AE4 8001A2E4 00000000 */   nop
/* 2AE8 8001A2E8 0480013C */  lui        $at, %hi(D_80047EE4)
/* 2AEC 8001A2EC E47E20AC */  sw         $zero, %lo(D_80047EE4)($at)
/* 2AF0 8001A2F0 0575000C */  jal        func_8001D414
/* 2AF4 8001A2F4 00000000 */   nop
.L8001A2F8:
/* 2AF8 8001A2F8 03000006 */  bltz       $s0, .L8001A308
/* 2AFC 8001A2FC 00000000 */   nop
/* 2B00 8001A300 6466000C */  jal        func_80019990
/* 2B04 8001A304 00000000 */   nop
.L8001A308:
/* 2B08 8001A308 1400BF8F */  lw         $ra, 0x14($sp)
/* 2B0C 8001A30C 1000B08F */  lw         $s0, 0x10($sp)
/* 2B10 8001A310 0800E003 */  jr         $ra
/* 2B14 8001A314 1800BD27 */   addiu     $sp, $sp, 0x18
