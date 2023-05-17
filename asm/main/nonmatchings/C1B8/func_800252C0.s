.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800252C0
/* DAC0 800252C0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DAC4 800252C4 1000B0AF */  sw         $s0, 0x10($sp)
/* DAC8 800252C8 21808000 */  addu       $s0, $a0, $zero
/* DACC 800252CC 1400B1AF */  sw         $s1, 0x14($sp)
/* DAD0 800252D0 2188A000 */  addu       $s1, $a1, $zero
/* DAD4 800252D4 0280043C */  lui        $a0, %hi(D_80018324)
/* DAD8 800252D8 24838424 */  addiu      $a0, $a0, %lo(D_80018324)
/* DADC 800252DC 1800BFAF */  sw         $ra, 0x18($sp)
/* DAE0 800252E0 4594000C */  jal        func_80025114
/* DAE4 800252E4 21280002 */   addu      $a1, $s0, $zero
/* DAE8 800252E8 21280002 */  addu       $a1, $s0, $zero
/* DAEC 800252EC 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DAF0 800252F0 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DAF4 800252F4 08000634 */  ori        $a2, $zero, 0x8
/* DAF8 800252F8 2000448C */  lw         $a0, 0x20($v0)
/* DAFC 800252FC 0800428C */  lw         $v0, 0x8($v0)
/* DB00 80025300 00000000 */  nop
/* DB04 80025304 09F84000 */  jalr       $v0
/* DB08 80025308 21382002 */   addu      $a3, $s1, $zero
/* DB0C 8002530C 1800BF8F */  lw         $ra, 0x18($sp)
/* DB10 80025310 1400B18F */  lw         $s1, 0x14($sp)
/* DB14 80025314 1000B08F */  lw         $s0, 0x10($sp)
/* DB18 80025318 2000BD27 */  addiu      $sp, $sp, 0x20
/* DB1C 8002531C 0800E003 */  jr         $ra
/* DB20 80025320 00000000 */   nop
