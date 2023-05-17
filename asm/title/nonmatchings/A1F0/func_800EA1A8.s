.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800EA1A8
/* A9A8 800EA1A8 80100400 */  sll        $v0, $a0, 2
/* A9AC 800EA1AC 21104400 */  addu       $v0, $v0, $a0
/* A9B0 800EA1B0 80110200 */  sll        $v0, $v0, 6
/* A9B4 800EA1B4 23100200 */  negu       $v0, $v0
/* A9B8 800EA1B8 1A004500 */  div        $zero, $v0, $a1
/* A9BC 800EA1BC 0200A014 */  bnez       $a1, .L800EA1C8
/* A9C0 800EA1C0 00000000 */   nop
/* A9C4 800EA1C4 0D000700 */  break      7
.L800EA1C8:
/* A9C8 800EA1C8 FFFF0124 */  addiu      $at, $zero, -0x1
/* A9CC 800EA1CC 0400A114 */  bne        $a1, $at, .L800EA1E0
/* A9D0 800EA1D0 0080013C */   lui       $at, (0x80000000 >> 16)
/* A9D4 800EA1D4 02004114 */  bne        $v0, $at, .L800EA1E0
/* A9D8 800EA1D8 00000000 */   nop
/* A9DC 800EA1DC 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L800EA1E0:
/* A9E0 800EA1E0 12200000 */  mflo       $a0
/* A9E4 800EA1E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A9E8 800EA1E8 1000BFAF */  sw         $ra, 0x10($sp)
/* A9EC 800EA1EC 2DA6030C */  jal        func_800E98B4
/* A9F0 800EA1F0 00000000 */   nop
/* A9F4 800EA1F4 30A6030C */  jal        func_800E98C0
/* A9F8 800EA1F8 4001043C */   lui       $a0, (0x1400000 >> 16)
/* A9FC 800EA1FC 1000BF8F */  lw         $ra, 0x10($sp)
/* AA00 800EA200 1800BD27 */  addiu      $sp, $sp, 0x18
/* AA04 800EA204 0800E003 */  jr         $ra
/* AA08 800EA208 00000000 */   nop
