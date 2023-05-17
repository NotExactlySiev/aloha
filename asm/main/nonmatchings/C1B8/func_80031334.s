.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031334
/* 19B34 80031334 0580023C */  lui        $v0, %hi(D_80054704)
/* 19B38 80031338 0447428C */  lw         $v0, %lo(D_80054704)($v0)
/* 19B3C 8003133C 0800E003 */  jr         $ra
/* 19B40 80031340 0100422C */   sltiu     $v0, $v0, 0x1
