.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

.section .text, "ax"

# US: 800E87B8
glabel func_800E87B8
    # Use a mask to double two u16's at once.
    lw      $t0, 0($a0)
    lw      $t1, 4($a0)
    lw      $t2, 8($a0)
    lw      $v0, 20($a0)
    la      $t3, 0xfffefffe
    sll     $t0, 1
    sll     $t1, 1
    sll     $t2, 1
    lw      $v1, 24($a0)
    and     $t0, $t3
    and     $t1, $t3
    and     $t2, $t3
    sll     $v0, 1
    sll     $v1, 1
    sw      $t0, 0($a0)
    sw      $t1, 4($a0)
    sw      $t2, 8($a0)
    sw      $v0, 20($a0)
    sw      $v1, 24($a0)
    jr      $ra
    nop

glabel func_800E8810
    ctc2    $zero, $5
    ctc2    $zero, $6
    ctc2    $zero, $7
    jr      $ra
    nop

glabel func_800E8824
    ctc2    $a0, $5
    ctc2    $a1, $6
    ctc2    $a2, $7
    jr      $ra
    nop

glabel func_800E8838
    lw      $t0, 0($a0)
    lw      $t1, 4($a0)
    lw      $t2, 8($a0)
    lw      $t3, 12($a0)
    lw      $t4, 16($a0)
    sw      $t0, 0($a1)
    sw      $t1, 4($a1)
    sw      $t2, 8($a1)
    sw      $t3, 12($a1)
    sw      $t4, 16($a1)
    jr      $ra
    nop

# US: 800E8868
glabel func_800E8868
    mfc0    $t1, $12
    addiu   $v0, $zero, -2
    and     $v0, $t1, $v0
    mtc0    $v0, $12
    mtc2    $a0, $9
    mtc2    $a1, $10
    mtc2    $a2, $11
    nop
    SQR     0
    cfc2    $zero, $31
    mfc2    $v0, $25
    mfc2    $v1, $26
    mfc2    $t0, $27
    mtc0    $t1, $12
    addu    $v0, $v1
    addu    $v0, $t0
    jr      $ra
    nop

glabel func_800E88B0
    ctc2    $a0, $13
    ctc2    $a1, $14
    ctc2    $a2, $15
    jr      $ra
    nop

glabel func_800E88C4
    ctc2    $a0, $27
    ctc2    $a1, $28
    jr      $ra
    nop

glabel func_800E88D4
    cfc2    $v0, $27
    nop
    jr      $ra
    nop

glabel func_800E88E4
    cfc2    $v0, $27
    nop
    jr      $ra
    nop

#
#

glabel func_800E8EBC
    blez    $a2, .out
    nop
.loop:
    lwc2    $0, 0x0($a0)
    lwc2    $1, 0x0($a1)
    addiu   $a0, 8
    MVMVA   1, 0, 0, 0, 0
    cfc2    $zero, $31
    mfc2    $t0, $25
    mfc2    $t1, $26
    mfc2    $t2, $27
    sh      $t0, 0($a1)
    sh      $t1, 2($a1)
    sh      $t2, 4($a1)
    addiu   $a1, 8
    addiu   $a2, -1
    bgtz    $a2, .loop
.out:
    jr      $ra
    nop

#
#

glabel func_800E9324
    la      $t0, sin_lut
    andi    $v0, $a0, 0xfff
    addiu   $v1, $a0, 0x400
    andi    $v1, 0xfff
    sll     $v0, 1
    sll     $v1, 1
    addu    $v0, $t0
    addu    $v1, $t0
    mfc0    $t0, $12
    lh      $v0, 0($v0)
    lh      $v1, 0($v1)

    # Disable interrupts.
    la      $t1, 0xfffffffe
    and     $t1, $t0, $t1
    mtc0    $t1, $12

    # Do the calculation.
    mtc2    $a1, $8
    mtc2    $v1, $9
    mtc2    $v0, $10
    nop
    nop
    GPF     0
    nop
    cfc2    $zero, $31
    mfc2    $v0, $25
    mfc2    $v1, $26

    # Re-enable interrupts.
    mtc0    $t0, $12

    # Write and return.
    sw      $v0, 0($a2)
    sw      $v1, 0($a3)
    jr      $ra
    nop
