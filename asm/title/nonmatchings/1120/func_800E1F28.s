.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1F28
/* 2728 800E1F28 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 272C 800E1F2C D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2730 800E1F30 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2734 800E1F34 1000BFAF */  sw         $ra, 0x10($sp)
/* 2738 800E1F38 E8006290 */  lbu        $v0, 0xE8($v1)
/* 273C 800E1F3C 00260434 */  ori        $a0, $zero, 0x2600
/* 2740 800E1F40 0100422C */  sltiu      $v0, $v0, 0x1
/* 2744 800E1F44 E80062A0 */  sb         $v0, 0xE8($v1)
/* 2748 800E1F48 D582030C */  jal        func_800E0B54
/* 274C 800E1F4C 00000000 */   nop
/* 2750 800E1F50 1000BF8F */  lw         $ra, 0x10($sp)
/* 2754 800E1F54 00000000 */  nop
/* 2758 800E1F58 0800E003 */  jr         $ra
/* 275C 800E1F5C 1800BD27 */   addiu     $sp, $sp, 0x18
