.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C5F4
/* 4DF4 8001C5F4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 4DF8 8001C5F8 1400BFAF */  sw         $ra, 0x14($sp)
/* 4DFC 8001C5FC 1000B0AF */  sw         $s0, 0x10($sp)
/* 4E00 8001C600 21108000 */  addu       $v0, $a0, $zero
/* 4E04 8001C604 0580043C */  lui        $a0, %hi(D_80048068)
/* 4E08 8001C608 68808424 */  addiu      $a0, $a0, %lo(D_80048068)
/* 4E0C 8001C60C C2820500 */  srl        $s0, $a1, 11
/* 4E10 8001C610 0671000C */  jal        func_8001C418
/* 4E14 8001C614 21284000 */   addu      $a1, $v0, $zero
/* 4E18 8001C618 10004010 */  beqz       $v0, .L8001C65C
/* 4E1C 8001C61C 00000000 */   nop
/* 4E20 8001C620 0580043C */  lui        $a0, %hi(D_80048068)
/* 4E24 8001C624 68808424 */  addiu      $a0, $a0, %lo(D_80048068)
/* 4E28 8001C628 C6A2000C */  jal        func_80028B18
/* 4E2C 8001C62C 00000000 */   nop
/* 4E30 8001C630 0580053C */  lui        $a1, %hi(D_80048068)
/* 4E34 8001C634 6880A524 */  addiu      $a1, $a1, %lo(D_80048068)
/* 4E38 8001C638 85A2000C */  jal        func_80028A14
/* 4E3C 8001C63C 21200202 */   addu      $a0, $s0, $v0
/* 4E40 8001C640 15000434 */  ori        $a0, $zero, 0x15
/* 4E44 8001C644 0580053C */  lui        $a1, %hi(D_80048068)
/* 4E48 8001C648 6880A524 */  addiu      $a1, $a1, %lo(D_80048068)
/* 4E4C 8001C64C 086C000C */  jal        func_8001B020
/* 4E50 8001C650 21300000 */   addu      $a2, $zero, $zero
/* 4E54 8001C654 98710008 */  j          .L8001C660
/* 4E58 8001C658 21100000 */   addu      $v0, $zero, $zero
.L8001C65C:
/* 4E5C 8001C65C FEFF0224 */  addiu      $v0, $zero, -0x2
.L8001C660:
/* 4E60 8001C660 1400BF8F */  lw         $ra, 0x14($sp)
/* 4E64 8001C664 1000B08F */  lw         $s0, 0x10($sp)
/* 4E68 8001C668 0800E003 */  jr         $ra
/* 4E6C 8001C66C 1800BD27 */   addiu     $sp, $sp, 0x18
