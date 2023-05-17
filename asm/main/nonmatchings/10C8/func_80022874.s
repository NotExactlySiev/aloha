.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022874
/* B074 80022874 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B078 80022878 1000BFAF */  sw         $ra, 0x10($sp)
/* B07C 8002287C E294000C */  jal        func_80025388
/* B080 80022880 00000000 */   nop
/* B084 80022884 1000BF8F */  lw         $ra, 0x10($sp)
/* B088 80022888 00000000 */  nop
/* B08C 8002288C 0800E003 */  jr         $ra
/* B090 80022890 1800BD27 */   addiu     $sp, $sp, 0x18
