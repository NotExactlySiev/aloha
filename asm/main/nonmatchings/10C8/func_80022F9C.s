.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022F9C
/* B79C 80022F9C 00008390 */  lbu        $v1, 0x0($a0)
/* B7A0 80022FA0 00000000 */  nop
/* B7A4 80022FA4 0B006010 */  beqz       $v1, .L80022FD4
/* B7A8 80022FA8 01008424 */   addiu     $a0, $a0, 0x1
.L80022FAC:
/* B7AC 80022FAC 9FFF6224 */  addiu      $v0, $v1, -0x61
/* B7B0 80022FB0 1A00422C */  sltiu      $v0, $v0, 0x1A
/* B7B4 80022FB4 02004010 */  beqz       $v0, .L80022FC0
/* B7B8 80022FB8 00000000 */   nop
/* B7BC 80022FBC DF006330 */  andi       $v1, $v1, 0xDF
.L80022FC0:
/* B7C0 80022FC0 0000A3A0 */  sb         $v1, 0x0($a1)
/* B7C4 80022FC4 00008390 */  lbu        $v1, 0x0($a0)
/* B7C8 80022FC8 0100A524 */  addiu      $a1, $a1, 0x1
/* B7CC 80022FCC F7FF6014 */  bnez       $v1, .L80022FAC
/* B7D0 80022FD0 01008424 */   addiu     $a0, $a0, 0x1
.L80022FD4:
/* B7D4 80022FD4 0800E003 */  jr         $ra
/* B7D8 80022FD8 0000A0A0 */   sb        $zero, 0x0($a1)
