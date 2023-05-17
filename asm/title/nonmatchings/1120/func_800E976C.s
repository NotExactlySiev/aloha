.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E976C
/* 9F6C 800E976C 000084C8 */  lwc2       $4, 0x0($a0)
/* 9F70 800E9770 040085C8 */  lwc2       $5, 0x4($a0)
/* 9F74 800E9774 0800E003 */  jr         $ra
/* 9F78 800E9778 00000000 */   nop
