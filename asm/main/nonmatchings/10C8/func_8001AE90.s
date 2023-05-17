.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AE90
/* 3690 8001AE90 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 3694 8001AE94 1000BFAF */  sw         $ra, 0x10($sp)
/* 3698 8001AE98 FA000434 */  ori        $a0, $zero, 0xFA
/* 369C 8001AE9C 21280000 */  addu       $a1, $zero, $zero
/* 36A0 8001AEA0 086C000C */  jal        func_8001B020
/* 36A4 8001AEA4 21300000 */   addu      $a2, $zero, $zero
/* 36A8 8001AEA8 FB000434 */  ori        $a0, $zero, 0xFB
/* 36AC 8001AEAC 21280000 */  addu       $a1, $zero, $zero
/* 36B0 8001AEB0 086C000C */  jal        func_8001B020
/* 36B4 8001AEB4 21300000 */   addu      $a2, $zero, $zero
/* 36B8 8001AEB8 376E000C */  jal        func_8001B8DC
/* 36BC 8001AEBC 00000000 */   nop
/* 36C0 8001AEC0 0480013C */  lui        $at, %hi(D_80047ED4)
/* 36C4 8001AEC4 D47E20AC */  sw         $zero, %lo(D_80047ED4)($at)
/* 36C8 8001AEC8 1000BF8F */  lw         $ra, 0x10($sp)
/* 36CC 8001AECC 00000000 */  nop
/* 36D0 8001AED0 0800E003 */  jr         $ra
/* 36D4 8001AED4 1800BD27 */   addiu     $sp, $sp, 0x18
