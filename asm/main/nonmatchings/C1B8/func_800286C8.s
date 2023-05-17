.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800286C8
/* 10EC8 800286C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 10ECC 800286CC 1000BFAF */  sw         $ra, 0x10($sp)
/* 10ED0 800286D0 EBA5000C */  jal        func_800297AC
/* 10ED4 800286D4 00000000 */   nop
/* 10ED8 800286D8 01000234 */  ori        $v0, $zero, 0x1
/* 10EDC 800286DC 1000BF8F */  lw         $ra, 0x10($sp)
/* 10EE0 800286E0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 10EE4 800286E4 0800E003 */  jr         $ra
/* 10EE8 800286E8 00000000 */   nop
