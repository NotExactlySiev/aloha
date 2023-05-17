.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D440
/* 5C40 8001D440 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 5C44 8001D444 3000BFAF */  sw         $ra, 0x30($sp)
/* 5C48 8001D448 2C00B7AF */  sw         $s7, 0x2C($sp)
/* 5C4C 8001D44C 2800B6AF */  sw         $s6, 0x28($sp)
/* 5C50 8001D450 2400B5AF */  sw         $s5, 0x24($sp)
/* 5C54 8001D454 2000B4AF */  sw         $s4, 0x20($sp)
/* 5C58 8001D458 1C00B3AF */  sw         $s3, 0x1C($sp)
/* 5C5C 8001D45C 1800B2AF */  sw         $s2, 0x18($sp)
/* 5C60 8001D460 1400B1AF */  sw         $s1, 0x14($sp)
/* 5C64 8001D464 1000B0AF */  sw         $s0, 0x10($sp)
/* 5C68 8001D468 21A88000 */  addu       $s5, $a0, $zero
/* 5C6C 8001D46C 21A0A000 */  addu       $s4, $a1, $zero
/* 5C70 8001D470 21B80000 */  addu       $s7, $zero, $zero
/* 5C74 8001D474 21800000 */  addu       $s0, $zero, $zero
/* 5C78 8001D478 0580163C */  lui        $s6, %hi(D_80048094)
/* 5C7C 8001D47C 9480D626 */  addiu      $s6, $s6, %lo(D_80048094)
/* 5C80 8001D480 FCFFD326 */  addiu      $s3, $s6, -0x4
/* 5C84 8001D484 2190C002 */  addu       $s2, $s6, $zero
/* 5C88 8001D488 21880000 */  addu       $s1, $zero, $zero
.L8001D48C:
/* 5C8C 8001D48C 0580013C */  lui        $at, %hi(D_80048090)
/* 5C90 8001D490 90802124 */  addiu      $at, $at, %lo(D_80048090)
/* 5C94 8001D494 21083100 */  addu       $at, $at, $s1
/* 5C98 8001D498 0000228C */  lw         $v0, 0x0($at)
/* 5C9C 8001D49C 00000000 */  nop
/* 5CA0 8001D4A0 0F004010 */  beqz       $v0, .L8001D4E0
/* 5CA4 8001D4A4 03000434 */   ori       $a0, $zero, 0x3
/* 5CA8 8001D4A8 2128A002 */  addu       $a1, $s5, $zero
/* 5CAC 8001D4AC 188C000C */  jal        func_80023060
/* 5CB0 8001D4B0 21304002 */   addu      $a2, $s2, $zero
/* 5CB4 8001D4B4 01000334 */  ori        $v1, $zero, 0x1
/* 5CB8 8001D4B8 09004314 */  bne        $v0, $v1, .L8001D4E0
/* 5CBC 8001D4BC 00080434 */   ori       $a0, $zero, 0x800
/* 5CC0 8001D4C0 0400C526 */  addiu      $a1, $s6, 0x4
/* 5CC4 8001D4C4 21282502 */  addu       $a1, $s1, $a1
/* 5CC8 8001D4C8 288C000C */  jal        func_800230A0
/* 5CCC 8001D4CC 21308002 */   addu      $a2, $s4, $zero
/* 5CD0 8001D4D0 E674000C */  jal        func_8001D398
/* 5CD4 8001D4D4 21206002 */   addu      $a0, $s3, $zero
/* 5CD8 8001D4D8 94750008 */  j          .L8001D650
/* 5CDC 8001D4DC 01000234 */   ori       $v0, $zero, 0x1
.L8001D4E0:
/* 5CE0 8001D4E0 08087326 */  addiu      $s3, $s3, 0x808
/* 5CE4 8001D4E4 08085226 */  addiu      $s2, $s2, 0x808
/* 5CE8 8001D4E8 01001026 */  addiu      $s0, $s0, 0x1
/* 5CEC 8001D4EC 0A00022A */  slti       $v0, $s0, 0xA
/* 5CF0 8001D4F0 E6FF4014 */  bnez       $v0, .L8001D48C
/* 5CF4 8001D4F4 08083126 */   addiu     $s1, $s1, 0x808
/* 5CF8 8001D4F8 21200000 */  addu       $a0, $zero, $zero
/* 5CFC 8001D4FC 81A0000C */  jal        func_80028204
/* 5D00 8001D500 21280000 */   addu      $a1, $zero, $zero
/* 5D04 8001D504 FFFF1024 */  addiu      $s0, $zero, -0x1
/* 5D08 8001D508 02000434 */  ori        $a0, $zero, 0x2
.L8001D50C:
/* 5D0C 8001D50C 2128A002 */  addu       $a1, $s5, $zero
/* 5D10 8001D510 5B68000C */  jal        func_8001A16C
/* 5D14 8001D514 21300000 */   addu      $a2, $zero, $zero
/* 5D18 8001D518 01000434 */  ori        $a0, $zero, 0x1
/* 5D1C 8001D51C 21288002 */  addu       $a1, $s4, $zero
/* 5D20 8001D520 9C68000C */  jal        func_8001A270
/* 5D24 8001D524 80000634 */   ori       $a2, $zero, 0x80
/* 5D28 8001D528 21200000 */  addu       $a0, $zero, $zero
/* 5D2C 8001D52C B268000C */  jal        func_8001A2C8
/* 5D30 8001D530 21280000 */   addu      $a1, $zero, $zero
/* 5D34 8001D534 F5FF5010 */  beq        $v0, $s0, .L8001D50C
/* 5D38 8001D538 02000434 */   ori       $a0, $zero, 0x2
/* 5D3C 8001D53C 09000434 */  ori        $a0, $zero, 0x9
/* 5D40 8001D540 21280000 */  addu       $a1, $zero, $zero
/* 5D44 8001D544 5B68000C */  jal        func_8001A16C
/* 5D48 8001D548 21300000 */   addu      $a2, $zero, $zero
/* 5D4C 8001D54C 0580123C */  lui        $s2, %hi(D_80048098)
/* 5D50 8001D550 98805226 */  addiu      $s2, $s2, %lo(D_80048098)
/* 5D54 8001D554 FCFF5126 */  addiu      $s1, $s2, -0x4
/* 5D58 8001D558 21304002 */  addu       $a2, $s2, $zero
/* 5D5C 8001D55C 21800000 */  addu       $s0, $zero, $zero
.L8001D560:
/* 5D60 8001D560 0580013C */  lui        $at, %hi(D_80048090)
/* 5D64 8001D564 90802124 */  addiu      $at, $at, %lo(D_80048090)
/* 5D68 8001D568 21083000 */  addu       $at, $at, $s0
/* 5D6C 8001D56C 0000228C */  lw         $v0, 0x0($at)
/* 5D70 8001D570 00000000 */  nop
/* 5D74 8001D574 0C004014 */  bnez       $v0, .L8001D5A8
/* 5D78 8001D578 00080434 */   ori       $a0, $zero, 0x800
/* 5D7C 8001D57C 288C000C */  jal        func_800230A0
/* 5D80 8001D580 21288002 */   addu      $a1, $s4, $zero
/* 5D84 8001D584 F8FF4426 */  addiu      $a0, $s2, -0x8
/* 5D88 8001D588 E674000C */  jal        func_8001D398
/* 5D8C 8001D58C 21200402 */   addu      $a0, $s0, $a0
/* 5D90 8001D590 0300A28A */  lwl        $v0, 0x3($s5)
/* 5D94 8001D594 0000A29A */  lwr        $v0, 0x0($s5)
/* 5D98 8001D598 00000000 */  nop
/* 5D9C 8001D59C 030022AA */  swl        $v0, 0x3($s1)
/* 5DA0 8001D5A0 93750008 */  j          .L8001D64C
/* 5DA4 8001D5A4 000022BA */   swr       $v0, 0x0($s1)
.L8001D5A8:
/* 5DA8 8001D5A8 08083126 */  addiu      $s1, $s1, 0x808
/* 5DAC 8001D5AC 08081026 */  addiu      $s0, $s0, 0x808
/* 5DB0 8001D5B0 5050022A */  slti       $v0, $s0, 0x5050
/* 5DB4 8001D5B4 EAFF4014 */  bnez       $v0, .L8001D560
/* 5DB8 8001D5B8 0808C624 */   addiu     $a2, $a2, 0x808
/* 5DBC 8001D5BC FFFF0524 */  addiu      $a1, $zero, -0x1
/* 5DC0 8001D5C0 21800000 */  addu       $s0, $zero, $zero
/* 5DC4 8001D5C4 21200000 */  addu       $a0, $zero, $zero
.L8001D5C8:
/* 5DC8 8001D5C8 0580013C */  lui        $at, %hi(D_80048090)
/* 5DCC 8001D5CC 90802124 */  addiu      $at, $at, %lo(D_80048090)
/* 5DD0 8001D5D0 21082400 */  addu       $at, $at, $a0
/* 5DD4 8001D5D4 0000238C */  lw         $v1, 0x0($at)
/* 5DD8 8001D5D8 00000000 */  nop
/* 5DDC 8001D5DC 2B106500 */  sltu       $v0, $v1, $a1
/* 5DE0 8001D5E0 03004010 */  beqz       $v0, .L8001D5F0
/* 5DE4 8001D5E4 08088424 */   addiu     $a0, $a0, 0x808
/* 5DE8 8001D5E8 21B80002 */  addu       $s7, $s0, $zero
/* 5DEC 8001D5EC 21286000 */  addu       $a1, $v1, $zero
.L8001D5F0:
/* 5DF0 8001D5F0 01001026 */  addiu      $s0, $s0, 0x1
/* 5DF4 8001D5F4 0A00022A */  slti       $v0, $s0, 0xA
/* 5DF8 8001D5F8 F3FF4014 */  bnez       $v0, .L8001D5C8
/* 5DFC 8001D5FC 00000000 */   nop
/* 5E00 8001D600 00821700 */  sll        $s0, $s7, 8
/* 5E04 8001D604 21801702 */  addu       $s0, $s0, $s7
/* 5E08 8001D608 00080434 */  ori        $a0, $zero, 0x800
/* 5E0C 8001D60C 21288002 */  addu       $a1, $s4, $zero
/* 5E10 8001D610 C0801000 */  sll        $s0, $s0, 3
/* 5E14 8001D614 0580113C */  lui        $s1, %hi(D_80048098)
/* 5E18 8001D618 98803126 */  addiu      $s1, $s1, %lo(D_80048098)
/* 5E1C 8001D61C 288C000C */  jal        func_800230A0
/* 5E20 8001D620 21301102 */   addu      $a2, $s0, $s1
/* 5E24 8001D624 FCFF2226 */  addiu      $v0, $s1, -0x4
/* 5E28 8001D628 21100202 */  addu       $v0, $s0, $v0
/* 5E2C 8001D62C 0300A38A */  lwl        $v1, 0x3($s5)
/* 5E30 8001D630 0000A39A */  lwr        $v1, 0x0($s5)
/* 5E34 8001D634 00000000 */  nop
/* 5E38 8001D638 030043A8 */  swl        $v1, 0x3($v0)
/* 5E3C 8001D63C 000043B8 */  swr        $v1, 0x0($v0)
/* 5E40 8001D640 F8FF3126 */  addiu      $s1, $s1, -0x8
/* 5E44 8001D644 E674000C */  jal        func_8001D398
/* 5E48 8001D648 21201102 */   addu      $a0, $s0, $s1
.L8001D64C:
/* 5E4C 8001D64C 01000234 */  ori        $v0, $zero, 0x1
.L8001D650:
/* 5E50 8001D650 3000BF8F */  lw         $ra, 0x30($sp)
/* 5E54 8001D654 2C00B78F */  lw         $s7, 0x2C($sp)
/* 5E58 8001D658 2800B68F */  lw         $s6, 0x28($sp)
/* 5E5C 8001D65C 2400B58F */  lw         $s5, 0x24($sp)
/* 5E60 8001D660 2000B48F */  lw         $s4, 0x20($sp)
/* 5E64 8001D664 1C00B38F */  lw         $s3, 0x1C($sp)
/* 5E68 8001D668 1800B28F */  lw         $s2, 0x18($sp)
/* 5E6C 8001D66C 1400B18F */  lw         $s1, 0x14($sp)
/* 5E70 8001D670 1000B08F */  lw         $s0, 0x10($sp)
/* 5E74 8001D674 0800E003 */  jr         $ra
/* 5E78 8001D678 3800BD27 */   addiu     $sp, $sp, 0x38
