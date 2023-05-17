.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C154
/* 14954 8002C154 0480023C */  lui        $v0, %hi(D_800473E4)
/* 14958 8002C158 E473428C */  lw         $v0, %lo(D_800473E4)($v0)
/* 1495C 8002C15C 0800E003 */  jr         $ra
/* 14960 8002C160 00000000 */   nop
