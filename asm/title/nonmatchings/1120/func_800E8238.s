.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8238
/* 8A38 800E8238 0F80033C */  lui        $v1, %hi(D_800F4DE4)
/* 8A3C 800E823C E44D638C */  lw         $v1, %lo(D_800F4DE4)($v1)
/* 8A40 800E8240 0F80023C */  lui        $v0, %hi(D_800F4DEC)
/* 8A44 800E8244 EC4D428C */  lw         $v0, %lo(D_800F4DEC)($v0)
/* 8A48 800E8248 00000000 */  nop
/* 8A4C 800E824C 2A106200 */  slt        $v0, $v1, $v0
/* 8A50 800E8250 07004010 */  beqz       $v0, .L800E8270
/* 8A54 800E8254 00000000 */   nop
/* 8A58 800E8258 0F80023C */  lui        $v0, %hi(D_800F4DE8)
/* 8A5C 800E825C E84D428C */  lw         $v0, %lo(D_800F4DE8)($v0)
/* 8A60 800E8260 00000000 */  nop
/* 8A64 800E8264 21106200 */  addu       $v0, $v1, $v0
/* 8A68 800E8268 0F80013C */  lui        $at, %hi(D_800F4DE4)
/* 8A6C 800E826C E44D22AC */  sw         $v0, %lo(D_800F4DE4)($at)
.L800E8270:
/* 8A70 800E8270 0800E003 */  jr         $ra
/* 8A74 800E8274 00000000 */   nop
