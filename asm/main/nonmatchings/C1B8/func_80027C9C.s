.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027C9C
/* 1049C 80027C9C 02000234 */  ori        $v0, $zero, 0x2
/* 104A0 80027CA0 030082A0 */  sb         $v0, 0x3($a0)
/* 104A4 80027CA4 70000234 */  ori        $v0, $zero, 0x70
/* 104A8 80027CA8 0800E003 */  jr         $ra
/* 104AC 80027CAC 070082A0 */   sb        $v0, 0x7($a0)
