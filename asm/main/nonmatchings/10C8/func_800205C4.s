.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800205C4
/* 8DC4 800205C4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8DC8 800205C8 1400BFAF */  sw         $ra, 0x14($sp)
/* 8DCC 800205CC 1000B0AF */  sw         $s0, 0x10($sp)
/* 8DD0 800205D0 2180C000 */  addu       $s0, $a2, $zero
/* 8DD4 800205D4 0580063C */  lui        $a2, %hi(D_800521F8)
/* 8DD8 800205D8 F821C624 */  addiu      $a2, $a2, %lo(D_800521F8)
/* 8DDC 800205DC 0880000C */  jal        func_80020020
/* 8DE0 800205E0 00000000 */   nop
/* 8DE4 800205E4 01000334 */  ori        $v1, $zero, 0x1
/* 8DE8 800205E8 05004314 */  bne        $v0, $v1, .L80020600
/* 8DEC 800205EC FFFF0224 */   addiu     $v0, $zero, -0x1
/* 8DF0 800205F0 0580043C */  lui        $a0, %hi(D_800521F8)
/* 8DF4 800205F4 F8218424 */  addiu      $a0, $a0, %lo(D_800521F8)
/* 8DF8 800205F8 0E8F000C */  jal        func_80023C38
/* 8DFC 800205FC 21280002 */   addu      $a1, $s0, $zero
.L80020600:
/* 8E00 80020600 1400BF8F */  lw         $ra, 0x14($sp)
/* 8E04 80020604 1000B08F */  lw         $s0, 0x10($sp)
/* 8E08 80020608 0800E003 */  jr         $ra
/* 8E0C 8002060C 1800BD27 */   addiu     $sp, $sp, 0x18
