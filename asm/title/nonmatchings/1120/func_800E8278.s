.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8278
/* 8A78 800E8278 0F80043C */  lui        $a0, %hi(D_800F4DE4)
/* 8A7C 800E827C E44D848C */  lw         $a0, %lo(D_800F4DE4)($a0)
/* 8A80 800E8280 0F80033C */  lui        $v1, %hi(D_800F4DE8)
/* 8A84 800E8284 E84D638C */  lw         $v1, %lo(D_800F4DE8)($v1)
/* 8A88 800E8288 00000000 */  nop
/* 8A8C 800E828C 2A106400 */  slt        $v0, $v1, $a0
/* 8A90 800E8290 03004010 */  beqz       $v0, .L800E82A0
/* 8A94 800E8294 23108300 */   subu      $v0, $a0, $v1
/* 8A98 800E8298 0F80013C */  lui        $at, %hi(D_800F4DE4)
/* 8A9C 800E829C E44D22AC */  sw         $v0, %lo(D_800F4DE4)($at)
.L800E82A0:
/* 8AA0 800E82A0 0800E003 */  jr         $ra
/* 8AA4 800E82A4 00000000 */   nop
