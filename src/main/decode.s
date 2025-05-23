.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"

glabel decode_rle
        addu       $t0, $a0, $zero
        addu       $t1, $a1, $zero
        addu       $t2, $a2, $zero
        ori        $t3, $zero, 0x0
        addiu      $t0, $t0, -0x1
.L800234CC:
        bnez       $t3, .L800234E0
        nop
        lb         $t4, 0x0($t1)
        addiu      $t1, $t1, 0x1
        ori        $t3, $zero, 0x8
.L800234E0:
        lb         $t8, 0x0($t1)
        addiu      $t1, $t1, 0x1
        andi       $t5, $t4, 0x80
        bnez       $t5, .L800234FC
        sll       $t4, $t4, 1
        b          .L80023514
        ori       $t7, $zero, 0x1
.L800234FC:
        lb         $t7, 0x0($t1)
        addiu      $t1, $t1, 0x1
        andi       $t7, $t7, 0xFF
        bnez       $t7, .L80023514
        nop
        ori        $t7, $zero, 0x100
.L80023514:
        sb         $t8, 0x0($t2)
        addiu      $t2, $t2, 0x1
        beqz       $t0, .L80023534
        addi      $t7, $t7, -0x1 # handwritten instruction
        bnez       $t7, .L80023514
        addiu     $t0, $t0, -0x1
        b          .L800234CC
        addiu     $t3, $t3, -0x1
.L80023534:
        jr         $ra
        nop

.macro getbit
        bgtz       $t1, .+20
        nop
        ori        $t1, $zero, 0x8
        lb         $t0, 0x0($t4)
        addiu      $t4, $t4, 0x1

        addiu      $t1, $t1, -0x1
        srlv       $v0, $t0, $t1
        andi       $v0, $v0, 0x1
.endm

# Handwritten function
glabel decode_lz1
        nop
        addu       $t6, $ra, $zero
        addu       $t4, $a0, $zero      # src
        addu       $t5, $a1, $zero      # dst
        lb         $t0, 0x0($t4)        # byte
        addiu      $t4, $t4, 0x1
        ori        $t1, $zero, 0x7      # bitn
.L80023558:                             # do {
        lb         $at, 0x0($t4)        #   copy byte;
        addiu      $t4, $t4, 0x1        #
        sb         $at, 0x0($t5)        #
        addiu      $t5, $t5, 0x1        #
.L80023568:
        getbit                          # 
        beqz       $v0, .L80023558      # } while (NEXT == 0);
        nop                             #
        getbit                          # t2 = -0x100
        bnez       $v0, .L800235D0      # if (NEXT == 0) {
        addiu     $t2, $zero, -0x100    #
        lbu        $at, 0x0($t4)        #   t2 = 0xFFFFFF00 | read();
        addiu      $t4, $t4, 0x1        #   
        bnez       $at, .L80023680      #   if t2 == -256 return;
        or        $t2, $t2, $at         #   
        b          .L80023724           #
        nop                             # } else {
.L800235D0:                             # 
        lbu        $at, 0x0($t4)        #   t2 = 0xFFFFFF00 | read();
        addiu      $t4, $t4, 0x1        #   
        or         $t2, $t2, $at        #
        getbit                          #   t2 = NEXT | t2 << 1;
        sll        $t2, $t2, 1          #
        or         $t2, $t2, $v0        #
        getbit                          #   t2 = NEXT | t2 << 1;
        sll        $t2, $t2, 1          #
        or         $t2, $t2, $v0        #
        getbit                          #   t2 = NEXT | t2 << 1;
        sll        $t2, $t2, 1          #
        or         $t2, $t2, $v0        #
        getbit                          #   t2 = NEXT | t2 << 1;
        sll        $t2, $t2, 1          #
        or         $t2, $t2, $v0        #
        addiu      $t2, $t2, -0xFF      #   t2 -= 255;
.L80023680:                             # }
        addu       $at, $t5, $zero      #
        add        $t3, $at, $t2        # from = dst + t2;
        getbit                          # 
        beqz       $v0, .L80023700      # l = 1;
        ori       $t2, $zero, 0x1       # while NEXT == 1 {
.L800236B0:                             #
        getbit                          #
        sll        $t2, $t2, 1          #   
        or         $t2, $t2, $v0        #   l = NEXT | (l << 1);
        getbit                          #
        bnez       $v0, .L800236B0      #
        nop                             #
.L80023700:                             # }
        lb         $at, 0x0($t3)        # 
        addiu      $t5, $t5, 0x1        # do {
        addiu      $t2, $t2, -0x1       #   l--;
        sb         $at, -0x1($t5)       #   *dst++ = *from++;
        addiu      $t3, $t3, 0x1        #
        bgez       $t2, .L80023700      # } while (l >= 0);
        nop
        b          .L80023568
        nop
.L80023724:
        sub        $v0, $t5, $a1
        jr         $t6
        nop
        nop
        nop
        nop
