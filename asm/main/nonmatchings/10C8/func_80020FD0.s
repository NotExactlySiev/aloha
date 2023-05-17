.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020FD0
/* 97D0 80020FD0 0480033C */  lui        $v1, %hi(D_80047E50)
/* 97D4 80020FD4 507E638C */  lw         $v1, %lo(D_80047E50)($v1)
/* 97D8 80020FD8 00000000 */  nop
/* 97DC 80020FDC 00006594 */  lhu        $a1, 0x0($v1)
/* 97E0 80020FE0 00000000 */  nop
/* 97E4 80020FE4 0D00A010 */  beqz       $a1, .L8002101C
/* 97E8 80020FE8 04006324 */   addiu     $v1, $v1, 0x4
/* 97EC 80020FEC FF008430 */  andi       $a0, $a0, 0xFF
/* 97F0 80020FF0 FFFF0634 */  ori        $a2, $zero, 0xFFFF
.L80020FF4:
/* 97F4 80020FF4 00006290 */  lbu        $v0, 0x0($v1)
/* 97F8 80020FF8 00000000 */  nop
/* 97FC 80020FFC 08004410 */  beq        $v0, $a0, .L80021020
/* 9800 80021000 21106000 */   addu      $v0, $v1, $zero
/* 9804 80021004 0400628C */  lw         $v0, 0x4($v1)
/* 9808 80021008 2128A600 */  addu       $a1, $a1, $a2
/* 980C 8002100C 21186200 */  addu       $v1, $v1, $v0
/* 9810 80021010 FFFFA230 */  andi       $v0, $a1, 0xFFFF
/* 9814 80021014 F7FF4014 */  bnez       $v0, .L80020FF4
/* 9818 80021018 00000000 */   nop
.L8002101C:
/* 981C 8002101C 21100000 */  addu       $v0, $zero, $zero
.L80021020:
/* 9820 80021020 0800E003 */  jr         $ra
/* 9824 80021024 00000000 */   nop
