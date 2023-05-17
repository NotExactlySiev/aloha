.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D740
/* 5F40 8001D740 21188500 */  addu       $v1, $a0, $a1
/* 5F44 8001D744 2A108300 */  slt        $v0, $a0, $v1
/* 5F48 8001D748 0B004010 */  beqz       $v0, .L8001D778
/* 5F4C 8001D74C 21100000 */   addu      $v0, $zero, $zero
.L8001D750:
/* 5F50 8001D750 00008290 */  lbu        $v0, 0x0($a0)
/* 5F54 8001D754 00000000 */  nop
/* 5F58 8001D758 03004014 */  bnez       $v0, .L8001D768
/* 5F5C 8001D75C 00000000 */   nop
/* 5F60 8001D760 DE750008 */  j          .L8001D778
/* 5F64 8001D764 01000234 */   ori       $v0, $zero, 0x1
.L8001D768:
/* 5F68 8001D768 21208200 */  addu       $a0, $a0, $v0
/* 5F6C 8001D76C 2A108300 */  slt        $v0, $a0, $v1
/* 5F70 8001D770 F7FF4014 */  bnez       $v0, .L8001D750
/* 5F74 8001D774 21100000 */   addu      $v0, $zero, $zero
.L8001D778:
/* 5F78 8001D778 0800E003 */  jr         $ra
/* 5F7C 8001D77C 00000000 */   nop
