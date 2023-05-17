.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A634
/* 12E34 8002A634 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12E38 8002A638 0580013C */  lui        $at, %hi(D_80054754)
/* 12E3C 8002A63C 544724AC */  sw         $a0, %lo(D_80054754)($at)
/* 12E40 8002A640 1000BFAF */  sw         $ra, 0x10($sp)
/* 12E44 8002A644 0580013C */  lui        $at, %hi(D_800536AC)
/* 12E48 8002A648 AC3625AC */  sw         $a1, %lo(D_800536AC)($at)
/* 12E4C 8002A64C 0580013C */  lui        $at, %hi(D_800536B8)
/* 12E50 8002A650 B83620AC */  sw         $zero, %lo(D_800536B8)($at)
/* 12E54 8002A654 0580013C */  lui        $at, %hi(D_800536B4)
/* 12E58 8002A658 B43620AC */  sw         $zero, %lo(D_800536B4)($at)
/* 12E5C 8002A65C 0580013C */  lui        $at, %hi(D_800536B0)
/* 12E60 8002A660 B03620AC */  sw         $zero, %lo(D_800536B0)($at)
/* 12E64 8002A664 0580013C */  lui        $at, %hi(D_80054708)
/* 12E68 8002A668 084720AC */  sw         $zero, %lo(D_80054708)($at)
/* 12E6C 8002A66C 55AA000C */  jal        func_8002A954
/* 12E70 8002A670 21200000 */   addu      $a0, $zero, $zero
/* 12E74 8002A674 0580013C */  lui        $at, %hi(D_80054710)
/* 12E78 8002A678 104720AC */  sw         $zero, %lo(D_80054710)($at)
/* 12E7C 8002A67C 1000BF8F */  lw         $ra, 0x10($sp)
/* 12E80 8002A680 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12E84 8002A684 0800E003 */  jr         $ra
/* 12E88 8002A688 00000000 */   nop
