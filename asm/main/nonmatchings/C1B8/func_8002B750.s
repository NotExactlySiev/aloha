.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002B750
/* 13F50 8002B750 0480023C */  lui        $v0, %hi(D_80047348)
/* 13F54 8002B754 4873428C */  lw         $v0, %lo(D_80047348)($v0)
/* 13F58 8002B758 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 13F5C 8002B75C 1000BFAF */  sw         $ra, 0x10($sp)
/* 13F60 8002B760 0800428C */  lw         $v0, 0x8($v0)
/* 13F64 8002B764 00000000 */  nop
/* 13F68 8002B768 09F84000 */  jalr       $v0
/* 13F6C 8002B76C 00000000 */   nop
/* 13F70 8002B770 1000BF8F */  lw         $ra, 0x10($sp)
/* 13F74 8002B774 1800BD27 */  addiu      $sp, $sp, 0x18
/* 13F78 8002B778 0800E003 */  jr         $ra
/* 13F7C 8002B77C 00000000 */   nop
