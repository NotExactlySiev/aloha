.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019990
/* 2190 80019990 0480023C */  lui        $v0, %hi(D_80047D64)
/* 2194 80019994 647D428C */  lw         $v0, %lo(D_80047D64)($v0)
/* 2198 80019998 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 219C 8001999C 09004010 */  beqz       $v0, .L800199C4
/* 21A0 800199A0 1000BFAF */   sw        $ra, 0x10($sp)
/* 21A4 800199A4 0280043C */  lui        $a0, %hi(func_800232D4)
/* 21A8 800199A8 D4328424 */  addiu      $a0, $a0, %lo(func_800232D4)
/* 21AC 800199AC F265000C */  jal        func_800197C8
/* 21B0 800199B0 00000000 */   nop
/* 21B4 800199B4 0480013C */  lui        $at, %hi(D_80047E74)
/* 21B8 800199B8 747E22AC */  sw         $v0, %lo(D_80047E74)($at)
/* 21BC 800199BC 0480013C */  lui        $at, %hi(D_80047D64)
/* 21C0 800199C0 647D20AC */  sw         $zero, %lo(D_80047D64)($at)
.L800199C4:
/* 21C4 800199C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 21C8 800199C8 00000000 */  nop
/* 21CC 800199CC 0800E003 */  jr         $ra
/* 21D0 800199D0 1800BD27 */   addiu     $sp, $sp, 0x18
