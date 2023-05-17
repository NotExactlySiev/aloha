.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027A70
/* 10270 80027A70 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 10274 80027A74 0000828C */  lw         $v0, 0x0($a0)
/* 10278 80027A78 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 1027C 80027A7C 24104300 */  and        $v0, $v0, $v1
/* 10280 80027A80 0080033C */  lui        $v1, (0x80000000 >> 16)
/* 10284 80027A84 0800E003 */  jr         $ra
/* 10288 80027A88 25104300 */   or        $v0, $v0, $v1
