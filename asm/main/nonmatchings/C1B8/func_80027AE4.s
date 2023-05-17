.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027AE4
/* 102E4 80027AE4 FF00073C */  lui        $a3, (0xFFFFFF >> 16)
/* 102E8 80027AE8 FFFFE734 */  ori        $a3, $a3, (0xFFFFFF & 0xFFFF)
/* 102EC 80027AEC 00FF083C */  lui        $t0, (0xFF000000 >> 16)
/* 102F0 80027AF0 0000C38C */  lw         $v1, 0x0($a2)
/* 102F4 80027AF4 0000828C */  lw         $v0, 0x0($a0)
/* 102F8 80027AF8 24186800 */  and        $v1, $v1, $t0
/* 102FC 80027AFC 24104700 */  and        $v0, $v0, $a3
/* 10300 80027B00 25186200 */  or         $v1, $v1, $v0
/* 10304 80027B04 0000C3AC */  sw         $v1, 0x0($a2)
/* 10308 80027B08 0000828C */  lw         $v0, 0x0($a0)
/* 1030C 80027B0C 2428A700 */  and        $a1, $a1, $a3
/* 10310 80027B10 24104800 */  and        $v0, $v0, $t0
/* 10314 80027B14 25104500 */  or         $v0, $v0, $a1
/* 10318 80027B18 0800E003 */  jr         $ra
/* 1031C 80027B1C 000082AC */   sw        $v0, 0x0($a0)
