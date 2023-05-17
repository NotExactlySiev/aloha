.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C38
/* 10438 80027C38 0C000234 */  ori        $v0, $zero, 0xC
/* 1043C 80027C3C 030082A0 */  sb         $v0, 0x3($a0)
/* 10440 80027C40 3C000234 */  ori        $v0, $zero, 0x3C
/* 10444 80027C44 0800E003 */  jr         $ra
/* 10448 80027C48 070082A0 */   sb        $v0, 0x7($a0)
