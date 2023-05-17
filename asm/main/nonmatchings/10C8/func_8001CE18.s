.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CE18
/* 5618 8001CE18 0480023C */  lui        $v0, %hi(D_80047F54)
/* 561C 8001CE1C 547F428C */  lw         $v0, %lo(D_80047F54)($v0)
/* 5620 8001CE20 0800E003 */  jr         $ra
/* 5624 8001CE24 00000000 */   nop
