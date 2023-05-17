.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025D8C
/* E58C 80025D8C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* E590 80025D90 1000B0AF */  sw         $s0, 0x10($sp)
/* E594 80025D94 21808000 */  addu       $s0, $a0, $zero
/* E598 80025D98 2120A000 */  addu       $a0, $a1, $zero
/* E59C 80025D9C 02000234 */  ori        $v0, $zero, 0x2
/* E5A0 80025DA0 2128C000 */  addu       $a1, $a2, $zero
/* E5A4 80025DA4 1400B1AF */  sw         $s1, 0x14($sp)
/* E5A8 80025DA8 3000B18F */  lw         $s1, 0x30($sp)
/* E5AC 80025DAC FFFFE630 */  andi       $a2, $a3, 0xFFFF
/* E5B0 80025DB0 1800BFAF */  sw         $ra, 0x18($sp)
/* E5B4 80025DB4 2798000C */  jal        func_8002609C
/* E5B8 80025DB8 030002A2 */   sb        $v0, 0x3($s0)
/* E5BC 80025DBC 040002AE */  sw         $v0, 0x4($s0)
/* E5C0 80025DC0 B098000C */  jal        func_800262C0
/* E5C4 80025DC4 21202002 */   addu      $a0, $s1, $zero
/* E5C8 80025DC8 080002AE */  sw         $v0, 0x8($s0)
/* E5CC 80025DCC 1800BF8F */  lw         $ra, 0x18($sp)
/* E5D0 80025DD0 1400B18F */  lw         $s1, 0x14($sp)
/* E5D4 80025DD4 1000B08F */  lw         $s0, 0x10($sp)
/* E5D8 80025DD8 2000BD27 */  addiu      $sp, $sp, 0x20
/* E5DC 80025DDC 0800E003 */  jr         $ra
/* E5E0 80025DE0 00000000 */   nop
