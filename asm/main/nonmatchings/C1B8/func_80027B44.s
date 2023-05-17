.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027B44
/* 10344 80027B44 FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* 10348 80027B48 0000828C */  lw         $v0, 0x0($a0)
/* 1034C 80027B4C FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* 10350 80027B50 25104300 */  or         $v0, $v0, $v1
/* 10354 80027B54 0800E003 */  jr         $ra
/* 10358 80027B58 000082AC */   sw        $v0, 0x0($a0)
