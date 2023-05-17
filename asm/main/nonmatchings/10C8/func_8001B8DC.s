.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001B8DC
/* 40DC 8001B8DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 40E0 8001B8E0 1800BFAF */  sw         $ra, 0x18($sp)
/* 40E4 8001B8E4 1400B1AF */  sw         $s1, 0x14($sp)
/* 40E8 8001B8E8 1000B0AF */  sw         $s0, 0x10($sp)
/* 40EC 8001B8EC 0480023C */  lui        $v0, %hi(D_80047DDC)
/* 40F0 8001B8F0 DC7D428C */  lw         $v0, %lo(D_80047DDC)($v0)
/* 40F4 8001B8F4 00000000 */  nop
/* 40F8 8001B8F8 0B004014 */  bnez       $v0, .L8001B928
/* 40FC 8001B8FC 21800000 */   addu      $s0, $zero, $zero
/* 4100 8001B900 FFFF1124 */  addiu      $s1, $zero, -0x1
.L8001B904:
/* 4104 8001B904 286C000C */  jal        func_8001B0A0
/* 4108 8001B908 00000000 */   nop
/* 410C 8001B90C 0480033C */  lui        $v1, %hi(D_80047DDC)
/* 4110 8001B910 DC7D638C */  lw         $v1, %lo(D_80047DDC)($v1)
/* 4114 8001B914 00000000 */  nop
/* 4118 8001B918 03006014 */  bnez       $v1, .L8001B928
/* 411C 8001B91C 21804000 */   addu      $s0, $v0, $zero
/* 4120 8001B920 F8FF1116 */  bne        $s0, $s1, .L8001B904
/* 4124 8001B924 00000000 */   nop
.L8001B928:
/* 4128 8001B928 21200000 */  addu       $a0, $zero, $zero
/* 412C 8001B92C 81A0000C */  jal        func_80028204
/* 4130 8001B930 21280000 */   addu      $a1, $zero, $zero
/* 4134 8001B934 21100002 */  addu       $v0, $s0, $zero
/* 4138 8001B938 1800BF8F */  lw         $ra, 0x18($sp)
/* 413C 8001B93C 1400B18F */  lw         $s1, 0x14($sp)
/* 4140 8001B940 1000B08F */  lw         $s0, 0x10($sp)
/* 4144 8001B944 0800E003 */  jr         $ra
/* 4148 8001B948 2000BD27 */   addiu     $sp, $sp, 0x20
