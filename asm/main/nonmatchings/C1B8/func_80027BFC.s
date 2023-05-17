.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027BFC
/* 103FC 80027BFC 05000234 */  ori        $v0, $zero, 0x5
/* 10400 80027C00 030082A0 */  sb         $v0, 0x3($a0)
/* 10404 80027C04 28000234 */  ori        $v0, $zero, 0x28
/* 10408 80027C08 0800E003 */  jr         $ra
/* 1040C 80027C0C 070082A0 */   sb        $v0, 0x7($a0)
