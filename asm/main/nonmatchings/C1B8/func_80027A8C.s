.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027A8C
/* 1028C 80027A8C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 10290 80027A90 0000828C */  lw         $v0, 0x0($a0)
/* 10294 80027A94 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 10298 80027A98 24104300 */  and        $v0, $v0, $v1
/* 1029C 80027A9C 26104300 */  xor        $v0, $v0, $v1
/* 102A0 80027AA0 0800E003 */  jr         $ra
/* 102A4 80027AA4 0100422C */   sltiu     $v0, $v0, 0x1
