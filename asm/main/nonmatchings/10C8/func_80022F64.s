.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022F64
/* B764 80022F64 00008390 */  lbu        $v1, 0x0($a0)
/* B768 80022F68 21100000 */  addu       $v0, $zero, $zero
/* B76C 80022F6C 09006010 */  beqz       $v1, .L80022F94
/* B770 80022F70 01008424 */   addiu     $a0, $a0, 0x1
/* B774 80022F74 FF00A530 */  andi       $a1, $a1, 0xFF
.L80022F78:
/* B778 80022F78 0200A314 */  bne        $a1, $v1, .L80022F84
/* B77C 80022F7C 00000000 */   nop
/* B780 80022F80 01000234 */  ori        $v0, $zero, 0x1
.L80022F84:
/* B784 80022F84 00008390 */  lbu        $v1, 0x0($a0)
/* B788 80022F88 00000000 */  nop
/* B78C 80022F8C FAFF6014 */  bnez       $v1, .L80022F78
/* B790 80022F90 01008424 */   addiu     $a0, $a0, 0x1
.L80022F94:
/* B794 80022F94 0800E003 */  jr         $ra
/* B798 80022F98 00000000 */   nop
