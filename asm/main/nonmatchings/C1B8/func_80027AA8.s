.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027AA8
/* 102A8 80027AA8 FF00063C */  lui        $a2, (0xFFFFFF >> 16)
/* 102AC 80027AAC FFFFC634 */  ori        $a2, $a2, (0xFFFFFF & 0xFFFF)
/* 102B0 80027AB0 00FF073C */  lui        $a3, (0xFF000000 >> 16)
/* 102B4 80027AB4 0000A38C */  lw         $v1, 0x0($a1)
/* 102B8 80027AB8 0000828C */  lw         $v0, 0x0($a0)
/* 102BC 80027ABC 24186700 */  and        $v1, $v1, $a3
/* 102C0 80027AC0 24104600 */  and        $v0, $v0, $a2
/* 102C4 80027AC4 25186200 */  or         $v1, $v1, $v0
/* 102C8 80027AC8 0000A3AC */  sw         $v1, 0x0($a1)
/* 102CC 80027ACC 0000828C */  lw         $v0, 0x0($a0)
/* 102D0 80027AD0 2428A600 */  and        $a1, $a1, $a2
/* 102D4 80027AD4 24104700 */  and        $v0, $v0, $a3
/* 102D8 80027AD8 25104500 */  or         $v0, $v0, $a1
/* 102DC 80027ADC 0800E003 */  jr         $ra
/* 102E0 80027AE0 000082AC */   sw        $v0, 0x0($a0)
