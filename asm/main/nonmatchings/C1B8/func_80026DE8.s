.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026DE8
/* F5E8 80026DE8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* F5EC 80026DEC 1000BFAF */  sw         $ra, 0x10($sp)
/* F5F0 80026DF0 2138C000 */  addu       $a3, $a2, $zero
/* F5F4 80026DF4 839B000C */  jal        func_80026E0C
/* F5F8 80026DF8 21300000 */   addu      $a2, $zero, $zero
/* F5FC 80026DFC 1000BF8F */  lw         $ra, 0x10($sp)
/* F600 80026E00 1800BD27 */  addiu      $sp, $sp, 0x18
/* F604 80026E04 0800E003 */  jr         $ra
/* F608 80026E08 00000000 */   nop
