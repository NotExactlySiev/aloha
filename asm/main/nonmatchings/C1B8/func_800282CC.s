.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800282CC
/* 10ACC 800282CC 0580023C */  lui        $v0, %hi(D_800548FC)
/* 10AD0 800282D0 FC48428C */  lw         $v0, %lo(D_800548FC)($v0)
/* 10AD4 800282D4 0580013C */  lui        $at, %hi(D_800548FC)
/* 10AD8 800282D8 FC4824AC */  sw         $a0, %lo(D_800548FC)($at)
/* 10ADC 800282DC 0800E003 */  jr         $ra
/* 10AE0 800282E0 00000000 */   nop
