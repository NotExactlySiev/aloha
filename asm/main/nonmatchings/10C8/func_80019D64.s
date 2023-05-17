.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019D64
/* 2564 80019D64 0801028C */  lw         $v0, 0x108($zero)
/* 2568 80019D68 00000000 */  nop
/* 256C 80019D6C 0000428C */  lw         $v0, 0x0($v0)
/* 2570 80019D70 0800E003 */  jr         $ra
/* 2574 80019D74 100040AC */   sw        $zero, 0x10($v0)
