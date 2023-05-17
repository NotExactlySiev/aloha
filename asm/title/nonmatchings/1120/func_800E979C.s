.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E979C
/* 9F9C 800E979C 000086C8 */  lwc2       $6, 0x0($a0)
/* 9FA0 800E97A0 0800E003 */  jr         $ra
/* 9FA4 800E97A4 00000000 */   nop
