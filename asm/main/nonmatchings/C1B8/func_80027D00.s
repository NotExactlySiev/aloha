.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D00
/* 10500 80027D00 04000234 */  ori        $v0, $zero, 0x4
/* 10504 80027D04 030082A0 */  sb         $v0, 0x3($a0)
/* 10508 80027D08 50000234 */  ori        $v0, $zero, 0x50
/* 1050C 80027D0C 0800E003 */  jr         $ra
/* 10510 80027D10 070082A0 */   sb        $v0, 0x7($a0)
