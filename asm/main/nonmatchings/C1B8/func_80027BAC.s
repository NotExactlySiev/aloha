.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027BAC
/* 103AC 80027BAC 04000234 */  ori        $v0, $zero, 0x4
/* 103B0 80027BB0 030082A0 */  sb         $v0, 0x3($a0)
/* 103B4 80027BB4 20000234 */  ori        $v0, $zero, 0x20
/* 103B8 80027BB8 0800E003 */  jr         $ra
/* 103BC 80027BBC 070082A0 */   sb        $v0, 0x7($a0)
