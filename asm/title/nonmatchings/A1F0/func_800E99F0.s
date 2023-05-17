.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E99F0
/* A1F0 800E99F0 00600240 */  mfc0       $v0, $12 # handwritten instruction
/* A1F4 800E99F4 0040033C */  lui        $v1, (0x40000000 >> 16)
/* A1F8 800E99F8 25104300 */  or         $v0, $v0, $v1
/* A1FC 800E99FC 00608240 */  mtc0       $v0, $12 # handwritten instruction
/* A200 800E9A00 00000000 */  nop
/* A204 800E9A04 55010824 */  addiu      $t0, $zero, 0x155
/* A208 800E9A08 00E8C848 */  ctc2       $t0, $29 # handwritten instruction
/* A20C 800E9A0C 00000000 */  nop
/* A210 800E9A10 00010824 */  addiu      $t0, $zero, 0x100
/* A214 800E9A14 00F0C848 */  ctc2       $t0, $30 # handwritten instruction
/* A218 800E9A18 00000000 */  nop
/* A21C 800E9A1C E8030824 */  addiu      $t0, $zero, 0x3E8
/* A220 800E9A20 00D0C848 */  ctc2       $t0, $26 # handwritten instruction
/* A224 800E9A24 00000000 */  nop
/* A228 800E9A28 9EEF0824 */  addiu      $t0, $zero, -0x1062
/* A22C 800E9A2C 00D8C848 */  ctc2       $t0, $27 # handwritten instruction
/* A230 800E9A30 00000000 */  nop
/* A234 800E9A34 4001083C */  lui        $t0, (0x1400000 >> 16)
/* A238 800E9A38 00E0C848 */  ctc2       $t0, $28 # handwritten instruction
/* A23C 800E9A3C 00000000 */  nop
/* A240 800E9A40 00C0C048 */  ctc2       $zero, $24 # handwritten instruction
/* A244 800E9A44 00C8C048 */  ctc2       $zero, $25 # handwritten instruction
/* A248 800E9A48 00000000 */  nop
/* A24C 800E9A4C 0800E003 */  jr         $ra
/* A250 800E9A50 00000000 */   nop
