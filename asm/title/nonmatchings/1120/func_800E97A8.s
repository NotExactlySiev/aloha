.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E97A8
/* 9FA8 800E97A8 000094C8 */  lwc2       $20, 0x0($a0)
/* 9FAC 800E97AC 0000B5C8 */  lwc2       $21, 0x0($a1)
/* 9FB0 800E97B0 0000D6C8 */  lwc2       $22, 0x0($a2)
/* 9FB4 800E97B4 0800E003 */  jr         $ra
/* 9FB8 800E97B8 00000000 */   nop
