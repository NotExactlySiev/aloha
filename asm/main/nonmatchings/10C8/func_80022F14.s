.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022F14
/* B714 80022F14 00008290 */  lbu        $v0, 0x0($a0)
/* B718 80022F18 00000000 */  nop
/* B71C 80022F1C 06004010 */  beqz       $v0, .L80022F38
/* B720 80022F20 01008424 */   addiu     $a0, $a0, 0x1
.L80022F24:
/* B724 80022F24 0000C2A0 */  sb         $v0, 0x0($a2)
/* B728 80022F28 00008290 */  lbu        $v0, 0x0($a0)
/* B72C 80022F2C 0100C624 */  addiu      $a2, $a2, 0x1
/* B730 80022F30 FCFF4014 */  bnez       $v0, .L80022F24
/* B734 80022F34 01008424 */   addiu     $a0, $a0, 0x1
.L80022F38:
/* B738 80022F38 0000A290 */  lbu        $v0, 0x0($a1)
/* B73C 80022F3C 00000000 */  nop
/* B740 80022F40 06004010 */  beqz       $v0, .L80022F5C
/* B744 80022F44 0100A524 */   addiu     $a1, $a1, 0x1
.L80022F48:
/* B748 80022F48 0000C2A0 */  sb         $v0, 0x0($a2)
/* B74C 80022F4C 0000A290 */  lbu        $v0, 0x0($a1)
/* B750 80022F50 0100C624 */  addiu      $a2, $a2, 0x1
/* B754 80022F54 FCFF4014 */  bnez       $v0, .L80022F48
/* B758 80022F58 0100A524 */   addiu     $a1, $a1, 0x1
.L80022F5C:
/* B75C 80022F5C 0800E003 */  jr         $ra
/* B760 80022F60 0000C0A0 */   sb        $zero, 0x0($a2)
