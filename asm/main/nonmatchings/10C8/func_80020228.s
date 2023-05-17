.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020228
/* 8A28 80020228 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8A2C 8002022C 1000BFAF */  sw         $ra, 0x10($sp)
/* 8A30 80020230 0580063C */  lui        $a2, %hi(D_800521F8)
/* 8A34 80020234 F821C624 */  addiu      $a2, $a2, %lo(D_800521F8)
/* 8A38 80020238 0880000C */  jal        func_80020020
/* 8A3C 8002023C 00000000 */   nop
/* 8A40 80020240 01000334 */  ori        $v1, $zero, 0x1
/* 8A44 80020244 05004314 */  bne        $v0, $v1, .L8002025C
/* 8A48 80020248 21100000 */   addu      $v0, $zero, $zero
/* 8A4C 8002024C 0580043C */  lui        $a0, %hi(D_800521F8)
/* 8A50 80020250 F8218424 */  addiu      $a0, $a0, %lo(D_800521F8)
/* 8A54 80020254 868E000C */  jal        func_80023A18
/* 8A58 80020258 00000000 */   nop
.L8002025C:
/* 8A5C 8002025C 1000BF8F */  lw         $ra, 0x10($sp)
/* 8A60 80020260 00000000 */  nop
/* 8A64 80020264 0800E003 */  jr         $ra
/* 8A68 80020268 1800BD27 */   addiu     $sp, $sp, 0x18
