.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"

/* Invalid syscall, calls DeliverEvent(F0000010h,4000h) */
glabel func_800ED268
/* DA68 800ED268 FCFFBD23 */  addi       $sp, $sp, -0x4 # handwritten instruction
/* DA6C 800ED26C 0000BFAF */  sw         $ra, 0x0($sp)
/* DA70 800ED270 0080043C */  lui        $a0, (0x80000000 >> 16)
/* DA74 800ED274 0C000000 */  syscall    0
/* DA78 800ED278 03004010 */  beqz       $v0, .L800ED288
/* DA7C 800ED27C 00000000 */   nop
/* DA80 800ED280 09F84000 */  jalr       $v0
/* DA84 800ED284 00000000 */   nop
.L800ED288:
/* DA88 800ED288 0000BF8F */  lw         $ra, 0x0($sp)
/* DA8C 800ED28C 0400BD23 */  addi       $sp, $sp, 0x4 # handwritten instruction
/* DA90 800ED290 0800E003 */  jr         $ra
/* DA94 800ED294 00000000 */   nop
glabel _start
/* DAA0 800ED2A0 0F801C3C */  lui        $gp, (0x800F0000 >> 16)
/* DAA4 800ED2A4 70D39C27 */  addiu      $gp, $gp, -0x2C90
/* DAA8 800ED2A8 E9B00308 */  j          main
/* DAAC 800ED2AC 00000000 */   nop