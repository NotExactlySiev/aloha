.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019DCC
/* 25CC 80019DCC 0100023C */  lui        $v0, (0x10002 >> 16)
/* 25D0 80019DD0 0800E003 */  jr         $ra
/* 25D4 80019DD4 02004234 */   ori       $v0, $v0, (0x10002 & 0xFFFF)
