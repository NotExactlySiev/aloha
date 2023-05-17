.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025628
/* DE28 80025628 0480023C */  lui        $v0, %hi(D_80046EE0)
/* DE2C 8002562C E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* DE30 80025630 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* DE34 80025634 1400B1AF */  sw         $s1, 0x14($sp)
/* DE38 80025638 21888000 */  addu       $s1, $a0, $zero
/* DE3C 8002563C 1800BFAF */  sw         $ra, 0x18($sp)
/* DE40 80025640 02004228 */  slti       $v0, $v0, 0x2
/* DE44 80025644 08004014 */  bnez       $v0, .L80025668
/* DE48 80025648 1000B0AF */   sw        $s0, 0x10($sp)
/* DE4C 8002564C 0280043C */  lui        $a0, %hi(D_8001838C)
/* DE50 80025650 8C838424 */  addiu      $a0, $a0, %lo(D_8001838C)
/* DE54 80025654 0480023C */  lui        $v0, %hi(D_80046EDC)
/* DE58 80025658 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* DE5C 8002565C 00000000 */  nop
/* DE60 80025660 09F84000 */  jalr       $v0
/* DE64 80025664 21282002 */   addu      $a1, $s1, $zero
.L80025668:
/* DE68 80025668 1C003026 */  addiu      $s0, $s1, 0x1C
/* DE6C 8002566C 21200002 */  addu       $a0, $s0, $zero
/* DE70 80025670 7997000C */  jal        func_80025DE4
/* DE74 80025674 21282002 */   addu      $a1, $s1, $zero
/* DE78 80025678 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* DE7C 8002567C FFFF8434 */  ori        $a0, $a0, (0xFFFFFF & 0xFFFF)
/* DE80 80025680 21280002 */  addu       $a1, $s0, $zero
/* DE84 80025684 40000634 */  ori        $a2, $zero, 0x40
/* DE88 80025688 1C00228E */  lw         $v0, 0x1C($s1)
/* DE8C 8002568C 0480033C */  lui        $v1, %hi(D_80046ED8)
/* DE90 80025690 D86E638C */  lw         $v1, %lo(D_80046ED8)($v1)
/* DE94 80025694 25104400 */  or         $v0, $v0, $a0
/* DE98 80025698 1C0022AE */  sw         $v0, 0x1C($s1)
/* DE9C 8002569C 1800648C */  lw         $a0, 0x18($v1)
/* DEA0 800256A0 0800628C */  lw         $v0, 0x8($v1)
/* DEA4 800256A4 00000000 */  nop
/* DEA8 800256A8 09F84000 */  jalr       $v0
/* DEAC 800256AC 21380000 */   addu      $a3, $zero, $zero
/* DEB0 800256B0 0580073C */  lui        $a3, %hi(D_80052288)
/* DEB4 800256B4 8822E724 */  addiu      $a3, $a3, %lo(D_80052288)
/* DEB8 800256B8 21302002 */  addu       $a2, $s1, $zero
/* DEBC 800256BC 50002826 */  addiu      $t0, $s1, 0x50
.L800256C0:
/* DEC0 800256C0 0000C28C */  lw         $v0, 0x0($a2)
/* DEC4 800256C4 0400C38C */  lw         $v1, 0x4($a2)
/* DEC8 800256C8 0800C48C */  lw         $a0, 0x8($a2)
/* DECC 800256CC 0C00C58C */  lw         $a1, 0xC($a2)
/* DED0 800256D0 0000E2AC */  sw         $v0, 0x0($a3)
/* DED4 800256D4 0400E3AC */  sw         $v1, 0x4($a3)
/* DED8 800256D8 0800E4AC */  sw         $a0, 0x8($a3)
/* DEDC 800256DC 0C00E5AC */  sw         $a1, 0xC($a3)
/* DEE0 800256E0 1000C624 */  addiu      $a2, $a2, 0x10
/* DEE4 800256E4 F6FFC814 */  bne        $a2, $t0, .L800256C0
/* DEE8 800256E8 1000E724 */   addiu     $a3, $a3, 0x10
/* DEEC 800256EC 0000C28C */  lw         $v0, 0x0($a2)
/* DEF0 800256F0 0400C38C */  lw         $v1, 0x4($a2)
/* DEF4 800256F4 0800C48C */  lw         $a0, 0x8($a2)
/* DEF8 800256F8 0000E2AC */  sw         $v0, 0x0($a3)
/* DEFC 800256FC 0400E3AC */  sw         $v1, 0x4($a3)
/* DF00 80025700 0800E4AC */  sw         $a0, 0x8($a3)
/* DF04 80025704 21102002 */  addu       $v0, $s1, $zero
/* DF08 80025708 1800BF8F */  lw         $ra, 0x18($sp)
/* DF0C 8002570C 1400B18F */  lw         $s1, 0x14($sp)
/* DF10 80025710 1000B08F */  lw         $s0, 0x10($sp)
/* DF14 80025714 2000BD27 */  addiu      $sp, $sp, 0x20
/* DF18 80025718 0800E003 */  jr         $ra
/* DF1C 8002571C 00000000 */   nop
