.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel k_boot
/* C000 80023800 A0000A24 */  addiu      $t2, $zero, 0xA0
/* C004 80023804 08004001 */  jr         $t2
/* C008 80023808 A0000924 */   addiu     $t1, $zero, 0xA0
/* C00C 8002380C 00000000 */  nop
