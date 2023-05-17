.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B83C
/* 1403C 8002B83C 0480033C */  lui        $v1, %hi(D_800473B4)
/* 14040 8002B840 B473638C */  lw         $v1, %lo(D_800473B4)($v1)
/* 14044 8002B844 00000000 */  nop
/* 14048 8002B848 00006294 */  lhu        $v0, 0x0($v1)
/* 1404C 8002B84C 000064A4 */  sh         $a0, 0x0($v1)
/* 14050 8002B850 0800E003 */  jr         $ra
/* 14054 8002B854 00000000 */   nop
