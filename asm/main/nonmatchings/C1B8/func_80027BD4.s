.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027BD4
/* 103D4 80027BD4 06000234 */  ori        $v0, $zero, 0x6
/* 103D8 80027BD8 030082A0 */  sb         $v0, 0x3($a0)
/* 103DC 80027BDC 30000234 */  ori        $v0, $zero, 0x30
/* 103E0 80027BE0 0800E003 */  jr         $ra
/* 103E4 80027BE4 070082A0 */   sb        $v0, 0x7($a0)
