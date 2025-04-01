.include "macro.inc"

.set noreorder

.section .text, "ax"

glabel func_800E83BC
        /*  A0         A1         A2         A3
         * [XXXXZZZZ] [WWWWLLLL] [----YYYY] [  Step  ]
         *  T0         T1         T2         T3         T4
         * [ssssXXXX] [ssssZZZZ] [ssssWWWW] [ssssLLLL] [YYYY----]
         * 
         * T0|T4 and T1 then go to VXY0/VZ0
         *
         */

        /* extract the packed arguments from a0, a1 */
        sra     $t0, $a0, 16
        sll     $t1, $a0, 16
        sra     $t1, $t1, 16
        sra     $t2, $a1, 16
        sll     $t3, $a1, 16
        sra     $t3, $t3, 16

        sll     $t4, $a2, 16

        /* extend the size by one tile */
        add     $t2, $t2, $a3
        add     $t3, $t3, $a3

        /* save for later */
        addu    $t9, $t0, $zero

        /* put it in V0 */
        andi    $t6, $t0, 0xFFFF
        or      $t6, $t6, $t4
        mtc2    $t6, $0
        mtc2    $t1, $1
        
        /* t5 and t8 are dst pointers */
        la      $t5, 0x1F800000
        la      $t8, 0x1F800154
.nexttile:
        RTPS
        /* step pointers and X */
        add     $t0, $t0, $a3
        addi    $t5, $t5, 2
        beq     $t2, $t0, .nextrow
        addi    $t8, $t8, 4

        /* update V0 */
        andi    $t6, $t0, 0xFFFF
.getresults:
        or      $t6, $t6, $t4
        cfc2    $zero, $31
        mtc2    $t6, $0

        /* store SXY and depth (for fog) */
        mfc2    $t7, $8
        swc2    $14, -0x4($t8)
        srl     $t7, $t7, 7
        sll     $t7, $t7, 6
        b       .nexttile
        sh      $t7, -0x2($t5)

.nextrow:
        /* step Z */
        add     $t1, $t1, $a3
        mtc2    $t1, $1
        beq     $t3, $t1, .done
        addu    $t0, $t9, $zero
        b       .getresults
        andi    $t6, $t0, 0xFFFF
.done:
        cfc2    $zero, $31
        mfc2    $t7, $8
        swc2    $14, -0x4($t8)
        srl     $t7, $t7, 7
        sll     $t7, $t7, 6
        sh      $t7, -0x2($t5)
        jr      $ra
        nop
