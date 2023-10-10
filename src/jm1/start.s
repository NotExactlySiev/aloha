.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"


# Handwritten function

# jumptable pointer pointer
glabel func_800C6B64
/* 17364 800C6B64 00000180 */  .word    0x80010000

glabel func_800C6B68
/* 17368 800C6B68 FCFFBD23 */  addi       $sp, $sp, -0x4 # handwritten instruction
/* 1736C 800C6B6C 0000BFAF */  sw         $ra, 0x0($sp)
/* 17370 800C6B70 0080043C */  lui        $a0, (0x80000000 >> 16)
/* 17374 800C6B74 0C000000 */  syscall    0
/* 17378 800C6B78 00000000 */  nop
/* 1737C 800C6B7C 04004010 */  beqz       $v0, .L800C6B90
/* 17380 800C6B80 00000000 */   nop
/* 17384 800C6B84 00000000 */  nop
/* 17388 800C6B88 09F84000 */  jalr       $v0
/* 1738C 800C6B8C 00000000 */   nop
.L800C6B90:
/* 17390 800C6B90 0000BF8F */  lw         $ra, 0x0($sp)
/* 17394 800C6B94 0400BD23 */  addi       $sp, $sp, 0x4 # handwritten instruction
/* 17398 800C6B98 0800E003 */  jr         $ra
/* 1739C 800C6B9C 00000000 */   nop
/* 173A0 800C6BA0 00000000 */  nop

glabel func_800C6BA4
/* 173A4 800C6BA4 0800E003 */  jr         $ra
/* 173A8 800C6BA8 00000000 */   nop

glabel _start
/* 173AC 800C6BAC 50800308 */  j          main
/* 173B0 800C6BB0 00000000 */   nop
