.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E15A4
/* 1DA4 800E15A4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1DA8 800E15A8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1DAC 800E15AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1DB0 800E15B0 1400BFAF */  sw         $ra, 0x14($sp)
/* 1DB4 800E15B4 1000B0AF */  sw         $s0, 0x10($sp)
/* 1DB8 800E15B8 180A428C */  lw         $v0, 0xA18($v0)
/* 1DBC 800E15BC 00000000 */  nop
/* 1DC0 800E15C0 09F84000 */  jalr       $v0
/* 1DC4 800E15C4 21808000 */   addu      $s0, $a0, $zero
/* 1DC8 800E15C8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1DCC 800E15CC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1DD0 800E15D0 00000000 */  nop
/* 1DD4 800E15D4 100D428C */  lw         $v0, 0xD10($v0)
/* 1DD8 800E15D8 00000000 */  nop
/* 1DDC 800E15DC 09F84000 */  jalr       $v0
/* 1DE0 800E15E0 21200002 */   addu      $a0, $s0, $zero
/* 1DE4 800E15E4 EA9D030C */  jal        func_800E77A8
/* 1DE8 800E15E8 21200002 */   addu      $a0, $s0, $zero
/* 1DEC 800E15EC 1400BF8F */  lw         $ra, 0x14($sp)
/* 1DF0 800E15F0 1000B08F */  lw         $s0, 0x10($sp)
/* 1DF4 800E15F4 0800E003 */  jr         $ra
/* 1DF8 800E15F8 1800BD27 */   addiu     $sp, $sp, 0x18
