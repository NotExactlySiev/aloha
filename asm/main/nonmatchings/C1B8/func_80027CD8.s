.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027CD8
/* 104D8 80027CD8 03000234 */  ori        $v0, $zero, 0x3
/* 104DC 80027CDC 030082A0 */  sb         $v0, 0x3($a0)
/* 104E0 80027CE0 02000234 */  ori        $v0, $zero, 0x2
/* 104E4 80027CE4 0800E003 */  jr         $ra
/* 104E8 80027CE8 070082A0 */   sb        $v0, 0x7($a0)
