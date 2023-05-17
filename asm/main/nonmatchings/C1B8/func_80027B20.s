.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027B20
/* 10320 80027B20 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* 10324 80027B24 FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 10328 80027B28 00FF033C */  lui        $v1, (0xFF000000 >> 16)
/* 1032C 80027B2C 0000828C */  lw         $v0, 0x0($a0)
/* 10330 80027B30 2428A600 */  and        $a1, $a1, $a2
/* 10334 80027B34 24104300 */  and        $v0, $v0, $v1
/* 10338 80027B38 25104500 */  or         $v0, $v0, $a1
/* 1033C 80027B3C 0800E003 */  jr         $ra
/* 10340 80027B40 000082AC */   sw        $v0, 0x0($a0)
