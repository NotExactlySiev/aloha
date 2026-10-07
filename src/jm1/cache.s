.include "macro.inc"

.set noat
.set noreorder

.section .text, "ax"

# It took me 3 years to figure out what this stupid thing does.

# The giant .lines block is the same size as the icache. For a given pointer p,
# we find the block whose icache line matches with p (line & 0xFF0 == p & 0xFF0)
# and we jump to it. Evicting that line from the icache, and forcing the
# instruction at p to be reloaded from RAM the next time it's executed.

# We use to mask 0xFF8 instead of 0xFF0. This let's us jump to the middle of a
# cache line, where we'll put another return instruction. This won't change the
# behavior of the function. Pretending we have 512 lines of 8 bytes instead of
# 256 lines of 4 bytes just lets us return more quickly, executing 1 fewer
# instruction on average.

# US: 800E771C
glabel evict_icache_line
    la      $v0, .lines
    subu    $v1, $a0, $v0
    andi    $v1, 0xFF8
    addu    $v0, $v1
    jr      $v0
    nop

.lines:
.rept    256
    jr         $ra
    nop
    jr         $ra
    nop
.endr
