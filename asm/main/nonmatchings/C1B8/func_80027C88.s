.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C88
/* 10488 80027C88 02000234 */  ori        $v0, $zero, 0x2
/* 1048C 80027C8C 030082A0 */  sb         $v0, 0x3($a0)
/* 10490 80027C90 68000234 */  ori        $v0, $zero, 0x68
/* 10494 80027C94 0800E003 */  jr         $ra
/* 10498 80027C98 070082A0 */   sb        $v0, 0x7($a0)
