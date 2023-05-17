.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022914
/* B114 80022914 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B118 80022918 1000BFAF */  sw         $ra, 0x10($sp)
/* B11C 8002291C 2797000C */  jal        func_80025C9C
/* B120 80022920 00000000 */   nop
/* B124 80022924 1000BF8F */  lw         $ra, 0x10($sp)
/* B128 80022928 00000000 */  nop
/* B12C 8002292C 0800E003 */  jr         $ra
/* B130 80022930 1800BD27 */   addiu     $sp, $sp, 0x18
