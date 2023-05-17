.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026D1C
/* F51C 80026D1C F8FFBD27 */  addiu      $sp, $sp, -0x8
/* F520 80026D20 FFFFA624 */  addiu      $a2, $a1, -0x1
/* F524 80026D24 0480033C */  lui        $v1, %hi(D_80046EF8)
/* F528 80026D28 F86E638C */  lw         $v1, %lo(D_80046EF8)($v1)
/* F52C 80026D2C 0004023C */  lui        $v0, (0x4000000 >> 16)
/* F530 80026D30 000062AC */  sw         $v0, 0x0($v1)
/* F534 80026D34 0A00A010 */  beqz       $a1, .L80026D60
/* F538 80026D38 21100000 */   addu      $v0, $zero, $zero
/* F53C 80026D3C FFFF0524 */  addiu      $a1, $zero, -0x1
.L80026D40:
/* F540 80026D40 0000838C */  lw         $v1, 0x0($a0)
/* F544 80026D44 04008424 */  addiu      $a0, $a0, 0x4
/* F548 80026D48 0480023C */  lui        $v0, %hi(D_80046EF4)
/* F54C 80026D4C F46E428C */  lw         $v0, %lo(D_80046EF4)($v0)
/* F550 80026D50 FFFFC624 */  addiu      $a2, $a2, -0x1
/* F554 80026D54 000043AC */  sw         $v1, 0x0($v0)
/* F558 80026D58 F9FFC514 */  bne        $a2, $a1, .L80026D40
/* F55C 80026D5C 21100000 */   addu      $v0, $zero, $zero
.L80026D60:
/* F560 80026D60 0800BD27 */  addiu      $sp, $sp, 0x8
/* F564 80026D64 0800E003 */  jr         $ra
/* F568 80026D68 00000000 */   nop
