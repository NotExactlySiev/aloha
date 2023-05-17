.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027374
/* FB74 80027374 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* FB78 80027378 1000B0AF */  sw         $s0, 0x10($sp)
/* FB7C 8002737C 21808000 */  addu       $s0, $a0, $zero
/* FB80 80027380 21200000 */  addu       $a0, $zero, $zero
/* FB84 80027384 1800BFAF */  sw         $ra, 0x18($sp)
/* FB88 80027388 0FAE000C */  jal        func_8002B83C
/* FB8C 8002738C 1400B1AF */   sw        $s1, 0x14($sp)
/* FB90 80027390 02000434 */  ori        $a0, $zero, 0x2
/* FB94 80027394 21884000 */  addu       $s1, $v0, $zero
/* FB98 80027398 E0AD000C */  jal        func_8002B780
/* FB9C 8002739C 21280000 */   addu      $a1, $zero, $zero
/* FBA0 800273A0 21200000 */  addu       $a0, $zero, $zero
/* FBA4 800273A4 0480013C */  lui        $at, %hi(D_80046F1C)
/* FBA8 800273A8 1C6F20AC */  sw         $zero, %lo(D_80046F1C)($at)
/* FBAC 800273AC 0480023C */  lui        $v0, %hi(D_80046F1C)
/* FBB0 800273B0 1C6F428C */  lw         $v0, %lo(D_80046F1C)($v0)
/* FBB4 800273B4 21180000 */  addu       $v1, $zero, $zero
/* FBB8 800273B8 0480013C */  lui        $at, %hi(D_80046F18)
/* FBBC 800273BC 186F22AC */  sw         $v0, %lo(D_80046F18)($at)
.L800273C0:
/* FBC0 800273C0 0580013C */  lui        $at, %hi(D_8005237C)
/* FBC4 800273C4 7C232124 */  addiu      $at, $at, %lo(D_8005237C)
/* FBC8 800273C8 21082300 */  addu       $at, $at, $v1
/* FBCC 800273CC 000020AC */  sw         $zero, 0x0($at)
/* FBD0 800273D0 01008424 */  addiu      $a0, $a0, 0x1
/* FBD4 800273D4 40008228 */  slti       $v0, $a0, 0x40
/* FBD8 800273D8 F9FF4014 */  bnez       $v0, .L800273C0
/* FBDC 800273DC 4C006324 */   addiu     $v1, $v1, 0x4C
/* FBE0 800273E0 05000012 */  beqz       $s0, .L800273F8
/* FBE4 800273E4 01000234 */   ori       $v0, $zero, 0x1
/* FBE8 800273E8 14000212 */  beq        $s0, $v0, .L8002743C
/* FBEC 800273EC 01040234 */   ori       $v0, $zero, 0x401
/* FBF0 800273F0 239D0008 */  j          .L8002748C
/* FBF4 800273F4 00E1053C */   lui       $a1, (0xE1001000 >> 16)
.L800273F8:
/* FBF8 800273F8 0480033C */  lui        $v1, %hi(D_80046F04)
/* FBFC 800273FC 046F638C */  lw         $v1, %lo(D_80046F04)($v1)
/* FC00 80027400 01040234 */  ori        $v0, $zero, 0x401
/* FC04 80027404 000062AC */  sw         $v0, 0x0($v1)
/* FC08 80027408 0480033C */  lui        $v1, %hi(D_80046F14)
/* FC0C 8002740C 146F638C */  lw         $v1, %lo(D_80046F14)($v1)
/* FC10 80027410 00000000 */  nop
/* FC14 80027414 0000628C */  lw         $v0, 0x0($v1)
/* FC18 80027418 00000000 */  nop
/* FC1C 8002741C 00084234 */  ori        $v0, $v0, 0x800
/* FC20 80027420 000062AC */  sw         $v0, 0x0($v1)
/* FC24 80027424 0480023C */  lui        $v0, %hi(D_80046EF8)
/* FC28 80027428 F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* FC2C 8002742C 00000000 */  nop
/* FC30 80027430 000040AC */  sw         $zero, 0x0($v0)
/* FC34 80027434 239D0008 */  j          .L8002748C
/* FC38 80027438 00E1053C */   lui       $a1, (0xE1001000 >> 16)
.L8002743C:
/* FC3C 8002743C 0480033C */  lui        $v1, %hi(D_80046F04)
/* FC40 80027440 046F638C */  lw         $v1, %lo(D_80046F04)($v1)
/* FC44 80027444 00000000 */  nop
/* FC48 80027448 000062AC */  sw         $v0, 0x0($v1)
/* FC4C 8002744C 0480033C */  lui        $v1, %hi(D_80046F14)
/* FC50 80027450 146F638C */  lw         $v1, %lo(D_80046F14)($v1)
/* FC54 80027454 00000000 */  nop
/* FC58 80027458 0000628C */  lw         $v0, 0x0($v1)
/* FC5C 8002745C 00000000 */  nop
/* FC60 80027460 00084234 */  ori        $v0, $v0, 0x800
/* FC64 80027464 000062AC */  sw         $v0, 0x0($v1)
/* FC68 80027468 0480033C */  lui        $v1, %hi(D_80046EF8)
/* FC6C 8002746C F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* FC70 80027470 0002023C */  lui        $v0, (0x2000000 >> 16)
/* FC74 80027474 000062AC */  sw         $v0, 0x0($v1)
/* FC78 80027478 0480033C */  lui        $v1, %hi(D_80046EF8)
/* FC7C 8002747C F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* FC80 80027480 0001023C */  lui        $v0, (0x1000000 >> 16)
/* FC84 80027484 000062AC */  sw         $v0, 0x0($v1)
/* FC88 80027488 00E1053C */  lui        $a1, (0xE1001000 >> 16)
.L8002748C:
/* FC8C 8002748C 0010A534 */  ori        $a1, $a1, (0xE1001000 & 0xFFFF)
/* FC90 80027490 0480023C */  lui        $v0, %hi(D_80046EF8)
/* FC94 80027494 F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* FC98 80027498 21202002 */  addu       $a0, $s1, $zero
/* FC9C 8002749C 0000428C */  lw         $v0, 0x0($v0)
/* FCA0 800274A0 0480033C */  lui        $v1, %hi(D_80046EF4)
/* FCA4 800274A4 F46E638C */  lw         $v1, %lo(D_80046EF4)($v1)
/* FCA8 800274A8 FF3F4230 */  andi       $v0, $v0, 0x3FFF
/* FCAC 800274AC 25104500 */  or         $v0, $v0, $a1
/* FCB0 800274B0 000062AC */  sw         $v0, 0x0($v1)
/* FCB4 800274B4 0FAE000C */  jal        func_8002B83C
/* FCB8 800274B8 00000000 */   nop
/* FCBC 800274BC 0480023C */  lui        $v0, %hi(D_80046EF8)
/* FCC0 800274C0 F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* FCC4 800274C4 00000000 */  nop
/* FCC8 800274C8 0000428C */  lw         $v0, 0x0($v0)
/* FCCC 800274CC 00000000 */  nop
/* FCD0 800274D0 02130200 */  srl        $v0, $v0, 12
/* FCD4 800274D4 01004230 */  andi       $v0, $v0, 0x1
/* FCD8 800274D8 1800BF8F */  lw         $ra, 0x18($sp)
/* FCDC 800274DC 1400B18F */  lw         $s1, 0x14($sp)
/* FCE0 800274E0 1000B08F */  lw         $s0, 0x10($sp)
/* FCE4 800274E4 2000BD27 */  addiu      $sp, $sp, 0x20
/* FCE8 800274E8 0800E003 */  jr         $ra
/* FCEC 800274EC 00000000 */   nop
