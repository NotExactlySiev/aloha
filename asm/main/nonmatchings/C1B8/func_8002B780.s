.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B780
/* 13F80 8002B780 0480023C */  lui        $v0, %hi(D_80047348)
/* 13F84 8002B784 4873428C */  lw         $v0, %lo(D_80047348)($v0)
/* 13F88 8002B788 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 13F8C 8002B78C 1000BFAF */  sw         $ra, 0x10($sp)
/* 13F90 8002B790 0400428C */  lw         $v0, 0x4($v0)
/* 13F94 8002B794 00000000 */  nop
/* 13F98 8002B798 09F84000 */  jalr       $v0
/* 13F9C 8002B79C 00000000 */   nop
/* 13FA0 8002B7A0 1000BF8F */  lw         $ra, 0x10($sp)
/* 13FA4 8002B7A4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 13FA8 8002B7A8 0800E003 */  jr         $ra
/* 13FAC 8002B7AC 00000000 */   nop
