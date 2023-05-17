.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027CB0
/* 104B0 80027CB0 02000234 */  ori        $v0, $zero, 0x2
/* 104B4 80027CB4 030082A0 */  sb         $v0, 0x3($a0)
/* 104B8 80027CB8 78000234 */  ori        $v0, $zero, 0x78
/* 104BC 80027CBC 0800E003 */  jr         $ra
/* 104C0 80027CC0 070082A0 */   sb        $v0, 0x7($a0)
