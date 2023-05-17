.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800230E8
/* B8E8 800230E8 00008290 */  lbu        $v0, 0x0($a0)
/* B8EC 800230EC 21180000 */  addu       $v1, $zero, $zero
/* B8F0 800230F0 05004010 */  beqz       $v0, .L80023108
/* B8F4 800230F4 01008424 */   addiu     $a0, $a0, 0x1
.L800230F8:
/* B8F8 800230F8 00008290 */  lbu        $v0, 0x0($a0)
/* B8FC 800230FC 01006324 */  addiu      $v1, $v1, 0x1
/* B900 80023100 FDFF4014 */  bnez       $v0, .L800230F8
/* B904 80023104 01008424 */   addiu     $a0, $a0, 0x1
.L80023108:
/* B908 80023108 0800E003 */  jr         $ra
/* B90C 8002310C 21106000 */   addu      $v0, $v1, $zero
