.include "macro.inc"

.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Unused
glabel func_800F42A4
    lui     $v0, (0x1F8003FE >> 16)
    sh      $zero, (0x1F8003FC & 0xFFFF)($v0)
    sh      $zero, (0x1F8003FE & 0xFFFF)($v0)
    jr      $ra
    nop
    nop
    nop
    nop
    nop

# Unused
glabel func_800F42C8
    sll     $a0, $a0, 1
    lui     $v0, (0x1F8003FC >> 16)
    addu    $v0, $v0, $a0
    lh      $v0, (0x1F8003FC & 0xFFFF)($v0)
    jr      $ra
    nop

# Set the limit pointer
glabel func_800F42E0
    lui     $at, %hi(D_800F42F0)
    sw      $a0, %lo(D_800F42F0)($at)
    jr      $ra
    nop

# Prim buffer polygon limit. A point near the end of the primitive buffer that
# models stop when passed.

/* US:800F42F0 */
glabel D_800F42F0
    .word    0x00000000
