.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800F443C
    mfc0    $s0, $12
    addiu   $s1, $zero, -2
    and     $s1, $s0

    # $t7 will be our scratchpad pointer.
    lui     $t7, %hi(0x1f800000)

    # Pointer to vertices.
    lw      $t9, 0x3a0($t7)

    # Read the number of sets.
    lw      $t5, 0($a0)

    # Offset to the face and vertex data.
    lw      $t8, 4($a0)
    addiu   $a0, 4
    andi    $t4, $t8, 0xffff    # Vertices
    addu    $t4, $t9            # Pointer to this set's first vertex
    addiu   $t2, $t7, 0x3a8     # We'll write the sorted face offsets here.
    addiu   $t1, $t7, 0x288     # We'll write the sorted distances here.

    # Save the number of sets in $t6, so we can use $t5 as our loop counter.
    move    $t6, $t5
.loop:
    # The first vertex is the anchor point of the set. The magnitude of its
    # projection (so, its distance to the camera) is what we need to calculate
    # and sort by.
    lwc2	$0, 0($t4)
    lwc2	$1, 4($t4)
    addiu   $a0, 4
    MVMVA   1, 0, 0, 0, 0
    mtc0    $s1, $12
    nop
    srl     $v1, $t8, 16        # Faces offset
    lw      $t8, 0($a0)
    cfc2    $zero, $31
    SQR     0
    andi    $t4, $t8, 0xffff
    addu    $t4, $t9            # Vertices for the next set
    addiu   $t2, 2
    addiu   $t1, 4
    mtc0    $s0, $12
    sh      $v1, -2($t2)        # Store the face offset in its array
    cfc2    $zero, $31

    mfc2    $v0, $25
    mfc2    $v1, $26
    mfc2    $t0, $27

    # We actually bias the magnitude value somewhat towards favorint the depth
    # more. The formula is (x^2 + y^2) / 4 + z^2
    addu    $v0, $v1
    sra     $v0, 2
    addu    $v0, $t0
    sw      $v0, -4($t1)        # Store the magnitude in its array

    bgtz    $t5, .loop
    addiu   $t5, -1

    # Now we do the sorting. Reset the pointers to the beginning of the arrays.
    addiu   $t8, $t7, 0x3a8     # Face offsets
    addiu   $t7, $t7, 0x288     # Magnitudes
    move    $t5, $t6            # Loop counter
.sortloop:
        # Pointers to set i
        move    $t2, $t7
        move    $t3, $t8

        # Pointers to set i+1
        addiu   $t7, 4
        addiu   $t8, 2
        lw      $t0, 0($t7)
        lhu     $t1, 0($t8)
        subu    $t4, $t6, $t5
    .insertloop:
            lw      $v0, 0($t2)
            lhu     $v1, 0($t3)

            # bltu pseudo-op?
            # bltu
            sltu    $at, $t0, $v0
            beq     $at, $zero, .noswap
            nop

            # Swap them around
            sw      $v0, 4($t2)
            sh      $v1, 2($t3)
            addiu   $t2, -4
            addiu   $t3, -2
        .noswap:
            bgtz    $t4, .insertloop
            addiu   $t4, -1

        sw      $t0, 4($t2)
        sh      $t1, 2($t3)
        addiu   $t5, -1
        bgtz    $t5, .sortloop
        nop

    jr      $ra
    nop
