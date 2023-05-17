.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FB58
/* 8358 8001FB58 1F008430 */  andi       $a0, $a0, 0x1F
/* 835C 8001FB5C 00210400 */  sll        $a0, $a0, 4
/* 8360 8001FB60 0580013C */  lui        $at, %hi(D_80052068)
/* 8364 8001FB64 68202124 */  addiu      $at, $at, %lo(D_80052068)
/* 8368 8001FB68 21082400 */  addu       $at, $at, $a0
/* 836C 8001FB6C 00002284 */  lh         $v0, 0x0($at)
/* 8370 8001FB70 0800E003 */  jr         $ra
/* 8374 8001FB74 00000000 */   nop
