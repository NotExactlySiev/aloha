.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C13C
/* 1493C 8002C13C 0480023C */  lui        $v0, %hi(D_800473E4)
/* 14940 8002C140 E473428C */  lw         $v0, %lo(D_800473E4)($v0)
/* 14944 8002C144 0480013C */  lui        $at, %hi(D_800473E4)
/* 14948 8002C148 E47324AC */  sw         $a0, %lo(D_800473E4)($at)
/* 1494C 8002C14C 0800E003 */  jr         $ra
/* 14950 8002C150 00000000 */   nop
