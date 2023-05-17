.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E977C
/* 9F7C 800E977C 000080C8 */  lwc2       $0, 0x0($a0)
/* 9F80 800E9780 040081C8 */  lwc2       $1, 0x4($a0)
/* 9F84 800E9784 0000A2C8 */  lwc2       $2, 0x0($a1)
/* 9F88 800E9788 0400A3C8 */  lwc2       $3, 0x4($a1)
/* 9F8C 800E978C 0000C4C8 */  lwc2       $4, 0x0($a2)
/* 9F90 800E9790 0400C5C8 */  lwc2       $5, 0x4($a2)
/* 9F94 800E9794 0800E003 */  jr         $ra
/* 9F98 800E9798 00000000 */   nop
