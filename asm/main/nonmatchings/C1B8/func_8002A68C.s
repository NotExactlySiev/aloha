.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A68C
/* 12E8C 8002A68C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12E90 8002A690 0580053C */  lui        $a1, %hi(D_800536AC)
/* 12E94 8002A694 AC36A58C */  lw         $a1, %lo(D_800536AC)($a1)
/* 12E98 8002A698 1000BFAF */  sw         $ra, 0x10($sp)
/* 12E9C 8002A69C 0580013C */  lui        $at, %hi(D_800536B8)
/* 12EA0 8002A6A0 B83620AC */  sw         $zero, %lo(D_800536B8)($at)
/* 12EA4 8002A6A4 0580013C */  lui        $at, %hi(D_800536B4)
/* 12EA8 8002A6A8 B43620AC */  sw         $zero, %lo(D_800536B4)($at)
/* 12EAC 8002A6AC 0580013C */  lui        $at, %hi(D_800536B0)
/* 12EB0 8002A6B0 B03620AC */  sw         $zero, %lo(D_800536B0)($at)
/* 12EB4 8002A6B4 0580013C */  lui        $at, %hi(D_80054708)
/* 12EB8 8002A6B8 084720AC */  sw         $zero, %lo(D_80054708)($at)
/* 12EBC 8002A6BC 55AA000C */  jal        func_8002A954
/* 12EC0 8002A6C0 21200000 */   addu      $a0, $zero, $zero
/* 12EC4 8002A6C4 0580013C */  lui        $at, %hi(D_80054710)
/* 12EC8 8002A6C8 104720AC */  sw         $zero, %lo(D_80054710)($at)
/* 12ECC 8002A6CC 1000BF8F */  lw         $ra, 0x10($sp)
/* 12ED0 8002A6D0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12ED4 8002A6D4 0800E003 */  jr         $ra
/* 12ED8 8002A6D8 00000000 */   nop
