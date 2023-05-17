.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B824
/* 14024 8002B824 0480023C */  lui        $v0, %hi(D_800473B4)
/* 14028 8002B828 B473428C */  lw         $v0, %lo(D_800473B4)($v0)
/* 1402C 8002B82C 00000000 */  nop
/* 14030 8002B830 00004294 */  lhu        $v0, 0x0($v0)
/* 14034 8002B834 0800E003 */  jr         $ra
/* 14038 8002B838 00000000 */   nop
