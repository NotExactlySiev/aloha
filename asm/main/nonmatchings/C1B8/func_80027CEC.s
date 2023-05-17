.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027CEC
/* 104EC 80027CEC 03000234 */  ori        $v0, $zero, 0x3
/* 104F0 80027CF0 030082A0 */  sb         $v0, 0x3($a0)
/* 104F4 80027CF4 40000234 */  ori        $v0, $zero, 0x40
/* 104F8 80027CF8 0800E003 */  jr         $ra
/* 104FC 80027CFC 070082A0 */   sb        $v0, 0x7($a0)
