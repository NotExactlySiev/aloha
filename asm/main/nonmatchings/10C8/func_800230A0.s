.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800230A0
/* B8A0 800230A0 07008018 */  blez       $a0, .L800230C0
/* B8A4 800230A4 00000000 */   nop
.L800230A8:
/* B8A8 800230A8 0000A290 */  lbu        $v0, 0x0($a1)
/* B8AC 800230AC 0100A524 */  addiu      $a1, $a1, 0x1
/* B8B0 800230B0 FFFF8424 */  addiu      $a0, $a0, -0x1
/* B8B4 800230B4 0000C2A0 */  sb         $v0, 0x0($a2)
/* B8B8 800230B8 FBFF801C */  bgtz       $a0, .L800230A8
/* B8BC 800230BC 0100C624 */   addiu     $a2, $a2, 0x1
.L800230C0:
/* B8C0 800230C0 0800E003 */  jr         $ra
/* B8C4 800230C4 00000000 */   nop
