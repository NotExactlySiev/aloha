.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027D14
/* 10514 80027D14 5555033C */  lui        $v1, (0x55555555 >> 16)
/* 10518 80027D18 55556334 */  ori        $v1, $v1, (0x55555555 & 0xFFFF)
/* 1051C 80027D1C 05000234 */  ori        $v0, $zero, 0x5
/* 10520 80027D20 030082A0 */  sb         $v0, 0x3($a0)
/* 10524 80027D24 48000234 */  ori        $v0, $zero, 0x48
/* 10528 80027D28 070082A0 */  sb         $v0, 0x7($a0)
/* 1052C 80027D2C 0800E003 */  jr         $ra
/* 10530 80027D30 140083AC */   sw        $v1, 0x14($a0)
