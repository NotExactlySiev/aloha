.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022A40
/* B240 80022A40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B244 80022A44 1000BFAF */  sw         $ra, 0x10($sp)
/* B248 80022A48 0B95000C */  jal        func_8002542C
/* B24C 80022A4C 00000000 */   nop
/* B250 80022A50 1000BF8F */  lw         $ra, 0x10($sp)
/* B254 80022A54 00000000 */  nop
/* B258 80022A58 0800E003 */  jr         $ra
/* B25C 80022A5C 1800BD27 */   addiu     $sp, $sp, 0x18
