.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800282E4
/* 10AE4 800282E4 0580023C */  lui        $v0, %hi(D_8005491C)
/* 10AE8 800282E8 1C49428C */  lw         $v0, %lo(D_8005491C)($v0)
/* 10AEC 800282EC 0580013C */  lui        $at, %hi(D_8005491C)
/* 10AF0 800282F0 1C4924AC */  sw         $a0, %lo(D_8005491C)($at)
/* 10AF4 800282F4 0800E003 */  jr         $ra
/* 10AF8 800282F8 00000000 */   nop
