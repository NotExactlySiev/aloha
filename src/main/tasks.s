.include "macro.inc"
.set noreorder /* TODO: write this how it originally was with reordering */

.section .text, "ax"

glabel tasks_tick
    addi       $sp, $sp, -12

    lui        $t0, %hi(tasks_enabled)
    addiu      $t0, $t0, %lo(tasks_enabled)
    lw         $t1, 0x0($t0)

    /* add one to counter */
    lui        $v1, %hi(vsync_counter)
    addiu      $v1, $v1, %lo(vsync_counter)
    lw         $v0, 0x0($v1)
    sw         $ra, 0x8($sp) /* reordered */
    addiu      $v0, $v0, 0x1

    /* return if not enabled */
    bnez       $t1, .enabled
    sw         $v0, 0x0($v1) /* reordered */
    jr         $ra
    addi       $sp, $sp, 12 /* reordered */

.enabled:
    lui        $t0, %hi(D_80023370)
    addiu      $t0, $t0, %lo(D_80023370)  /* structure pointer */
    lw         $t1, 0x0($t0)
    ori        $t2, $zero, 0x27
.loop:
    beqz       $t1, .next       /* is this one active? */
    addi       $t0, $t0, 8
    lh         $v0, -0x4($t0)   /* target */
    lh         $v1, -0x2($t0)   /* counter */
    nop
    beq        $v0, $v1, .call  /* call if target hit, otherwise increment */
    addiu      $v1, $v1, 0x1
    b          .next
    sh         $v1, -0x2($t0)
.call:
    sh         $zero, -0x2($t0) /* reset counter */
    sw         $t2, 0x0($sp)
    jalr       $t1
    sw         $t0, 0x4($sp)
    lw         $t0, 0x4($sp)
    lw         $t2, 0x0($sp)
.next:
    lw         $t1, 0x0($t0)
    bnez       $t2, .loop
    addi       $t2, $t2, -1

    lw        $ra, 0x8($sp)
    nop       /* reordered */
    jr        $ra
    addi      $sp, $sp, 12


glabel D_80023370
    .fill 40, 8, 0

/*glabel D_80023470*/
/*    .fill 8, 8, 0*/

glabel vsync_counter
    .word 0

glabel tasks_enabled
    .word 0
