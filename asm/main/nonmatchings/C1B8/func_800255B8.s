.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800255B8
/* DDB8 800255B8 0480023C */  lui        $v0, %hi(D_80046EE0)
/* DDBC 800255BC E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* DDC0 800255C0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* DDC4 800255C4 1000B0AF */  sw         $s0, 0x10($sp)
/* DDC8 800255C8 21808000 */  addu       $s0, $a0, $zero
/* DDCC 800255CC 02004228 */  slti       $v0, $v0, 0x2
/* DDD0 800255D0 08004014 */  bnez       $v0, .L800255F4
/* DDD4 800255D4 1400BFAF */   sw        $ra, 0x14($sp)
/* DDD8 800255D8 0280043C */  lui        $a0, %hi(D_80018378)
/* DDDC 800255DC 78838424 */  addiu      $a0, $a0, %lo(D_80018378)
/* DDE0 800255E0 0480023C */  lui        $v0, %hi(D_80046EDC)
/* DDE4 800255E4 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* DDE8 800255E8 00000000 */  nop
/* DDEC 800255EC 09F84000 */  jalr       $v0
/* DDF0 800255F0 21280002 */   addu      $a1, $s0, $zero
.L800255F4:
/* DDF4 800255F4 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DDF8 800255F8 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DDFC 800255FC 21280002 */  addu       $a1, $s0, $zero
/* DE00 80025600 1800448C */  lw         $a0, 0x18($v0)
/* DE04 80025604 0400428C */  lw         $v0, 0x4($v0)
/* DE08 80025608 00000000 */  nop
/* DE0C 8002560C 09F84000 */  jalr       $v0
/* DE10 80025610 21300000 */   addu      $a2, $zero, $zero
/* DE14 80025614 1400BF8F */  lw         $ra, 0x14($sp)
/* DE18 80025618 1000B08F */  lw         $s0, 0x10($sp)
/* DE1C 8002561C 1800BD27 */  addiu      $sp, $sp, 0x18
/* DE20 80025620 0800E003 */  jr         $ra
/* DE24 80025624 00000000 */   nop
