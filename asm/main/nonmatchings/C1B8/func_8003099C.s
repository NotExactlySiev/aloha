.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8003099C
/* 1919C 8003099C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 191A0 800309A0 1000BFAF */  sw         $ra, 0x10($sp)
/* 191A4 800309A4 21288000 */  addu       $a1, $a0, $zero
/* 191A8 800309A8 D4AD000C */  jal        func_8002B750
/* 191AC 800309AC 09000434 */   ori       $a0, $zero, 0x9
/* 191B0 800309B0 1000BF8F */  lw         $ra, 0x10($sp)
/* 191B4 800309B4 1800BD27 */  addiu      $sp, $sp, 0x18
/* 191B8 800309B8 0800E003 */  jr         $ra
/* 191BC 800309BC 00000000 */   nop
