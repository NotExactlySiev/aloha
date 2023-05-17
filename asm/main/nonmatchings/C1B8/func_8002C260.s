.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C260
/* 14A60 8002C260 0480023C */  lui        $v0, %hi(D_800473F0)
/* 14A64 8002C264 F0734294 */  lhu        $v0, %lo(D_800473F0)($v0)
/* 14A68 8002C268 00000000 */  nop
/* 14A6C 8002C26C 08004010 */  beqz       $v0, .L8002C290
/* 14A70 8002C270 00000000 */   nop
/* 14A74 8002C274 0480033C */  lui        $v1, %hi(D_800473F4)
/* 14A78 8002C278 F473638C */  lw         $v1, %lo(D_800473F4)($v1)
/* 14A7C 8002C27C 00000000 */  nop
/* 14A80 8002C280 03008310 */  beq        $a0, $v1, .L8002C290
/* 14A84 8002C284 00000000 */   nop
/* 14A88 8002C288 0480013C */  lui        $at, %hi(D_800473F4)
/* 14A8C 8002C28C F47324AC */  sw         $a0, %lo(D_800473F4)($at)
.L8002C290:
/* 14A90 8002C290 0800E003 */  jr         $ra
/* 14A94 8002C294 21106000 */   addu      $v0, $v1, $zero
