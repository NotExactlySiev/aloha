.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C24
/* 10424 80027C24 08000234 */  ori        $v0, $zero, 0x8
/* 10428 80027C28 030082A0 */  sb         $v0, 0x3($a0)
/* 1042C 80027C2C 38000234 */  ori        $v0, $zero, 0x38
/* 10430 80027C30 0800E003 */  jr         $ra
/* 10434 80027C34 070082A0 */   sb        $v0, 0x7($a0)
