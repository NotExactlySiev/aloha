  .macro glabel label
      .global \label
      \label:
  .endm

  .macro .def #
  .endm

  .macro li reg, num
  .if \num < 0x8000 && \num > 0
    ori \reg, $0, \num & 0xFFFF
  .elseif \num > 0xFFFF
    lui \reg, %hi(\num)
  .elseif \num > 0
    ori \reg, $0, \num & 0xFFFF
  .elseif \num == -0x8000
    addiu \reg, $0, \num & 0xFFFF
  .elseif \num > -0x8000
    addiu \reg, $0, \num
  .else
    lui \reg, %hi(\num)
  .endif
  .endm

  .macro move a, b
      addu \a, \b, $zero
  .endm

  .macro kern table, code, label
    glabel \label
    addiu      $t2, $zero, \table
    jr         $t2
    addiu      $t1, $zero, \code
    nop
  .endm


  .macro sysc code, label
    glabel \label
    addiu      $a0, $zero, \code
    syscall    0
    jr         $ra
    nop
  .endm

/* I don't know what this is, I can't figure out what it is. but it's always
 * this exact value in the files I've disassembled so far. it's just a trap.
 */
  .macro tge a, b, c
    .word       0x00001770
  .endm

  .macro MVMVA sf,mx,v,cv,lm
    cop2        0x0400012|(\sf<<19)|(\mx<<17)|(\v<<15)|(\cv<<13)|(\lm<<10)
  .endm

  .macro GPF sf
    cop2        0x0190003D | \sf<<19
  .endm

  .macro GPL sf
    cop2        0x01A0003E | \sf<<19
  .endm

  .macro INTPL
    cop2        0x0980011
  .endm

  .macro RTPS
    cop2        0x0180001
  .endm
