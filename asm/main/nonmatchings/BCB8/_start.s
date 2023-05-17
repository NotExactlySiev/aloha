.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel _start
/* BF44 80023744 0480023C */  lui        $v0, %hi(D_80047E6C)
/* BF48 80023748 6C7E4224 */  addiu      $v0, $v0, %lo(D_80047E6C)      #   v0 = 80047e6c
/* BF4C 8002374C 0580033C */  lui        $v1, %hi(D_80054924)
/* BF50 80023750 24496324 */  addiu      $v1, $v1, %lo(D_80054924)      #   v1 = 80054924
.L80023754:
/* BF54 80023754 000040AC */  sw         $zero, 0x0($v0)
/* BF58 80023758 04004224 */  addiu      $v0, $v0, 0x4
/* BF5C 8002375C 2B084300 */  sltu       $at, $v0, $v1
/* BF60 80023760 FCFF2014 */  bnez       $at, .L80023754
/* BF64 80023764 00000000 */   nop
/* BF68 80023768 04000224 */  addiu      $v0, $zero, 0x4
/* BF6C 8002376C 00000000 */  nop
/* BF70 80023770 00000000 */  nop
/* BF74 80023774 00000000 */  nop
/* BF78 80023778 00000000 */  nop
/* BF7C 8002377C 0280043C */  lui        $a0, %hi(D_800237F0)           
/* BF80 80023780 F0378424 */  addiu      $a0, $a0, %lo(D_800237F0)      #   a0 = 800237f0
/* BF84 80023784 21208200 */  addu       $a0, $a0, $v0                  #   a0 = 800237f4
/* BF88 80023788 0000828C */  lw         $v0, 0x0($a0)                  #   v0 = *800237f4 (0x00200000) // size of mem
/* BF8C 8002378C 0080083C */  lui        $t0, 0x8000                    #   t0 = 80000000
/* BF90 80023790 25E84800 */  or         $sp, $v0, $t0                  #   sp = 80200000       // top of stack
/* BF94 80023794 0580043C */  lui        $a0, %hi(D_80054924)           
/* BF98 80023798 24498424 */  addiu      $a0, $a0, %lo(D_80054924)      #   a0 = 80054924       // top of file
/* BF9C 8002379C C0200400 */  sll        $a0, $a0, 3                    #
/* BFA0 800237A0 C2200400 */  srl        $a0, $a0, 3                    #   a0 = 00054924       // remove ram hi address
/* BFA4 800237A4 0480033C */  lui        $v1, %hi(D_80047440)
/* BFA8 800237A8 4074638C */  lw         $v1, %lo(D_80047440)($v1)      #   v1 = *80047440 (0x00008000) // stack size
/* BFAC 800237AC 00000000 */  nop
/* BFB0 800237B0 23284300 */  subu       $a1, $v0, $v1                  #   a1 = v0 - v1 = 0x001F8000   // mem - stack
/* BFB4 800237B4 2328A400 */  subu       $a1, $a1, $a0                  #   a1 = 001F8000 - 00054924 = 001A36DC         // heap size = mem - stack - file
/* BFB8 800237B8 25208800 */  or         $a0, $a0, $t0                  #   a0 = 80054924       // put ram hi address back
/* BFBC 800237BC 0580013C */  lui        $at, %hi(D_80048044)
/* BFC0 800237C0 44803FAC */  sw         $ra, %lo(D_80048044)($at)      #   *80048044 = ra
/* BFC4 800237C4 04801C3C */  lui        $gp, (0x80040000 >> 16)
/* BFC8 800237C8 447D9C27 */  addiu      $gp, $gp, 0x7D44               #   gp = 80047D44
/* BFCC 800237CC 21F0A003 */  addu       $fp, $sp, $zero                #   fp = sp
/* BFD0 800237D0 EE8E000C */  jal        func_80023BB8
/* BFD4 800237D4 04008420 */  addi       $a0, $a0, 4                    #   a0 = 80054928
/* BFD8 800237D8 05801F3C */  lui        $ra, %hi(D_80048044)
/* BFDC 800237DC 4480FF8F */  lw         $ra, %lo(D_80048044)($ra)      #   ra = *80048044
/* BFE0 800237E0 00000000 */  nop
/* BFE4 800237E4 8167000C */  jal        main
/* BFE8 800237E8 00000000 */   nop
/* BFEC 800237EC 4D000000 */  break      0, 1
D_800237F0:
/* BFF0 800237F0 00002000 */  .word      0x00200000                    # sll        $zero, $zero, 0 # 00200000 <InstrIdType: CPU_SPECIAL>
/* BFF4 800237F4 00002000 */  .word      0x00200000                    # sll        $zero, $zero, 0 # 00200000 <InstrIdType: CPU_SPECIAL>
/* BFF8 800237F8 00002000 */  .word      0x00200000                    # sll        $zero, $zero, 0 # 00200000 <InstrIdType: CPU_SPECIAL>
/* BFFC 800237FC 00002000 */  .word      0x00200000                    # sll        $zero, $zero, 0 # 00200000 <InstrIdType: CPU_SPECIAL>


80200000    END OF RAM  (top of stack)
801F8004    ^ STACK
801F8000    V
800E0000    OTHER FILE
800DFFF8    V END OF HEAP
80054928    ^ HEAP              |
80054924    V END OF BSS        |
80048000    V END OF FILE       |
80018000    ^ FILE              |
80017FF8    V SHARED DATA
80010004    ^ 
80010000    V KERNEL MEMORY
80000000    RAM


