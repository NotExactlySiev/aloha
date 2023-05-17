.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019AE8
/* 22E8 80019AE8 0480023C */  lui        $v0, %hi(D_80047D68)
/* 22EC 80019AEC 687D428C */  lw         $v0, %lo(D_80047D68)($v0)
/* 22F0 80019AF0 0800E003 */  jr         $ra
/* 22F4 80019AF4 00000000 */   nop
