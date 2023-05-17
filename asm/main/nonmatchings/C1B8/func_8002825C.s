.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002825C
/* 10A5C 8002825C FF008430 */  andi       $a0, $a0, 0xFF
/* 10A60 80028260 1C00822C */  sltiu      $v0, $a0, 0x1C
/* 10A64 80028264 07004010 */  beqz       $v0, .L80028284
/* 10A68 80028268 80100400 */   sll       $v0, $a0, 2
/* 10A6C 8002826C 0480013C */  lui        $at, %hi(D_80046FAC)
/* 10A70 80028270 AC6F2124 */  addiu      $at, $at, %lo(D_80046FAC)
/* 10A74 80028274 21082200 */  addu       $at, $at, $v0
/* 10A78 80028278 0000228C */  lw         $v0, 0x0($at)
/* 10A7C 8002827C A3A00008 */  j          .L8002828C
/* 10A80 80028280 00000000 */   nop
.L80028284:
/* 10A84 80028284 0280023C */  lui        $v0, %hi(D_800184D8)
/* 10A88 80028288 D8844224 */  addiu      $v0, $v0, %lo(D_800184D8)
.L8002828C:
/* 10A8C 8002828C 0800E003 */  jr         $ra
/* 10A90 80028290 00000000 */   nop
