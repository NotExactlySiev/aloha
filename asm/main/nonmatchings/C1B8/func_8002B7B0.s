.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B7B0
/* 13FB0 8002B7B0 0480023C */  lui        $v0, %hi(D_80047348)
/* 13FB4 8002B7B4 4873428C */  lw         $v0, %lo(D_80047348)($v0)
/* 13FB8 8002B7B8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 13FBC 8002B7BC 1000BFAF */  sw         $ra, 0x10($sp)
/* 13FC0 8002B7C0 1400428C */  lw         $v0, 0x14($v0)
/* 13FC4 8002B7C4 00000000 */  nop
/* 13FC8 8002B7C8 09F84000 */  jalr       $v0
/* 13FCC 8002B7CC 00000000 */   nop
/* 13FD0 8002B7D0 1000BF8F */  lw         $ra, 0x10($sp)
/* 13FD4 8002B7D4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 13FD8 8002B7D8 0800E003 */  jr         $ra
/* 13FDC 8002B7DC 00000000 */   nop
