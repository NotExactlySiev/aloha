.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D67C
/* 5E7C 8001D67C 21280000 */  addu       $a1, $zero, $zero
/* 5E80 8001D680 21180000 */  addu       $v1, $zero, $zero
.L8001D684:
/* 5E84 8001D684 00008290 */  lbu        $v0, 0x0($a0)
/* 5E88 8001D688 00000000 */  nop
/* 5E8C 8001D68C 04106200 */  sllv       $v0, $v0, $v1
/* 5E90 8001D690 2528A200 */  or         $a1, $a1, $v0
/* 5E94 8001D694 08006324 */  addiu      $v1, $v1, 0x8
/* 5E98 8001D698 20006228 */  slti       $v0, $v1, 0x20
/* 5E9C 8001D69C F9FF4014 */  bnez       $v0, .L8001D684
/* 5EA0 8001D6A0 01008424 */   addiu     $a0, $a0, 0x1
/* 5EA4 8001D6A4 0800E003 */  jr         $ra
/* 5EA8 8001D6A8 2110A000 */   addu      $v0, $a1, $zero
