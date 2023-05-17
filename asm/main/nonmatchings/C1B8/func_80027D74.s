.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D74
/* 10574 80027D74 5555033C */  lui        $v1, (0x55555555 >> 16)
/* 10578 80027D78 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
/* 1057C 80027D7C 09000234 */  ori        $v0, $zero, 0x9
/* 10580 80027D80 030082A0 */  sb         $v0, 0x3($a0)
/* 10584 80027D84 5C000234 */  ori        $v0, $zero, 0x5C
/* 10588 80027D88 070082A0 */  sb         $v0, 0x7($a0)
/* 1058C 80027D8C 0800E003 */  jr         $ra
/* 10590 80027D90 240083AC */   sw        $v1, 0x24($a0)
