.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022FDC
/* B7DC 80022FDC 00008390 */  lbu        $v1, 0x0($a0)
/* B7E0 80022FE0 21100000 */  addu       $v0, $zero, $zero
/* B7E4 80022FE4 05006010 */  beqz       $v1, .L80022FFC
/* B7E8 80022FE8 01008424 */   addiu     $a0, $a0, 0x1
.L80022FEC:
/* B7EC 80022FEC 00008390 */  lbu        $v1, 0x0($a0)
/* B7F0 80022FF0 01008424 */  addiu      $a0, $a0, 0x1
/* B7F4 80022FF4 FDFF6014 */  bnez       $v1, .L80022FEC
/* B7F8 80022FF8 01004224 */   addiu     $v0, $v0, 0x1
.L80022FFC:
/* B7FC 80022FFC 0800E003 */  jr         $ra
/* B800 80023000 00000000 */   nop
