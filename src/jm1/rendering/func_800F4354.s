.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

/*
int func_800F4354(SVECTOR *in, VECTOR *out, Mesh *m)
*/

glabel func_800F4354
/* 44B54 800F4354 */ lw     $t1, 0($a2)         # t1 <- B|A
/* 44B58 800F4358 */ lwc2   $0, 0($a0)          #
/* 44B5C 800F435C */ andi   $v0, $t1, 0xFFFF    # V0 <- in
/* 44B60 800F4360 */ beqz   $v0, .fail          #
/* 44B64 800F4364 */ lwc2   $1, 4($a0)          # if (A == 0) return -1;
/* 44B68 800F4368 */ nop                        #
/* 44B6C 800F436C */ MVMVA  1,0,0,3,0           # transform
/* 44B70 800F4370 */ sra    $t5, $t1, 16        # t5 <- B
/* 44B74 800F4374 */ andi   $t1, 0xFFFF         # t1 <- A

/* 44B78 800F4378 */ sll    $at, $t1, 3         #
/* 44B7C 800F437C */ subu   $at, $t1            #
/* 44B80 800F4380 */ sra    $at, 4              # at = (A*7)/16
/* 44B84 800F4384 */ cfc2   $zero, $31          # void <- status
/* 44B88 800F4388 */ cfc2   $v0, $31            # v0 <- status
/* 44B8C 800F438C */ mfc2   $t4, $27            # t4 <- Z
/* 44B90 800F4390 */ nop                        # check errors
/* 44B94 800F4394 */ bltz   $v0, .fail          # if (status < 0)
/* 44B98 800F4398 */ addu   $v0, $t4, $t1       #       return Z + bias (A)

                                                # v1 = Z + bias (B)
/* 44B9C 800F439C */ blez   $v0, .fail          # if (status == 0)
/* 44BA0 800F43A0 */ addu   $v1, $t4, $t5       #       return Z + bias (A)

/* 44BA4 800F43A4 */ bltz   $t5, .L800F43C0     # if (B >= 0) {
/* 44BA8 800F43A8 */ addu   $v0, $at            #
/* 44BAC 800F43AC */ sll    $v1, 2              #
/* 44BB0 800F43B0 */ srl    $v1, 7              #
/* 44BB4 800F43B4 */ subu   $v1, $t5            #     ...
/* 44BB8 800F43B8 */ bgtz   $v1, .fail          #     ...
/* 44BBC 800F43BC */ nop                        # }

# some checks

.L800F43C0:
/* 44BC0 800F43C0 */ mfc2   $t2, $25            # t2 <- X
/* 44BC4 800F43C4 */ mfc2   $t3, $26            # t3 <- Y
/* 44BC8 800F43C8 */ bgtz   $t2, .L800F43D4     # v1 = v0
/* 44BCC 800F43CC */ subu   $v1, $v0, $t2       # if (Y > 0)
/* 44BD0 800F43D0 */ addu   $v1, $v0, $t2       #       v1 -= X
.L800F43D4:
/* 44BD4 800F43D4 */ blez   $v1, .fail          # if (v1 <= 0)
/* 44BD8 800F43D8 */ nop                        #     return v0;
/* 44BDC 800F43DC */ mfc0   $t5, $12            #
/* 44BE0 800F43E0 */ li     $at, -2             #
/* 44BE4 800F43E4 */ and    $at, $t5            #
/* 44BE8 800F43E8 */ mtc0   $at, $12            # di
/* 44BEC 800F43EC */ bgtz   $t3, .L800F43F8     # v1 = v0
/* 44BF0 800F43F0 */ subu   $v1, $v0, $t3       # if (Y > 0)
/* 44BF4 800F43F4 */ addu   $v1, $v0, $t3       #       v1 -= Y
.L800F43F8:
/* 44BF8 800F43F8 */ blez   $v1, .L800F4430     # if (v1 <= 0)
/* 44BFC 800F43FC */ nop                        #       return v0;


/* 44C00 800F4400 */ SQR 0                      # calculate magnitude
/* 44C04 800F4404 */ sw     $t2, 0($a1)         #
/* 44C08 800F4408 */ sw     $t3, 4($a1)         #
/* 44C0C 800F440C */ sw     $t4, 8($a1)         # out <- XYZ
/* 44C10 800F4410 */ cfc2   $zero, $31          # void <- status
/* 44C14 800F4414 */ mtc0   $t5, $12            # ei
/* 44C18 800F4418 */ mfc2   $v0, $25            #
/* 44C1C 800F441C */ mfc2   $t0, $26            #
/* 44C20 800F4420 */ mfc2   $v1, $27            #
/* 44C24 800F4424 */ addu   $v0, $t0            #
/* 44C28 800F4428 */ jr     $ra                 # return magnitude
/* 44C2C 800F442C */ addu   $v0, $v1            #

.L800F4430:
/* 44C30 800F4430 */ mtc0   $t5, $12            # ei
.fail:
/* 44C34 800F4434 */ jr     $ra                 # .word 0x03E00008
/* 44C38 800F4438 */ li     $v0, -1             # .word 0x2402FFFF
