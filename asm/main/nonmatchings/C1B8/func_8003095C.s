.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8003095C
/* 1915C 8003095C 0480023C */  lui        $v0, %hi(D_80047D08)
/* 19160 80030960 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 19164 80030964 40200400 */  sll        $a0, $a0, 1
/* 19168 80030968 21208200 */  addu       $a0, $a0, $v0
/* 1916C 8003096C 00008294 */  lhu        $v0, 0x0($a0)
/* 19170 80030970 0800E003 */  jr         $ra
/* 19174 80030974 00000000 */   nop
