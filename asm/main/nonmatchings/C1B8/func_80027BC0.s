.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027BC0
/* 103C0 80027BC0 07000234 */  ori        $v0, $zero, 0x7
/* 103C4 80027BC4 030082A0 */  sb         $v0, 0x3($a0)
/* 103C8 80027BC8 24000234 */  ori        $v0, $zero, 0x24
/* 103CC 80027BCC 0800E003 */  jr         $ra
/* 103D0 80027BD0 070082A0 */   sb        $v0, 0x7($a0)
