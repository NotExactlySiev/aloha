.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002CBCC
/* 153CC 8002CBCC FFFF0524 */  addiu      $a1, $zero, -0x1
/* 153D0 8002CBD0 21180000 */  addu       $v1, $zero, $zero
/* 153D4 8002CBD4 01000634 */  ori        $a2, $zero, 0x1
/* 153D8 8002CBD8 04106600 */  sllv       $v0, $a2, $v1
.L8002CBDC:
/* 153DC 8002CBDC 24108200 */  and        $v0, $a0, $v0
/* 153E0 8002CBE0 0A004014 */  bnez       $v0, .L8002CC0C
/* 153E4 8002CBE4 00000000 */   nop
/* 153E8 8002CBE8 01006324 */  addiu      $v1, $v1, 0x1
/* 153EC 8002CBEC 18006228 */  slti       $v0, $v1, 0x18
/* 153F0 8002CBF0 FAFF4014 */  bnez       $v0, .L8002CBDC
/* 153F4 8002CBF4 04106600 */   sllv      $v0, $a2, $v1
.L8002CBF8:
/* 153F8 8002CBF8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 153FC 8002CBFC 0500A214 */  bne        $a1, $v0, .L8002CC14
/* 15400 8002CC00 00190500 */   sll       $v1, $a1, 4
/* 15404 8002CC04 16B30008 */  j          .L8002CC58
/* 15408 8002CC08 00000000 */   nop
.L8002CC0C:
/* 1540C 8002CC0C FEB20008 */  j          .L8002CBF8
/* 15410 8002CC10 21286000 */   addu      $a1, $v1, $zero
.L8002CC14:
/* 15414 8002CC14 0480023C */  lui        $v0, %hi(D_8004744C)
/* 15418 8002CC18 4C74428C */  lw         $v0, %lo(D_8004744C)($v0)
/* 1541C 8002CC1C 0480043C */  lui        $a0, %hi(D_800478F0)
/* 15420 8002CC20 F078848C */  lw         $a0, %lo(D_800478F0)($a0)
/* 15424 8002CC24 21186200 */  addu       $v1, $v1, $v0
/* 15428 8002CC28 01000234 */  ori        $v0, $zero, 0x1
/* 1542C 8002CC2C 0410A200 */  sllv       $v0, $v0, $a1
/* 15430 8002CC30 24104400 */  and        $v0, $v0, $a0
/* 15434 8002CC34 0C006394 */  lhu        $v1, 0xC($v1)
/* 15438 8002CC38 05004010 */  beqz       $v0, .L8002CC50
/* 1543C 8002CC3C 00000000 */   nop
/* 15440 8002CC40 05006010 */  beqz       $v1, .L8002CC58
/* 15444 8002CC44 03000234 */   ori       $v0, $zero, 0x3
/* 15448 8002CC48 16B30008 */  j          .L8002CC58
/* 1544C 8002CC4C 01000234 */   ori       $v0, $zero, 0x1
.L8002CC50:
/* 15450 8002CC50 2B100300 */  sltu       $v0, $zero, $v1
/* 15454 8002CC54 40100200 */  sll        $v0, $v0, 1
.L8002CC58:
/* 15458 8002CC58 0800E003 */  jr         $ra
/* 1545C 8002CC5C 00000000 */   nop
