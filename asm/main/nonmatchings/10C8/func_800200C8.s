.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800200C8
/* 88C8 800200C8 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 88CC 800200CC 3800BFAF */  sw         $ra, 0x38($sp)
/* 88D0 800200D0 0580063C */  lui        $a2, %hi(D_800521F8)
/* 88D4 800200D4 F821C624 */  addiu      $a2, $a2, %lo(D_800521F8)
/* 88D8 800200D8 0880000C */  jal        func_80020020
/* 88DC 800200DC 00000000 */   nop
/* 88E0 800200E0 21184000 */  addu       $v1, $v0, $zero
/* 88E4 800200E4 01000234 */  ori        $v0, $zero, 0x1
/* 88E8 800200E8 08006214 */  bne        $v1, $v0, .L8002010C
/* 88EC 800200EC 21106000 */   addu      $v0, $v1, $zero
/* 88F0 800200F0 0580043C */  lui        $a0, %hi(D_800521F8)
/* 88F4 800200F4 F8218424 */  addiu      $a0, $a0, %lo(D_800521F8)
/* 88F8 800200F8 0E8F000C */  jal        func_80023C38
/* 88FC 800200FC 1000A527 */   addiu     $a1, $sp, 0x10
/* 8900 80020100 1000A327 */  addiu      $v1, $sp, 0x10
/* 8904 80020104 26104300 */  xor        $v0, $v0, $v1
/* 8908 80020108 0100422C */  sltiu      $v0, $v0, 0x1
.L8002010C:
/* 890C 8002010C 3800BF8F */  lw         $ra, 0x38($sp)
/* 8910 80020110 00000000 */  nop
/* 8914 80020114 0800E003 */  jr         $ra
/* 8918 80020118 4000BD27 */   addiu     $sp, $sp, 0x40
