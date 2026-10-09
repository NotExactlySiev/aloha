.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/*
int func_800F4354(SVECTOR *in, VECTOR *out, Mesh *m)
*/

glabel func_800F4354
    lw      $t1, 0($a2)         # t1 <- B|A
    lwc2    $0, 0($a0)          #
    andi    $v0, $t1, 0xFFFF    # V0 <- in
    beqz    $v0, .fail          #
    lwc2    $1, 4($a0)          # if (A == 0) return -1;
    nop                         #
    MVMVA   1,0,0,3,0           # transform
    sra     $t5, $t1, 16        # t5 <- B
    andi    $t1, 0xFFFF         # t1 <- A

    sll     $at, $t1, 3         #
    subu    $at, $t1            #
    sra     $at, 4              # at = (A*7)/16
    cfc2    $zero, $31          # void <- status
    cfc2    $v0, $31            # v0 <- status
    mfc2    $t4, $27            # t4 <- Z
    nop                         # check errors
    bltz    $v0, .fail          # if (status < 0)
    addu    $v0, $t4, $t1       #       return Z + bias (A)

                                # v1 = Z + bias (B)
    blez    $v0, .fail          # if (status == 0)
    addu    $v1, $t4, $t5       #       return Z + bias (A)

    bltz    $t5, .L800F43C0     # if (B >= 0) {
    addu    $v0, $at            #
    sll     $v1, 2              #
    srl     $v1, 7              #
    subu    $v1, $t5            #     ...
    bgtz    $v1, .fail          #     ...
    nop                         # }

# some checks

.L800F43C0:
    mfc2    $t2, $25            # t2 <- X
    mfc2    $t3, $26            # t3 <- Y
    bgtz    $t2, .L800F43D4     # v1 = v0
    subu    $v1, $v0, $t2       # if (Y > 0)
    addu    $v1, $v0, $t2       #       v1 -= X
.L800F43D4:
    blez    $v1, .fail          # if (v1 <= 0)
    nop                         #     return v0;
    mfc0    $t5, $12            #
    li      $at, -2             # maybe do addiu   $at, $zero, -2
    and     $at, $t5            #
    mtc0    $at, $12            # di
    bgtz    $t3, .L800F43F8     # v1 = v0
    subu    $v1, $v0, $t3       # if (Y > 0)
    addu    $v1, $v0, $t3       #       v1 -= Y
.L800F43F8:
    blez    $v1, .L800F4430     # if (v1 <= 0)
    nop                         #       return v0;

    SQR     0                   # calculate magnitude
    sw      $t2, 0($a1)         #
    sw      $t3, 4($a1)         #
    sw      $t4, 8($a1)         # out <- XYZ
    cfc2    $zero, $31          # void <- status
    mtc0    $t5, $12            # ei
    mfc2    $v0, $25            #
    mfc2    $t0, $26            #
    mfc2    $v1, $27            #
    addu    $v0, $t0            #
    jr      $ra                 # return magnitude
    addu    $v0, $v1            #

.L800F4430:
    mtc0    $t5, $12            # ei
.fail:
    jr      $ra
    li      $v0, -1
