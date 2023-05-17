.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CCC0
/* 54C0 8001CCC0 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 54C4 8001CCC4 5000BFAF */  sw         $ra, 0x50($sp)
/* 54C8 8001CCC8 A172000C */  jal        func_8001CA84
/* 54CC 8001CCCC 1000A627 */   addiu     $a2, $sp, 0x10
/* 54D0 8001CCD0 0A004014 */  bnez       $v0, .L8001CCFC
/* 54D4 8001CCD4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 54D8 8001CCD8 2166000C */  jal        func_80019884
/* 54DC 8001CCDC 00000000 */   nop
/* 54E0 8001CCE0 7667000C */  jal        func_80019DD8
/* 54E4 8001CCE4 21200000 */   addu      $a0, $zero, $zero
/* 54E8 8001CCE8 1000A427 */  addiu      $a0, $sp, 0x10
/* 54EC 8001CCEC 01000534 */  ori        $a1, $zero, 0x1
/* 54F0 8001CCF0 F68E000C */  jal        func_80023BD8
/* 54F4 8001CCF4 21300000 */   addu      $a2, $zero, $zero
/* 54F8 8001CCF8 21100000 */  addu       $v0, $zero, $zero
.L8001CCFC:
/* 54FC 8001CCFC 5000BF8F */  lw         $ra, 0x50($sp)
/* 5500 8001CD00 00000000 */  nop
/* 5504 8001CD04 0800E003 */  jr         $ra
/* 5508 8001CD08 5800BD27 */   addiu     $sp, $sp, 0x58
