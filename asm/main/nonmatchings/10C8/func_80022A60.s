.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022A60
/* B260 80022A60 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B264 80022A64 1000BFAF */  sw         $ra, 0x10($sp)
/* B268 80022A68 3695000C */  jal        func_800254D8
/* B26C 80022A6C 00000000 */   nop
/* B270 80022A70 1000BF8F */  lw         $ra, 0x10($sp)
/* B274 80022A74 00000000 */  nop
/* B278 80022A78 0800E003 */  jr         $ra
/* B27C 80022A7C 1800BD27 */   addiu     $sp, $sp, 0x18
