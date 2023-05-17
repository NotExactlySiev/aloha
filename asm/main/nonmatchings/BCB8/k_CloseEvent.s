.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel k_CloseEvent
/* C1A8 800239A8 B0000A24 */  addiu      $t2, $zero, 0xB0
/* C1AC 800239AC 08004001 */  jr         $t2
/* C1B0 800239B0 09000924 */   addiu     $t1, $zero, 0x9
/* C1B4 800239B4 00000000 */  nop
