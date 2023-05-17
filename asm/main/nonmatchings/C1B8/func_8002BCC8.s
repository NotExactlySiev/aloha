.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BCC8
/* 144C8 8002BCC8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* 144CC 8002BCCC 08004001 */  jr         $t2
/* 144D0 8002BCD0 19000924 */   addiu     $t1, $zero, 0x19
/* 144D4 8002BCD4 00000000 */  nop
glabel func_8002BCD8
/* 144D8 8002BCD8 C0000A24 */  addiu      $t2, $zero, 0xC0
/* 144DC 8002BCDC 08004001 */  jr         $t2
/* 144E0 8002BCE0 0A000924 */   addiu     $t1, $zero, 0xA
/* 144E4 8002BCE4 00000000 */  nop
glabel func_8002BCE8
/* 144E8 8002BCE8 A0000A24 */  addiu      $t2, $zero, 0xA0
/* 144EC 8002BCEC 08004001 */  jr         $t2
/* 144F0 8002BCF0 72000924 */   addiu     $t1, $zero, 0x72
/* 144F4 8002BCF4 00000000 */  nop
glabel func_8002BCF8
/* 144F8 8002BCF8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* 144FC 8002BCFC 08004001 */  jr         $t2
/* 14500 8002BD00 17000924 */   addiu     $t1, $zero, 0x17
/* 14504 8002BD04 00000000 */  nop
glabel func_8002BD08
/* 14508 8002BD08 A0000A24 */  addiu      $t2, $zero, 0xA0
/* 1450C 8002BD0C 08004001 */  jr         $t2
/* 14510 8002BD10 13000924 */   addiu     $t1, $zero, 0x13
/* 14514 8002BD14 00000000 */  nop
glabel func_8002BD18
/* 14518 8002BD18 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1451C 8002BD1C 1000B0AF */  sw         $s0, 0x10($sp)
/* 14520 8002BD20 0480103C */  lui        $s0, %hi(D_800473BC)
/* 14524 8002BD24 BC731026 */  addiu      $s0, $s0, %lo(D_800473BC)
/* 14528 8002BD28 21200002 */  addu       $a0, $s0, $zero
/* 1452C 8002BD2C 1400BFAF */  sw         $ra, 0x14($sp)
/* 14530 8002BD30 0CB0000C */  jal        func_8002C030
/* 14534 8002BD34 09000534 */   ori       $a1, $zero, 0x9
/* 14538 8002BD38 03000434 */  ori        $a0, $zero, 0x3
/* 1453C 8002BD3C 0480023C */  lui        $v0, %hi(D_800473E0)
/* 14540 8002BD40 E073428C */  lw         $v0, %lo(D_800473E0)($v0)
/* 14544 8002BD44 0380053C */  lui        $a1, %hi(func_8002BDC4)
/* 14548 8002BD48 C4BDA524 */  addiu      $a1, $a1, %lo(func_8002BDC4)
/* 1454C 8002BD4C 000040AC */  sw         $zero, 0x0($v0)
/* 14550 8002BD50 D4AD000C */  jal        func_8002B750
/* 14554 8002BD54 00000000 */   nop
/* 14558 8002BD58 0380023C */  lui        $v0, %hi(func_8002BF28)
/* 1455C 8002BD5C 28BF4224 */  addiu      $v0, $v0, %lo(func_8002BF28)
/* 14560 8002BD60 01000334 */  ori        $v1, $zero, 0x1
/* 14564 8002BD64 000003A6 */  sh         $v1, 0x0($s0)
/* 14568 8002BD68 1400BF8F */  lw         $ra, 0x14($sp)
/* 1456C 8002BD6C 1000B08F */  lw         $s0, 0x10($sp)
/* 14570 8002BD70 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14574 8002BD74 0800E003 */  jr         $ra
/* 14578 8002BD78 00000000 */   nop
