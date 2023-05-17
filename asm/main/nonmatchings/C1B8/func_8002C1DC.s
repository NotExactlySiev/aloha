.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C1DC
/* 149DC 8002C1DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 149E0 8002C1E0 0480043C */  lui        $a0, %hi(D_800473F0)
/* 149E4 8002C1E4 F0738424 */  addiu      $a0, $a0, %lo(D_800473F0)
/* 149E8 8002C1E8 02000534 */  ori        $a1, $zero, 0x2
/* 149EC 8002C1EC 1000BFAF */  sw         $ra, 0x10($sp)
/* 149F0 8002C1F0 A6B0000C */  jal        func_8002C298
/* 149F4 8002C1F4 000080A4 */   sh        $zero, 0x0($a0)
/* 149F8 8002C1F8 21200000 */  addu       $a0, $zero, $zero
/* 149FC 8002C1FC D4AD000C */  jal        func_8002B750
/* 14A00 8002C200 21280000 */   addu      $a1, $zero, $zero
/* 14A04 8002C204 1000BF8F */  lw         $ra, 0x10($sp)
/* 14A08 8002C208 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14A0C 8002C20C 0800E003 */  jr         $ra
/* 14A10 8002C210 00000000 */   nop
