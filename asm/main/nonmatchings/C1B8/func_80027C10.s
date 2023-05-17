.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C10
/* 10410 80027C10 09000234 */  ori        $v0, $zero, 0x9
/* 10414 80027C14 030082A0 */  sb         $v0, 0x3($a0)
/* 10418 80027C18 2C000234 */  ori        $v0, $zero, 0x2C
/* 1041C 80027C1C 0800E003 */  jr         $ra
/* 10420 80027C20 070082A0 */   sb        $v0, 0x7($a0)
