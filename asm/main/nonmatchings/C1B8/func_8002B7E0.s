.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B7E0
/* 13FE0 8002B7E0 0480023C */  lui        $v0, %hi(D_80047348)
/* 13FE4 8002B7E4 4873428C */  lw         $v0, %lo(D_80047348)($v0)
/* 13FE8 8002B7E8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 13FEC 8002B7EC 1000BFAF */  sw         $ra, 0x10($sp)
/* 13FF0 8002B7F0 1000428C */  lw         $v0, 0x10($v0)
/* 13FF4 8002B7F4 00000000 */  nop
/* 13FF8 8002B7F8 09F84000 */  jalr       $v0
/* 13FFC 8002B7FC 00000000 */   nop
/* 14000 8002B800 1000BF8F */  lw         $ra, 0x10($sp)
/* 14004 8002B804 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14008 8002B808 0800E003 */  jr         $ra
/* 1400C 8002B80C 00000000 */   nop
