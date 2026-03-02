.include "macro.inc"

/* Common start file for all the executables launched by main. */

.set noat
.set noreorder

.section .text, "ax"

/* jumptable pointer lol */
glabel jt_ptr
    .word      0x80010000

/* Invalid syscall, calls DeliverEvent(F0000010h,4000h) */
glabel announce_entering_main
    addi       $sp, $sp, -0x4 /* handwritten instruction */
    sw         $ra, 0x0($sp)
    lui        $a0, (0x80000000 >> 16)
    syscall    0
    beqz       $v0, .no_action
    nop
    jalr       $v0
    nop
.no_action:
    lw         $ra, 0x0($sp)
    addi       $sp, $sp, 0x4 /* handwritten instruction */
    jr         $ra
    nop

glabel __main
    jr         $ra
    nop

glabel _start
    la         $gp, __gp_area
    j          main
    nop
