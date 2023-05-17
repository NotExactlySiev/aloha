.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800254D8
/* DCD8 800254D8 0480023C */  lui        $v0, %hi(D_80046EE0)
/* DCDC 800254DC E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* DCE0 800254E0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DCE4 800254E4 1000B0AF */  sw         $s0, 0x10($sp)
/* DCE8 800254E8 21808000 */  addu       $s0, $a0, $zero
/* DCEC 800254EC 1400B1AF */  sw         $s1, 0x14($sp)
/* DCF0 800254F0 2188A000 */  addu       $s1, $a1, $zero
/* DCF4 800254F4 02004228 */  slti       $v0, $v0, 0x2
/* DCF8 800254F8 09004014 */  bnez       $v0, .L80025520
/* DCFC 800254FC 1800BFAF */   sw        $ra, 0x18($sp)
/* DD00 80025500 0280043C */  lui        $a0, %hi(D_80018360)
/* DD04 80025504 60838424 */  addiu      $a0, $a0, %lo(D_80018360)
/* DD08 80025508 21280002 */  addu       $a1, $s0, $zero
/* DD0C 8002550C 0480023C */  lui        $v0, %hi(D_80046EDC)
/* DD10 80025510 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* DD14 80025514 00000000 */  nop
/* DD18 80025518 09F84000 */  jalr       $v0
/* DD1C 8002551C 21302002 */   addu      $a2, $s1, $zero
.L80025520:
/* DD20 80025520 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DD24 80025524 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DD28 80025528 21200002 */  addu       $a0, $s0, $zero
/* DD2C 8002552C 2C00428C */  lw         $v0, 0x2C($v0)
/* DD30 80025530 00000000 */  nop
/* DD34 80025534 09F84000 */  jalr       $v0
/* DD38 80025538 21282002 */   addu      $a1, $s1, $zero
/* DD3C 8002553C 21100002 */  addu       $v0, $s0, $zero
/* DD40 80025540 1800BF8F */  lw         $ra, 0x18($sp)
/* DD44 80025544 1400B18F */  lw         $s1, 0x14($sp)
/* DD48 80025548 1000B08F */  lw         $s0, 0x10($sp)
/* DD4C 8002554C 2000BD27 */  addiu      $sp, $sp, 0x20
/* DD50 80025550 0800E003 */  jr         $ra
/* DD54 80025554 00000000 */   nop
