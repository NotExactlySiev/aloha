.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B720
/* 13F20 8002B720 0480023C */  lui        $v0, %hi(D_80047348)
/* 13F24 8002B724 4873428C */  lw         $v0, %lo(D_80047348)($v0)
/* 13F28 8002B728 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 13F2C 8002B72C 1000BFAF */  sw         $ra, 0x10($sp)
/* 13F30 8002B730 0C00428C */  lw         $v0, 0xC($v0)
/* 13F34 8002B734 00000000 */  nop
/* 13F38 8002B738 09F84000 */  jalr       $v0
/* 13F3C 8002B73C 00000000 */   nop
/* 13F40 8002B740 1000BF8F */  lw         $ra, 0x10($sp)
/* 13F44 8002B744 1800BD27 */  addiu      $sp, $sp, 0x18
/* 13F48 8002B748 0800E003 */  jr         $ra
/* 13F4C 8002B74C 00000000 */   nop
