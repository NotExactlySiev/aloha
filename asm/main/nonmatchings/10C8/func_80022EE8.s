.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022EE8
/* B6E8 80022EE8 00008290 */  lbu        $v0, 0x0($a0)
/* B6EC 80022EEC 00000000 */  nop
/* B6F0 80022EF0 06004010 */  beqz       $v0, .L80022F0C
/* B6F4 80022EF4 01008424 */   addiu     $a0, $a0, 0x1
.L80022EF8:
/* B6F8 80022EF8 0000A2A0 */  sb         $v0, 0x0($a1)
/* B6FC 80022EFC 00008290 */  lbu        $v0, 0x0($a0)
/* B700 80022F00 0100A524 */  addiu      $a1, $a1, 0x1
/* B704 80022F04 FCFF4014 */  bnez       $v0, .L80022EF8
/* B708 80022F08 01008424 */   addiu     $a0, $a0, 0x1
.L80022F0C:
/* B70C 80022F0C 0800E003 */  jr         $ra
/* B710 80022F10 0000A0A0 */   sb        $zero, 0x0($a1)
