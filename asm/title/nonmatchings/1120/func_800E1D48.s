.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1D48
/* 2548 800E1D48 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 254C 800E1D4C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 2550 800E1D50 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2554 800E1D54 1400BFAF */  sw         $ra, 0x14($sp)
/* 2558 800E1D58 1000B0AF */  sw         $s0, 0x10($sp)
/* 255C 800E1D5C 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 2560 800E1D60 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 2564 800E1D64 13055090 */  lbu        $s0, 0x513($v0)
/* 2568 800E1D68 0004628C */  lw         $v0, 0x400($v1)
/* 256C 800E1D6C 00000000 */  nop
/* 2570 800E1D70 09F84000 */  jalr       $v0
/* 2574 800E1D74 00000000 */   nop
/* 2578 800E1D78 40004230 */  andi       $v0, $v0, 0x40
/* 257C 800E1D7C 0A004014 */  bnez       $v0, .L800E1DA8
/* 2580 800E1D80 FFFF1026 */   addiu     $s0, $s0, -0x1
/* 2584 800E1D84 FF000332 */  andi       $v1, $s0, 0xFF
/* 2588 800E1D88 FF000234 */  ori        $v0, $zero, 0xFF
/* 258C 800E1D8C 02006214 */  bne        $v1, $v0, .L800E1D98
/* 2590 800E1D90 00000000 */   nop
/* 2594 800E1D94 44001034 */  ori        $s0, $zero, 0x44
.L800E1D98:
/* 2598 800E1D98 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 259C 800E1D9C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 25A0 800E1DA0 00000000 */  nop
/* 25A4 800E1DA4 130550A0 */  sb         $s0, 0x513($v0)
.L800E1DA8:
/* 25A8 800E1DA8 1400BF8F */  lw         $ra, 0x14($sp)
/* 25AC 800E1DAC 1000B08F */  lw         $s0, 0x10($sp)
/* 25B0 800E1DB0 0800E003 */  jr         $ra
/* 25B4 800E1DB4 1800BD27 */   addiu     $sp, $sp, 0x18
