.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800230C8
/* B8C8 800230C8 0500A018 */  blez       $a1, .L800230E0
/* B8CC 800230CC 00000000 */   nop
.L800230D0:
/* B8D0 800230D0 000086A0 */  sb         $a2, 0x0($a0)
/* B8D4 800230D4 FFFFA524 */  addiu      $a1, $a1, -0x1
/* B8D8 800230D8 FDFFA01C */  bgtz       $a1, .L800230D0
/* B8DC 800230DC 01008424 */   addiu     $a0, $a0, 0x1
.L800230E0:
/* B8E0 800230E0 0800E003 */  jr         $ra
/* B8E4 800230E4 00000000 */   nop
