.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025558
/* DD58 80025558 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DD5C 8002555C 1000B0AF */  sw         $s0, 0x10($sp)
/* DD60 80025560 21808000 */  addu       $s0, $a0, $zero
/* DD64 80025564 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DD68 80025568 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DD6C 8002556C 1800BFAF */  sw         $ra, 0x18($sp)
/* DD70 80025570 1400B1AF */  sw         $s1, 0x14($sp)
/* DD74 80025574 3C00428C */  lw         $v0, 0x3C($v0)
/* DD78 80025578 03001192 */  lbu        $s1, 0x3($s0)
/* DD7C 8002557C 09F84000 */  jalr       $v0
/* DD80 80025580 21200000 */   addu      $a0, $zero, $zero
/* DD84 80025584 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DD88 80025588 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DD8C 8002558C 04000426 */  addiu      $a0, $s0, 0x4
/* DD90 80025590 1400428C */  lw         $v0, 0x14($v0)
/* DD94 80025594 00000000 */  nop
/* DD98 80025598 09F84000 */  jalr       $v0
/* DD9C 8002559C 21282002 */   addu      $a1, $s1, $zero
/* DDA0 800255A0 1800BF8F */  lw         $ra, 0x18($sp)
/* DDA4 800255A4 1400B18F */  lw         $s1, 0x14($sp)
/* DDA8 800255A8 1000B08F */  lw         $s0, 0x10($sp)
/* DDAC 800255AC 2000BD27 */  addiu      $sp, $sp, 0x20
/* DDB0 800255B0 0800E003 */  jr         $ra
/* DDB4 800255B4 00000000 */   nop
