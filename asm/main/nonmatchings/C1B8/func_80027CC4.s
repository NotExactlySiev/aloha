.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027CC4
/* 104C4 80027CC4 03000234 */  ori        $v0, $zero, 0x3
/* 104C8 80027CC8 030082A0 */  sb         $v0, 0x3($a0)
/* 104CC 80027CCC 60000234 */  ori        $v0, $zero, 0x60
/* 104D0 80027CD0 0800E003 */  jr         $ra
/* 104D4 80027CD4 070082A0 */   sb        $v0, 0x7($a0)
