.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022934
/* B134 80022934 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B138 80022938 1000BFAF */  sw         $ra, 0x10($sp)
/* B13C 8002293C ED93000C */  jal        func_80024FB4
/* B140 80022940 00000000 */   nop
/* B144 80022944 1000BF8F */  lw         $ra, 0x10($sp)
/* B148 80022948 00000000 */  nop
/* B14C 8002294C 0800E003 */  jr         $ra
/* B150 80022950 1800BD27 */   addiu     $sp, $sp, 0x18
