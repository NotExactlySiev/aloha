.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E857C
/* 8D7C 800E857C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8D80 800E8580 1400BFAF */  sw         $ra, 0x14($sp)
/* 8D84 800E8584 1000B0AF */  sw         $s0, 0x10($sp)
/* 8D88 800E8588 21808000 */  addu       $s0, $a0, $zero
/* 8D8C 800E858C 0880033C */  lui        $v1, (0x80088000 >> 16)
/* 8D90 800E8590 00806334 */  ori        $v1, $v1, (0x80088000 & 0xFFFF)
/* 8D94 800E8594 0E80063C */  lui        $a2, %hi(D_800E7FA0)
/* 8D98 800E8598 A07FC68C */  lw         $a2, %lo(D_800E7FA0)($a2)
/* 8D9C 800E859C 0B80043C */  lui        $a0, (0x800B6000 >> 16)
/* 8DA0 800E85A0 00608434 */  ori        $a0, $a0, (0x800B6000 & 0xFFFF)
/* 8DA4 800E85A4 1C0005AE */  sw         $a1, 0x1C($s0)
/* 8DA8 800E85A8 40000234 */  ori        $v0, $zero, 0x40
/* 8DAC 800E85AC 200002AE */  sw         $v0, 0x20($s0)
/* 8DB0 800E85B0 0680023C */  lui        $v0, (0x80060000 >> 16)
/* 8DB4 800E85B4 240002AE */  sw         $v0, 0x24($s0)
/* 8DB8 800E85B8 280003AE */  sw         $v1, 0x28($s0)
/* 8DBC 800E85BC 0B80023C */  lui        $v0, (0x800B0000 >> 16)
/* 8DC0 800E85C0 2C0002AE */  sw         $v0, 0x2C($s0)
/* 8DC4 800E85C4 300004AE */  sw         $a0, 0x30($s0)
/* 8DC8 800E85C8 C0000234 */  ori        $v0, $zero, 0xC0
/* 8DCC 800E85CC 180002AE */  sw         $v0, 0x18($s0)
/* 8DD0 800E85D0 080000AE */  sw         $zero, 0x8($s0)
/* 8DD4 800E85D4 0C0000AE */  sw         $zero, 0xC($s0)
/* 8DD8 800E85D8 100000AE */  sw         $zero, 0x10($s0)
/* 8DDC 800E85DC 00010234 */  ori        $v0, $zero, 0x100
/* 8DE0 800E85E0 140002AE */  sw         $v0, 0x14($s0)
/* 8DE4 800E85E4 000000A6 */  sh         $zero, 0x0($s0)
/* 8DE8 800E85E8 18000234 */  ori        $v0, $zero, 0x18
/* 8DEC 800E85EC 020002A6 */  sh         $v0, 0x2($s0)
/* 8DF0 800E85F0 00010234 */  ori        $v0, $zero, 0x100
/* 8DF4 800E85F4 040002A6 */  sh         $v0, 0x4($s0)
/* 8DF8 800E85F8 D0000234 */  ori        $v0, $zero, 0xD0
/* 8DFC 800E85FC 060002A6 */  sh         $v0, 0x6($s0)
/* 8E00 800E8600 340000AE */  sw         $zero, 0x34($s0)
/* 8E04 800E8604 1C00C28C */  lw         $v0, 0x1C($a2)
/* 8E08 800E8608 00000000 */  nop
/* 8E0C 800E860C 09F84000 */  jalr       $v0
/* 8E10 800E8610 00000000 */   nop
/* 8E14 800E8614 01000334 */  ori        $v1, $zero, 0x1
/* 8E18 800E8618 05004314 */  bne        $v0, $v1, .L800E8630
/* 8E1C 800E861C 00000000 */   nop
/* 8E20 800E8620 02000296 */  lhu        $v0, 0x2($s0)
/* 8E24 800E8624 00000000 */  nop
/* 8E28 800E8628 18004224 */  addiu      $v0, $v0, 0x18
/* 8E2C 800E862C 020002A6 */  sh         $v0, 0x2($s0)
.L800E8630:
/* 8E30 800E8630 1400BF8F */  lw         $ra, 0x14($sp)
/* 8E34 800E8634 1000B08F */  lw         $s0, 0x10($sp)
/* 8E38 800E8638 0800E003 */  jr         $ra
/* 8E3C 800E863C 1800BD27 */   addiu     $sp, $sp, 0x18
