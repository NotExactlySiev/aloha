.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800229F8
/* B1F8 800229F8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B1FC 800229FC 1000BFAF */  sw         $ra, 0x10($sp)
/* B200 80022A00 FF00A530 */  andi       $a1, $a1, 0xFF
/* B204 80022A04 FF00C630 */  andi       $a2, $a2, 0xFF
/* B208 80022A08 8B94000C */  jal        func_8002522C
/* B20C 80022A0C FF00E730 */   andi      $a3, $a3, 0xFF
/* B210 80022A10 1000BF8F */  lw         $ra, 0x10($sp)
/* B214 80022A14 00000000 */  nop
/* B218 80022A18 0800E003 */  jr         $ra
/* B21C 80022A1C 1800BD27 */   addiu     $sp, $sp, 0x18
