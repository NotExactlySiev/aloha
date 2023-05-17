.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027A30
/* 10230 80027A30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10234 80027A34 21308000 */  addu       $a2, $a0, $zero
/* 10238 80027A38 3F00C530 */  andi       $a1, $a2, 0x3F
/* 1023C 80027A3C FFFFC630 */  andi       $a2, $a2, 0xFFFF
/* 10240 80027A40 0280043C */  lui        $a0, %hi(D_80018420)
/* 10244 80027A44 20848424 */  addiu      $a0, $a0, %lo(D_80018420)
/* 10248 80027A48 00290500 */  sll        $a1, $a1, 4
/* 1024C 80027A4C 0480023C */  lui        $v0, %hi(D_80046EDC)
/* 10250 80027A50 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* 10254 80027A54 1000BFAF */  sw         $ra, 0x10($sp)
/* 10258 80027A58 09F84000 */  jalr       $v0
/* 1025C 80027A5C 82310600 */   srl       $a2, $a2, 6
/* 10260 80027A60 1000BF8F */  lw         $ra, 0x10($sp)
/* 10264 80027A64 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10268 80027A68 0800E003 */  jr         $ra
/* 1026C 80027A6C 00000000 */   nop
