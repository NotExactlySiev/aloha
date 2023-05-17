.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B810
/* 14010 8002B810 0480023C */  lui        $v0, %hi(D_8004734E)
/* 14014 8002B814 4E734224 */  addiu      $v0, $v0, %lo(D_8004734E)
/* 14018 8002B818 00004294 */  lhu        $v0, 0x0($v0)
/* 1401C 8002B81C 0800E003 */  jr         $ra
/* 14020 8002B820 00000000 */   nop
