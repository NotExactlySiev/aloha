.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8003093C
/* 1913C 8003093C 0480023C */  lui        $v0, %hi(D_80047D08)
/* 19140 80030940 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 19144 80030944 40200400 */  sll        $a0, $a0, 1
/* 19148 80030948 21208200 */  addu       $a0, $a0, $v0
/* 1914C 8003094C 21100000 */  addu       $v0, $zero, $zero
/* 19150 80030950 000085A4 */  sh         $a1, 0x0($a0)
/* 19154 80030954 0800E003 */  jr         $ra
/* 19158 80030958 00000000 */   nop
