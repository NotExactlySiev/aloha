.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3D9C
/* 459C 800E3D9C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 45A0 800E3DA0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 45A4 800E3DA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 45A8 800E3DA8 1000BFAF */  sw         $ra, 0x10($sp)
/* 45AC 800E3DAC 0E80043C */  lui        $a0, %hi(D_800E0910)
/* 45B0 800E3DB0 10098424 */  addiu      $a0, $a0, %lo(D_800E0910)
/* 45B4 800E3DB4 4404428C */  lw         $v0, 0x444($v0)
/* 45B8 800E3DB8 0680053C */  lui        $a1, (0x80060000 >> 16)
/* 45BC 800E3DBC 09F84000 */  jalr       $v0
/* 45C0 800E3DC0 21300000 */   addu      $a2, $zero, $zero
/* 45C4 800E3DC4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 45C8 800E3DC8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 45CC 800E3DCC 21200000 */  addu       $a0, $zero, $zero
/* 45D0 800E3DD0 000C428C */  lw         $v0, 0xC00($v0)
/* 45D4 800E3DD4 0680053C */  lui        $a1, (0x80060000 >> 16)
/* 45D8 800E3DD8 09F84000 */  jalr       $v0
/* 45DC 800E3DDC 21300000 */   addu      $a2, $zero, $zero
/* 45E0 800E3DE0 0F80013C */  lui        $at, %hi(D_800F4CF0)
/* 45E4 800E3DE4 F04C22AC */  sw         $v0, %lo(D_800F4CF0)($at)
/* 45E8 800E3DE8 1000BF8F */  lw         $ra, 0x10($sp)
/* 45EC 800E3DEC 00000000 */  nop
/* 45F0 800E3DF0 0800E003 */  jr         $ra
/* 45F4 800E3DF4 1800BD27 */   addiu     $sp, $sp, 0x18
