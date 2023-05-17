.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027BE8
/* 103E8 80027BE8 09000234 */  ori        $v0, $zero, 0x9
/* 103EC 80027BEC 030082A0 */  sb         $v0, 0x3($a0)
/* 103F0 80027BF0 34000234 */  ori        $v0, $zero, 0x34
/* 103F4 80027BF4 0800E003 */  jr         $ra
/* 103F8 80027BF8 070082A0 */   sb        $v0, 0x7($a0)
