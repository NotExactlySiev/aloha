.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E744
/* 6F44 8001E744 0580043C */  lui        $a0, %hi(D_80052070)
/* 6F48 8001E748 70208424 */  addiu      $a0, $a0, %lo(D_80052070)
/* 6F4C 8001E74C 01000534 */  ori        $a1, $zero, 0x1
/* 6F50 8001E750 0580023C */  lui        $v0, %hi(D_8005206F)
/* 6F54 8001E754 6F204290 */  lbu        $v0, %lo(D_8005206F)($v0)
/* 6F58 8001E758 01000634 */  ori        $a2, $zero, 0x1
/* 6F5C 8001E75C 01004238 */  xori       $v0, $v0, 0x1
/* 6F60 8001E760 0100432C */  sltiu      $v1, $v0, 0x1
.L8001E764:
/* 6F64 8001E764 0F008290 */  lbu        $v0, 0xF($a0)
/* 6F68 8001E768 00000000 */  nop
/* 6F6C 8001E76C 02004614 */  bne        $v0, $a2, .L8001E778
/* 6F70 8001E770 40180300 */   sll       $v1, $v1, 1
/* 6F74 8001E774 01006334 */  ori        $v1, $v1, 0x1
.L8001E778:
/* 6F78 8001E778 0100A524 */  addiu      $a1, $a1, 0x1
/* 6F7C 8001E77C 1800A228 */  slti       $v0, $a1, 0x18
/* 6F80 8001E780 F8FF4014 */  bnez       $v0, .L8001E764
/* 6F84 8001E784 10008424 */   addiu     $a0, $a0, 0x10
/* 6F88 8001E788 0800E003 */  jr         $ra
/* 6F8C 8001E78C 21106000 */   addu      $v0, $v1, $zero
