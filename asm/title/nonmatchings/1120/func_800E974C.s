.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E974C
/* 9F4C 800E974C 000080C8 */  lwc2       $0, 0x0($a0)
/* 9F50 800E9750 040081C8 */  lwc2       $1, 0x4($a0)
/* 9F54 800E9754 0800E003 */  jr         $ra
/* 9F58 800E9758 00000000 */   nop
