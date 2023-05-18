.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019CB4
/* 24B4 80019CB4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 24B8 80019CB8 1000BFAF */  sw         $ra, 0x10($sp)
/* 24BC 80019CBC 2D66000C */  jal        jt_clear
/* 24C0 80019CC0 00000000 */   nop
/* 24C4 80019CC4 0280043C */  lui        $a0, %hi(func_80019DCC)
/* 24C8 80019CC8 CC9D8424 */  addiu      $a0, $a0, %lo(func_80019DCC)
/* 24CC 80019CCC 4266000C */  jal        jt_set
/* 24D0 80019CD0 FF000534 */   ori       $a1, $zero, 0xFF
/* 24D4 80019CD4 0280043C */  lui        $a0, %hi(func_80019CA4)
/* 24D8 80019CD8 A49C8424 */  addiu      $a0, $a0, %lo(func_80019CA4)
/* 24DC 80019CDC 4266000C */  jal        jt_set
/* 24E0 80019CE0 02000534 */   ori       $a1, $zero, 0x2
/* 24E4 80019CE4 0280043C */  lui        $a0, %hi(func_80018A3C)
/* 24E8 80019CE8 3C8A8424 */  addiu      $a0, $a0, %lo(func_80018A3C)
/* 24EC 80019CEC 4266000C */  jal        jt_set
/* 24F0 80019CF0 06000534 */   ori       $a1, $zero, 0x6
/* 24F4 80019CF4 0280023C */  lui        $v0, %hi(func_80019B1C)
/* 24F8 80019CF8 1C9B4224 */  addiu      $v0, $v0, %lo(func_80019B1C)
/* 24FC 80019CFC 1000BF8F */  lw         $ra, 0x10($sp)
/* 2500 80019D00 00000000 */  nop
/* 2504 80019D04 0800E003 */  jr         $ra
/* 2508 80019D08 1800BD27 */   addiu     $sp, $sp, 0x18
