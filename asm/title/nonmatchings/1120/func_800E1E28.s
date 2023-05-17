.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1E28
/* 2628 800E1E28 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 262C 800E1E2C D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2630 800E1E30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2634 800E1E34 1000BFAF */  sw         $ra, 0x10($sp)
/* 2638 800E1E38 E3006290 */  lbu        $v0, 0xE3($v1)
/* 263C 800E1E3C 00260434 */  ori        $a0, $zero, 0x2600
/* 2640 800E1E40 0100422C */  sltiu      $v0, $v0, 0x1
/* 2644 800E1E44 E30062A0 */  sb         $v0, 0xE3($v1)
/* 2648 800E1E48 D582030C */  jal        func_800E0B54
/* 264C 800E1E4C 00000000 */   nop
/* 2650 800E1E50 1000BF8F */  lw         $ra, 0x10($sp)
/* 2654 800E1E54 00000000 */  nop
/* 2658 800E1E58 0800E003 */  jr         $ra
/* 265C 800E1E5C 1800BD27 */   addiu     $sp, $sp, 0x18
