.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C0BC
/* 148BC 8002C0BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 148C0 8002C0C0 1000BFAF */  sw         $ra, 0x10($sp)
/* 148C4 8002C0C4 43B0000C */  jal        func_8002C10C
/* 148C8 8002C0C8 00000000 */   nop
/* 148CC 8002C0CC 0580023C */  lui        $v0, %hi(D_800546D0)
/* 148D0 8002C0D0 D046428C */  lw         $v0, %lo(D_800546D0)($v0)
/* 148D4 8002C0D4 00000000 */  nop
/* 148D8 8002C0D8 27100200 */  nor        $v0, $zero, $v0
/* 148DC 8002C0DC 1000BF8F */  lw         $ra, 0x10($sp)
/* 148E0 8002C0E0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 148E4 8002C0E4 0800E003 */  jr         $ra
/* 148E8 8002C0E8 00000000 */   nop
