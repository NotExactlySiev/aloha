.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800198B4
/* 20B4 800198B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 20B8 800198B8 1000BFAF */  sw         $ra, 0x10($sp)
/* 20BC 800198BC 0180043C */  lui        $a0, %hi(D_80010000)
/* 20C0 800198C0 FF0F023C */  lui        $v0, (0xFFFFFFF >> 16)
/* 20C4 800198C4 FFFF4234 */  ori        $v0, $v0, (0xFFFFFFF & 0xFFFF)
/* 20C8 800198C8 0280033C */  lui        $v1, %hi(func_8001987C)
/* 20CC 800198CC 7C986324 */  addiu      $v1, $v1, %lo(func_8001987C)
/* 20D0 800198D0 24186200 */  and        $v1, $v1, $v0
/* 20D4 800198D4 0080023C */  lui        $v0, (0x80000000 >> 16)
/* 20D8 800198D8 25186200 */  or         $v1, $v1, $v0
/* 20DC 800198DC FF030234 */  ori        $v0, $zero, 0x3FF
.L800198E0:
/* 20E0 800198E0 000083AC */  sw         $v1, %lo(D_80010000)($a0)
/* 20E4 800198E4 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 20E8 800198E8 FDFF4104 */  bgez       $v0, .L800198E0
/* 20EC 800198EC 04008424 */   addiu     $a0, $a0, %lo(D_80010004)
/* 20F0 800198F0 2166000C */  jal        func_80019884
/* 20F4 800198F4 00000000 */   nop
/* 20F8 800198F8 1000BF8F */  lw         $ra, 0x10($sp)
/* 20FC 800198FC 00000000 */  nop
/* 2100 80019900 0800E003 */  jr         $ra
/* 2104 80019904 1800BD27 */   addiu     $sp, $sp, 0x18
