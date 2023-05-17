.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A348
/* 2B48 8001A348 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2B4C 8001A34C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2B50 8001A350 21308000 */  addu       $a2, $a0, $zero
/* 2B54 8001A354 01000434 */  ori        $a0, $zero, 0x1
/* 2B58 8001A358 C5A0000C */  jal        func_80028314
/* 2B5C 8001A35C 21280000 */   addu      $a1, $zero, $zero
/* 2B60 8001A360 1000BF8F */  lw         $ra, 0x10($sp)
/* 2B64 8001A364 00000000 */  nop
/* 2B68 8001A368 0800E003 */  jr         $ra
/* 2B6C 8001A36C 1800BD27 */   addiu     $sp, $sp, 0x18
