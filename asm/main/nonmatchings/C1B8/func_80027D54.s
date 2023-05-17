.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D54
/* 10554 80027D54 5555033C */  lui        $v1, (0x55555555 >> 16)
/* 10558 80027D58 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
/* 1055C 80027D5C 06000234 */  ori        $v0, $zero, 0x6
/* 10560 80027D60 030082A0 */  sb         $v0, 0x3($a0)
/* 10564 80027D64 4C000234 */  ori        $v0, $zero, 0x4C
/* 10568 80027D68 070082A0 */  sb         $v0, 0x7($a0)
/* 1056C 80027D6C 0800E003 */  jr         $ra
/* 10570 80027D70 180083AC */   sw        $v1, 0x18($a0)
