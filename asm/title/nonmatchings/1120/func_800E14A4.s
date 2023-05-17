.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E14A4
/* 1CA4 800E14A4 01000234 */  ori        $v0, $zero, 0x1
/* 1CA8 800E14A8 1A80013C */  lui        $at, %hi(D_801A0FA8)
/* 1CAC 800E14AC A80F22AC */  sw         $v0, %lo(D_801A0FA8)($at)
/* 1CB0 800E14B0 1A80013C */  lui        $at, %hi(D_801A0FB0)
/* 1CB4 800E14B4 B00F24AC */  sw         $a0, %lo(D_801A0FB0)($at)
/* 1CB8 800E14B8 B4000234 */  ori        $v0, $zero, 0xB4
/* 1CBC 800E14BC 1A80013C */  lui        $at, %hi(D_801A0F98)
/* 1CC0 800E14C0 980F22AC */  sw         $v0, %lo(D_801A0F98)($at)
/* 1CC4 800E14C4 0800E003 */  jr         $ra
/* 1CC8 800E14C8 00000000 */   nop
