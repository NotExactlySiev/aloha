.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C4F0
/* 4CF0 8001C4F0 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* 4CF4 8001C4F4 3000BFAF */  sw         $ra, 0x30($sp)
/* 4CF8 8001C4F8 2C00B1AF */  sw         $s1, 0x2C($sp)
/* 4CFC 8001C4FC 2800B0AF */  sw         $s0, 0x28($sp)
/* 4D00 8001C500 21808000 */  addu       $s0, $a0, $zero
/* 4D04 8001C504 DF69000C */  jal        func_8001A77C
/* 4D08 8001C508 2188A000 */   addu      $s1, $a1, $zero
/* 4D0C 8001C50C 536E000C */  jal        func_8001B94C
/* 4D10 8001C510 00000000 */   nop
/* 4D14 8001C514 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 4D18 8001C518 03004314 */  bne        $v0, $v1, .L8001C528
/* 4D1C 8001C51C 1000A427 */   addiu     $a0, $sp, 0x10
/* 4D20 8001C520 54710008 */  j          .L8001C550
/* 4D24 8001C524 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001C528:
/* 4D28 8001C528 0671000C */  jal        func_8001C418
/* 4D2C 8001C52C 21280002 */   addu      $a1, $s0, $zero
/* 4D30 8001C530 07004010 */  beqz       $v0, .L8001C550
/* 4D34 8001C534 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 4D38 8001C538 1300A28B */  lwl        $v0, 0x13($sp)
/* 4D3C 8001C53C 1000A29B */  lwr        $v0, 0x10($sp)
/* 4D40 8001C540 00000000 */  nop
/* 4D44 8001C544 030022AA */  swl        $v0, 0x3($s1)
/* 4D48 8001C548 000022BA */  swr        $v0, 0x0($s1)
/* 4D4C 8001C54C 21100000 */  addu       $v0, $zero, $zero
.L8001C550:
/* 4D50 8001C550 3000BF8F */  lw         $ra, 0x30($sp)
/* 4D54 8001C554 2C00B18F */  lw         $s1, 0x2C($sp)
/* 4D58 8001C558 2800B08F */  lw         $s0, 0x28($sp)
/* 4D5C 8001C55C 0800E003 */  jr         $ra
/* 4D60 8001C560 3800BD27 */   addiu     $sp, $sp, 0x38
