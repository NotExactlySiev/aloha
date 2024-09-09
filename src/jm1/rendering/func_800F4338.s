.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800F4338
/* 44B38 800F4338 0F80083C */  lui        $t0, %hi(func_800F68B0)
/* 44B3C 800F433C B0680825 */  addiu      $t0, $t0, %lo(func_800F68B0)
/* 44B40 800F4340 00000285 */  lh         $v0, 0x0($t0)
/* 44B44 800F4344 04000395 */  lhu        $v1, 0x4($t0)
/* 44B48 800F4348 00140200 */  sll        $v0, $v0, 16
/* 44B4C 800F434C 0800E003 */  jr         $ra
/* 44B50 800F4350 25104300 */   or        $v0, $v0, $v1
