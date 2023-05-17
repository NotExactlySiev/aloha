.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D34
/* 10534 80027D34 5555033C */  lui        $v1, (0x55555555 >> 16)
/* 10538 80027D38 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
/* 1053C 80027D3C 07000234 */  ori        $v0, $zero, 0x7
/* 10540 80027D40 030082A0 */  sb         $v0, 0x3($a0)
/* 10544 80027D44 58000234 */  ori        $v0, $zero, 0x58
/* 10548 80027D48 070082A0 */  sb         $v0, 0x7($a0)
/* 1054C 80027D4C 0800E003 */  jr         $ra
/* 10550 80027D50 1C0083AC */   sw        $v1, 0x1C($a0)
