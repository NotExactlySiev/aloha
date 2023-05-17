.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025388
/* DB88 80025388 C8FFBD27 */  addiu      $sp, $sp, -0x38
/* DB8C 8002538C 3000B2AF */  sw         $s2, 0x30($sp)
/* DB90 80025390 21908000 */  addu       $s2, $a0, $zero
/* DB94 80025394 2C00B1AF */  sw         $s1, 0x2C($sp)
/* DB98 80025398 2188A000 */  addu       $s1, $a1, $zero
/* DB9C 8002539C 2800B0AF */  sw         $s0, 0x28($sp)
/* DBA0 800253A0 2180C000 */  addu       $s0, $a2, $zero
/* DBA4 800253A4 0280043C */  lui        $a0, %hi(D_8001833C)
/* DBA8 800253A8 3C838424 */  addiu      $a0, $a0, %lo(D_8001833C)
/* DBAC 800253AC 3400BFAF */  sw         $ra, 0x34($sp)
/* DBB0 800253B0 4594000C */  jal        func_80025114
/* DBB4 800253B4 21284002 */   addu      $a1, $s2, $zero
/* DBB8 800253B8 FF04023C */  lui        $v0, (0x4FFFFFF >> 16)
/* DBBC 800253BC FFFF4234 */  ori        $v0, $v0, (0x4FFFFFF & 0xFFFF)
/* DBC0 800253C0 1000A2AF */  sw         $v0, 0x10($sp)
/* DBC4 800253C4 0080023C */  lui        $v0, (0x80000000 >> 16)
/* DBC8 800253C8 00841000 */  sll        $s0, $s0, 16
/* DBCC 800253CC FFFF3132 */  andi       $s1, $s1, 0xFFFF
/* DBD0 800253D0 25801102 */  or         $s0, $s0, $s1
/* DBD4 800253D4 1400A2AF */  sw         $v0, 0x14($sp)
/* DBD8 800253D8 0000428E */  lw         $v0, 0x0($s2)
/* DBDC 800253DC 0480033C */  lui        $v1, %hi(D_80046ED8)
/* DBE0 800253E0 D86E638C */  lw         $v1, %lo(D_80046ED8)($v1)
/* DBE4 800253E4 1000A527 */  addiu      $a1, $sp, 0x10
/* DBE8 800253E8 1C00B0AF */  sw         $s0, 0x1C($sp)
/* DBEC 800253EC 1800A2AF */  sw         $v0, 0x18($sp)
/* DBF0 800253F0 0400428E */  lw         $v0, 0x4($s2)
/* DBF4 800253F4 14000634 */  ori        $a2, $zero, 0x14
/* DBF8 800253F8 2000A2AF */  sw         $v0, 0x20($sp)
/* DBFC 800253FC 1800648C */  lw         $a0, 0x18($v1)
/* DC00 80025400 0800628C */  lw         $v0, 0x8($v1)
/* DC04 80025404 00000000 */  nop
/* DC08 80025408 09F84000 */  jalr       $v0
/* DC0C 8002540C 21380000 */   addu      $a3, $zero, $zero
/* DC10 80025410 3400BF8F */  lw         $ra, 0x34($sp)
/* DC14 80025414 3000B28F */  lw         $s2, 0x30($sp)
/* DC18 80025418 2C00B18F */  lw         $s1, 0x2C($sp)
/* DC1C 8002541C 2800B08F */  lw         $s0, 0x28($sp)
/* DC20 80025420 3800BD27 */  addiu      $sp, $sp, 0x38
/* DC24 80025424 0800E003 */  jr         $ra
/* DC28 80025428 00000000 */   nop
