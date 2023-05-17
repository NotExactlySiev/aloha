.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CEA0
/* 56A0 8001CEA0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 56A4 8001CEA4 1000BFAF */  sw         $ra, 0x10($sp)
/* 56A8 8001CEA8 F6000434 */  ori        $a0, $zero, 0xF6
/* 56AC 8001CEAC 21280000 */  addu       $a1, $zero, $zero
/* 56B0 8001CEB0 086C000C */  jal        func_8001B020
/* 56B4 8001CEB4 21300000 */   addu      $a2, $zero, $zero
/* 56B8 8001CEB8 1000BF8F */  lw         $ra, 0x10($sp)
/* 56BC 8001CEBC 00000000 */  nop
/* 56C0 8001CEC0 0800E003 */  jr         $ra
/* 56C4 8001CEC4 1800BD27 */   addiu     $sp, $sp, 0x18
