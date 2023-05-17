.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C4C
/* 1044C 80027C4C 03000234 */  ori        $v0, $zero, 0x3
/* 10450 80027C50 030082A0 */  sb         $v0, 0x3($a0)
/* 10454 80027C54 74000234 */  ori        $v0, $zero, 0x74
/* 10458 80027C58 0800E003 */  jr         $ra
/* 1045C 80027C5C 070082A0 */   sb        $v0, 0x7($a0)
