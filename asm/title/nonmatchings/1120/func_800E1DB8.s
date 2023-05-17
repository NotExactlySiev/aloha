.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1DB8
/* 25B8 800E1DB8 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 25BC 800E1DBC D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 25C0 800E1DC0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 25C4 800E1DC4 1400BFAF */  sw         $ra, 0x14($sp)
/* 25C8 800E1DC8 1000B0AF */  sw         $s0, 0x10($sp)
/* 25CC 800E1DCC 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 25D0 800E1DD0 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 25D4 800E1DD4 13055090 */  lbu        $s0, 0x513($v0)
/* 25D8 800E1DD8 0004628C */  lw         $v0, 0x400($v1)
/* 25DC 800E1DDC 00000000 */  nop
/* 25E0 800E1DE0 09F84000 */  jalr       $v0
/* 25E4 800E1DE4 00000000 */   nop
/* 25E8 800E1DE8 40004230 */  andi       $v0, $v0, 0x40
/* 25EC 800E1DEC 0A004014 */  bnez       $v0, .L800E1E18
/* 25F0 800E1DF0 01001026 */   addiu     $s0, $s0, 0x1
/* 25F4 800E1DF4 FF000332 */  andi       $v1, $s0, 0xFF
/* 25F8 800E1DF8 45000234 */  ori        $v0, $zero, 0x45
/* 25FC 800E1DFC 02006214 */  bne        $v1, $v0, .L800E1E08
/* 2600 800E1E00 00000000 */   nop
/* 2604 800E1E04 21800000 */  addu       $s0, $zero, $zero
.L800E1E08:
/* 2608 800E1E08 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 260C 800E1E0C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 2610 800E1E10 00000000 */  nop
/* 2614 800E1E14 130550A0 */  sb         $s0, 0x513($v0)
.L800E1E18:
/* 2618 800E1E18 1400BF8F */  lw         $ra, 0x14($sp)
/* 261C 800E1E1C 1000B08F */  lw         $s0, 0x10($sp)
/* 2620 800E1E20 0800E003 */  jr         $ra
/* 2624 800E1E24 1800BD27 */   addiu     $sp, $sp, 0x18
