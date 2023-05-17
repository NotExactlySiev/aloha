.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1E60
/* 2660 800E1E60 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 2664 800E1E64 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2668 800E1E68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 266C 800E1E6C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2670 800E1E70 E5006290 */  lbu        $v0, 0xE5($v1)
/* 2674 800E1E74 00260434 */  ori        $a0, $zero, 0x2600
/* 2678 800E1E78 0100422C */  sltiu      $v0, $v0, 0x1
/* 267C 800E1E7C E50062A0 */  sb         $v0, 0xE5($v1)
/* 2680 800E1E80 D582030C */  jal        func_800E0B54
/* 2684 800E1E84 00000000 */   nop
/* 2688 800E1E88 1000BF8F */  lw         $ra, 0x10($sp)
/* 268C 800E1E8C 00000000 */  nop
/* 2690 800E1E90 0800E003 */  jr         $ra
/* 2694 800E1E94 1800BD27 */   addiu     $sp, $sp, 0x18
