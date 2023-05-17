.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C74
/* 10474 80027C74 04000234 */  ori        $v0, $zero, 0x4
/* 10478 80027C78 030082A0 */  sb         $v0, 0x3($a0)
/* 1047C 80027C7C 64000234 */  ori        $v0, $zero, 0x64
/* 10480 80027C80 0800E003 */  jr         $ra
/* 10484 80027C84 070082A0 */   sb        $v0, 0x7($a0)
