.include "macro.inc"

.section .text, "ax"

.set noat
.set noreorder

/* jumptable pointer lol */
  glabel jt_ptr
    /* 87A0 800E7FA0 00000180 */  lb         $at, 0x0($zero)


  glabel func_800E7FA4
    /* 87A4 800E7FA4 FCFFBD23 */  addi       $sp, $sp, -0x4 /* handwritten instruction */
    /* 87A8 800E7FA8 0000BFAF */  sw         $ra, 0x0($sp)
    /* 87AC 800E7FAC 0080043C */  lui        $a0, (0x80000000 >> 16)
    /* 87B0 800E7FB0 0C000000 */  syscall    0 /* handwritten instruction */
    /* 87B4 800E7FB4 03004010 */  beqz       $v0, .L800E7FC4
    /* 87B8 800E7FB8 00000000 */   nop
    /* 87BC 800E7FBC 09F84000 */  jalr       $v0
    /* 87C0 800E7FC0 00000000 */   nop
  .L800E7FC4:
    /* 87C4 800E7FC4 0000BF8F */  lw         $ra, 0x0($sp)
    /* 87C8 800E7FC8 0400BD23 */  addi       $sp, $sp, 0x4 /* handwritten instruction */
    /* 87CC 800E7FCC 0800E003 */  jr         $ra
    /* 87D0 800E7FD0 00000000 */   nop
  glabel func_800E7FD4
    /* 87D4 800E7FD4 0800E003 */  jr         $ra
    /* 87D8 800E7FD8 00000000 */   nop

glabel _start
    /* 87DC 800E7FDC 0F801C3C */  lui        $gp, %hi(D_800F4C20)
    /* 87E0 800E7FE0 204C9C27 */  addiu      $gp, $gp, %lo(D_800F4C20)
    /* 87E4 800E7FE4 94900308 */  j          func_800E4250
    /* 87E8 800E7FE8 00000000 */   nop
