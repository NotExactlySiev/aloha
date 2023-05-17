.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019DD8
/* 25D8 80019DD8 0480013C */  lui        $at, %hi(D_80047D5C)
/* 25DC 80019DDC 5C7D24AC */  sw         $a0, %lo(D_80047D5C)($at)
/* 25E0 80019DE0 0800E003 */  jr         $ra
/* 25E4 80019DE4 00000000 */   nop
