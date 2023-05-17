.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C60
/* 10460 80027C60 03000234 */  ori        $v0, $zero, 0x3
/* 10464 80027C64 030082A0 */  sb         $v0, 0x3($a0)
/* 10468 80027C68 7C000234 */  ori        $v0, $zero, 0x7C
/* 1046C 80027C6C 0800E003 */  jr         $ra
/* 10470 80027C70 070082A0 */   sb        $v0, 0x7($a0)
