.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# transforms and writes the vertices to the start of scratchpad

# Returns:
#   v0: Collected faults (?)
#   v1: Min Z

glabel func_800F47B8
    # $t6 is our scratchpad pointer. Where we'll write the projected vertices.
    lui    $t6, 0x1F80

    # Get the base address of object's vertices.
    lw     $s1, 0x3A0($t6)

    mfc2   $t3, $2                 # put the offset vector in $t3,$t5
    mfc2   $t5, $3

    # Length of the subset header in bytes. (ranges)
    lw     $at, 0($a0)

    # Adjust the pointer for our loop. We'll be writing the vertices at the
    # beginning of scratchpad.
    addiu  $t6, -12


    # Screen position mask. Used for checking if SX > 255 or SY > 255.
    lui    $t7, 0xff00
    ori    $t7, 0xff00
    # li      $t7, 0xff00ff00   # Doesn't work.

    # Mask for adding two s16 vectors together in parallel.
    lui    $a3, 0xfffe
    ori    $a3, 0xffff
    # li      $a3, 0xfffeffff   # Doesn't work.

    # $a0 points at the header. $at points at the end of the header.
    addiu   $a0, 4
    addu    $at, $a0

    # Read first range.
    lw      $v0, 0($a0)             # read first range
    li      $s4, 0x7fff             # INT16_MAX? used to find a min value?

    # $s2 = range length
    # $v0 = range base (offset from the first vertex)
    srl     $s2, $v0, 0x10          # len
    andi    $v0, 0xffff             # base offset

    # Go to the first vertex of this range and load it.
    addu    $s0, $v0, $s1           # go to first vertex (base)
    lw      $t8, 0($s0)             # load vertex
    lw      $t9, 4($s0)

    lui     $t2, 0xffff

    # The offset vector was loaded into (t3, t5). We will now add it to this
    # vertex. The masks let us add the three s16 values with two add commands.
    and     $t3, $a3
    and     $t8, $a3
    addu    $t8, $t3
    and     $t8, $a3
    addu    $t9, $t5
.loop:
    # Project the vertex.
    mtc2    $t8, $0
    mtc2    $t9, $1
    addiu   $s0, 8
    RTPS

    # Are there more vertices in this range?
    bgtz    $s2, .samerange
    addiu   $s2, -1

    # No, go to the next range.
    addiu   $a0, 4

    # Was that the final range?
    beq     $a0, $at, .storevertex
    nop

    # Load up the pointers for this new range.
    lw      $v0, 0($a0)
    nop
    srl     $s2, $v0, 0x10      # Length
    andi    $v0, 0xFFFF         # Base offset
    addu    $s0, $v0, $s1       # Base
.samerange:

    # Get the next vertex.
    lw      $t8, 0($s0)
    lw      $t9, 4($s0)

    # if ($s3 < $s4) $s4 = $s3
    # Note: The first time this is ran, $s3 is uninitialized.
    subu    $v0, $s4, $s3
    blez    $v0, .L800F486C
    nop
    move    $s4, $s3
.L800F486C:

    # Add the offset vector to the next vertex.
    and     $t8, $a3
    addu    $t8, $t3
    and     $t8, $a3
    addu    $t9, $t5
.storevertex:
    # Get the result of the vertex we just calculated and store it.
    # Here's the 12 byte structure each transformed vertex is stored in:
    #   s16   x'
    #   s16   y'
    #   u16   depth
    #   s16   z'
    #   s16   sx
    #   s16   sy
    addiu   $t6, 12
    cfc2    $zero, $31
    swc2    $25, 0($t6)             # mac1 = X'
    mfc2    $v0, $26                # mac2 = Y'
    mfc2    $s3, $27                # mac3 = Z'
    mfc2    $t4, $8                 # depth cueing
    sh      $v0, 2($t6)
    sh      $s3, 6($t6)
    cfc2    $v1, $31
    mfc2    $t1, $14                # SXY2

    # Depth cue mask
    andi    $t4, 0x1fe0

    # Check for calculation error.
    bltz    $v1, .rtpserr
    and     $v0, $t1, $t7           # check high bytes of screen pos

    sw      $t1, 8($t6)

    # any high bytes set? (x or y > 255 or negative)
    bne     $v0, $zero, .outsidescr
    andi    $t2, 0xffff             # ???

    sh      $t4, 4($t6)

    # Was this the final vertex?
    bne     $at, $a0, .loop
    nop
    b       .done
    nop

.rtpserr:
    # Store the screen position.
    sw      $t1, 8($t6)

    # Division overflow?
    sll     $v0, $v1, 0xe
    bltz    $v0, .faultprocessed
    ori     $t0, $zero, 0x8000

    # Fine. We'll do the division ourselves.

    # Read MAC3 == SZ3.
    mfc2    $t0, $27

    # Calculate the factor as 0x40000 / SZ3.
    lui     $t1, 0x0004
    divu    $t1, $t0

    # Save SR.
    mfc0    $v1, $12
    li      $v0, -2
    and     $v0, $v1

    # Disable interrupts.
    mtc0    $v0, $12
    nop

    # Put the division result into IR0 and multiply the vertex by it using GPF.
    # [X, Y, Z] = (0x40000 / Z) * [X, Y, Z] >> 12
    # Keep in mind that the matrix multiplication has already taken place.
    mflo    $v0
    mtc2    $v0, $8
    nop
    nop
    GPF     1
    cfc2    $zero, $31


    mfc2    $t1, $25
    mfc2    $v0, $26

    # Add the screen offset, as RTPS would.
    addiu   $t1, $t1, 0x80
    addiu   $v0, $v0, 0x80

    # Enable interrupts.
    mtc0    $v1, $12

    # Store the calculated screen coordinates.
    sh      $t1, 8($t6)
    sh      $v0, 10($t6)
    b       .L800F4940
    nop

.outsidescr:     # screen x or y > 255
    # Put SX and SY into separate registers as the next section expects.
    sra     $v0, $t1, 16

.L800F4940:
    # At this point $t1 == SX and $v0 == SY.

    # X overflow?
    andi    $t1, 0xff00
    beqz    $t1, .notxclip
    andi    $v0, 0xff00
    srl     $t1, 15             # Sign bit
    addiu   $t1, 1
.notxclip:

    # Y overflow?
    beqz    $v0, .notyclip
    sll     $t0, $t1, 2
    srl     $v0, 15             # Sign bit
    addiu   $v0, 1
    addu    $t0, $v0
.notyclip:

    # Now $t0 is a bitfield XXYY where the pairs mean:
    #   00: Not outside screen
    #   01: Outisde screen to the positive side
    #   10: Outisde screen to the negative side
    #
    # Therefore we get one of nine possible numbers depending on where the
    # vertex has ended up:
    #  ________ ________ ________
    # |        |        |        |
    # |  1010  |  1000  |  1001  |
    # |________|________|________|
    # |        |        |        |
    # |  0010  |  0000  |  0001  |
    # |________|________|________|
    # |        |        |        |
    # |  0110  |  0100  |  0101  |
    # |________|________|________|
    #

.faultprocessed:
    # Store the errors that have occured (GTE or screen clipping) in the flags
    # field, alongside the depth value.
    or      $t4, $t0
    sh      $t4, 0x0004($t6)
    or      $t2, $t0
    sll     $t0, 0x10
    ori     $t0, 0xffff

    bne     $at, $a0, .loop
    and     $t2, $t0

.done:
    subu    $v0, $s4, $s3
    blez    $v0, .L800F4994
    nop
    move    $s4, $s3
.L800F4994:
    move    $v1, $s4
    jr      $ra
    move    $v0, $t2
