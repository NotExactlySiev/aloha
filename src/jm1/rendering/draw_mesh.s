.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# void *draw_mesh(u32 mesh_with_flags, void *prim, u32 ot_with_flags, u32 *arg3)

# US: 800F4548
glabel draw_mesh
    # Remove the flag and remove them to get the mesh pointer.
    andi        $v1, $a0, 0x1
    subu        $a0, $a0, $v1

    lw          $v0, 0x0($a0)

    # Shift the flag to bit 13 so we can use it later.
    sll         $v1, $v1, 13

    # if (mesh->a == 0 && mesh-b == 0) return
    beqz        $v0, .return
    nop

    # Also read the flags in the ot pointer and remove them.
    andi        $v0, $a2, 0x3
    subu        $a2, $a2, $v0

    # Allocate a stack frame and save registers.
    addiu       $sp, $sp, -0x2C
    sw          $ra, 0x0($sp)
    sw          $a2, 0x4($sp)
    sw          $s0, 0x8($sp)
    sw          $s1, 0xC($sp)
    sw          $s2, 0x10($sp)
    sw          $s3, 0x14($sp)
    sw          $s4, 0x18($sp)
    sw          $s5, 0x1C($sp)
    sw          $s6, 0x20($sp)
    sw          $s7, 0x24($sp)
    sw          $fp, 0x28($sp)

    # Use the OT flags to choose an ldt5 function.
    lui         $fp, %hi(D_800F686C)
    addiu       $fp, $fp, %lo(D_800F686C)
    beqz        $v0, .ldt5picked
    andi        $v0, $v0, 0x1
    lui         $fp, %hi(D_800F6878)
    addiu       $fp, $fp, %lo(D_800F6878)
    beqz        $v0, .ldt5picked
    nop
    lui         $fp, %hi(D_800F68A4)
    addiu       $fp, $fp, %lo(D_800F68A4)
.ldt5picked:
    lui         $s6, (0x1F800000 >> 16)
    sh          $v1, 0x372($s6)

    # Get the pointers for each of the mesh's three data sections.
    lw          $t0, 0x4($a0) # verts
    lw          $t1, 0x8($a0) # unks
    lw          $a0, 0xC($a0) # sets

    # For verts and unks, skip over the counts and store the pointer in the
    # scratchpad as is.
    addiu       $t0, $t0, 0x4
    addiu       $t1, $t1, 0x4
    sw          $t0, 0x3A0($s6)
    sw          $t1, 0x3A4($s6)

    # But sets need to be processed first. Save the original pointer in a GTE
    # register (!) and call the function to sort them, if there are more than
    # one.
    lw          $s7, 0x0($a0)       # count of sets - 1
    mtc2        $a0, $4
    blez        $s7, .oneset
    nop
    jal         func_800F443C
    nop
.oneset:

    # Save the foreground color by storing them in some of the GTE registers we
    # won't be using. It's free real estate.
    cfc2        $t0, $21
    cfc2        $t1, $22
    cfc2        $t2, $23
    mtc2        $t0, $5
    ctc2        $t1, $29
    ctc2        $t2, $30

    # ???
    lwl         $a2, 0x2($a2)

    # Set V1 from arg3 if it's given. Otherwise zero it out.
    addu        $v0, $zero, $zero
    beqz        $a3, .noarg3
    addu        $v1, $zero, $zero

        # If we picked this specific ldt5 function (load 0x80000004) then we
        # need to clear the translation vector.
        lui         $t0, %hi(D_800F68A4)
        addiu       $t0, $t0, %lo(D_800F68A4)
        beq         $t0, $fp, .leavetr
        nop
        ctc2        $zero, $5
        ctc2        $zero, $6
        ctc2        $zero, $7
    .leavetr:

        lw         $v0, 0x0($a3)
        lw         $v1, 0x4($a3)

.noarg3:
    mtc2        $v0, $2
    mtc2        $v1, $3

    # $s7 has the number of sets. Shift it to the upper half.
    sll         $s7, $s7, 16

    # If $s7 is zero, this means we only have a single set. This means the sort
    # function wasn't called and therefore $a0 still containt the original
    # pointer to the sets. So we don't have to restore it and we can skip
    # directly to the inner loop.

    # Otherwise we have to restore it from the
    beqz        $s7, .oneset2
    addiu       $a0, 0x8

    # And grab a pointer to the array that the sorting function made for us.
    # It contains the precalculated size of every set in the same order as they
    # were sorted.
    addiu       $s6, $s6, %lo(D_1F8003A8)

.sets_loop:
    # Restore the pointer to the sets.
    mfc2       $a0, $4

    # Get the size of the last set from our scratchpad array and skip by that
    # amount to get to the next set.
    lhu        $v0, 0x0($s6)
    addiu      $s6, $s6, 0x2
    addu       $a0, $a0, $v0

.oneset2:
    # Read the number of subsets.
    lhu        $v0, 0x0($a0)
    addiu      $a0, $a0, 0x4

    # $s7 has both our loops' counters. (nsets << 16) | (nsubsets)
    or         $s7, $s7, $v0

.subsets_loop:
    # Check if we've reached the prim buffer canary. Stop rendering and exit
    # the loop if so.
    lui         $v0, %hi(D_800F42F0)
    lw          $v0, %lo(D_800F42F0)($v0)
    nop
    subu        $v0, $v0, $a1
    blez        $v0, .done
    nop

    # Transform this subset's vertices.
    jal         func_800F47B8
    nop

    # Two values are returned in $v0.
    andi        $a3, $v0, 0xFFFF
    srl         $v0, $v0, 16
    beqz        $v0, .draw_subset
    nop

    # Subset is entirely clipped, skip it?
    lw          $v0, 0x0($a0)
    addiu       $a0, $a0, 0x4
    b           .subset_done
    addu        $a0, $a0, $v0

.draw_subset:
    # Save the rotation matrix.
    lui         $v0, (0x1F800000 >> 16)
    cfc2        $t0, $0
    cfc2        $t1, $1
    cfc2        $t2, $2
    cfc2        $t3, $3
    sw          $t0, (0x1F800380 & 0xFFFF)($v0)
    sw          $t1, (0x1F800384 & 0xFFFF)($v0)
    sw          $t2, (0x1F800388 & 0xFFFF)($v0)
    sw          $t3, (0x1F80038C & 0xFFFF)($v0)
    cfc2        $t0, $4
    cfc2        $t1, $5
    cfc2        $t2, $6
    cfc2        $t3, $7
    sw          $t0, (0x1F800390 & 0xFFFF)($v0)
    sw          $t1, (0x1F800394 & 0xFFFF)($v0)
    sw          $t2, (0x1F800398 & 0xFFFF)($v0)
    sw          $t3, (0x1F80039C & 0xFFFF)($v0)

    # Render the subset.
    jal         func_800F49A0
    nop

    # Restore the rotation matrix.
    lui         $v0, (0x1F800000 >> 16)
    lw          $t0, (0x1F800380 & 0xFFFF)($v0)
    lw          $t1, (0x1F800384 & 0xFFFF)($v0)
    lw          $t2, (0x1F800388 & 0xFFFF)($v0)
    lw          $t3, (0x1F80038C & 0xFFFF)($v0)
    ctc2        $t0, $0
    ctc2        $t1, $1
    ctc2        $t2, $2
    ctc2        $t3, $3
    lw          $t0, (0x1F800390 & 0xFFFF)($v0)
    lw          $t1, (0x1F800394 & 0xFFFF)($v0)
    lw          $t2, (0x1F800398 & 0xFFFF)($v0)
    lw          $t3, (0x1F80039C & 0xFFFF)($v0)
    ctc2        $t0, $4
    ctc2        $t1, $5
    ctc2        $t2, $6
    ctc2        $t3, $7
.subset_done:
    sll         $v0, $s7, 16
    bgtz        $v0, .subsets_loop
    addiu       $s7, $s7, -0x1

    bgtz        $s7, .sets_loop
    xori        $s7, $s7, 0xFFFF

.done:
    # We're done. Restore the foreground registers.
    mfc2       $t0, $5
    cfc2       $t1, $29
    cfc2       $t2, $30
    ctc2       $t0, $21
    ctc2       $t1, $22
    ctc2       $t2, $23

    # Restore everything from the stack.
    lw         $ra, 0x0($sp)
    lw         $v0, 0x4($sp)
    lw         $s0, 0x8($sp)
    lw         $s1, 0xC($sp)
    lw         $s2, 0x10($sp)
    lw         $s3, 0x14($sp)
    lw         $s4, 0x18($sp)
    lw         $s5, 0x1C($sp)
    lw         $s6, 0x20($sp)
    lw         $s7, 0x24($sp)
    lw         $fp, 0x28($sp)
    addiu      $sp, $sp, 0x2C
    swl        $a2, 0x2($v0)

.return:
    addu       $v0, $a1, $zero
    jr         $ra
    nop
