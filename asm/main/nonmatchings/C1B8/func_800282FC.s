.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800282FC
/* 10AFC 800282FC 0580023C */  lui        $v0, %hi(D_800548F8)
/* 10B00 80028300 F848428C */  lw         $v0, %lo(D_800548F8)($v0)
/* 10B04 80028304 0580013C */  lui        $at, %hi(D_800548F8)
/* 10B08 80028308 F84824AC */  sw         $a0, %lo(D_800548F8)($at)
/* 10B0C 8002830C 0800E003 */  jr         $ra
/* 10B10 80028310 00000000 */   nop
