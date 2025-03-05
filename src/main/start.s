.include "macro.inc"

.set noreorder

.section .text, "ax"

glabel __main
        jr         $ra
        nop

glabel _start
        /* clear the bss segment */
        la      $v0, __bss_start
        la      $v1, __bss_end
.clear_bss:
        sw      $zero, 0x0($v0)
        addiu   $v0, $v0, 0x4
        bltu    $v0, $v1, .clear_bss
        nop

        /* read RAM size and set the stack pointer */
        addiu   $v0, $zero, 0x4
        nop
        nop
        nop
        nop
        la      $a0, ram_size
        addu    $a0, $v0
        lw      $v0, 0x0($a0)
        li      $t0, 0x80000000
        or      $sp, $v0, $t0

        /* calculate available heap space and initialize */
        la      $a0, __bss_end
        sll     $a0, $a0, 3
        srl     $a0, $a0, 3
        lw      $v1, stack_size
        nop
        subu    $a1, $v0, $v1
        subu    $a1, $a1, $a0
        or      $a0, $t0

        /* save ra before call (no proper environment and stack yet) */
        sw      $ra, saved_ra

        /* the stupid pointers */
        li      $gp, 0x80047D44      /* where did this come from? */
        move    $fp, $sp

        jal     InitHeap
        addi    $a0, $a0, 4

        /* restore ra */
        lw      $ra, saved_ra
        nop

        /* and we're done */
        jal     main
        nop
        break   0, 1

ram_size:
        .word   0x00200000
        .word   0x00200000
        .word   0x00200000
        .word   0x00200000
