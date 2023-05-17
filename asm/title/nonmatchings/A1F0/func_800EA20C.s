.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800EA20C
/* AA0C 800EA20C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* AA10 800EA210 2318A400 */  subu       $v1, $a1, $a0
/* AA14 800EA214 64006228 */  slti       $v0, $v1, 0x64
/* AA18 800EA218 1400BFAF */  sw         $ra, 0x14($sp)
/* AA1C 800EA21C 2B004014 */  bnez       $v0, .L800EA2CC
/* AA20 800EA220 1000B0AF */   sw        $s0, 0x10($sp)
/* AA24 800EA224 23100400 */  negu       $v0, $a0
/* AA28 800EA228 18004500 */  mult       $v0, $a1
/* AA2C 800EA22C 12200000 */  mflo       $a0
/* AA30 800EA230 1A008300 */  div        $zero, $a0, $v1
/* AA34 800EA234 02006014 */  bnez       $v1, .L800EA240
/* AA38 800EA238 00000000 */   nop
/* AA3C 800EA23C 0D000700 */  break      7
.L800EA240:
/* AA40 800EA240 FFFF0124 */  addiu      $at, $zero, -0x1
/* AA44 800EA244 04006114 */  bne        $v1, $at, .L800EA258
/* AA48 800EA248 0080013C */   lui       $at, (0x80000000 >> 16)
/* AA4C 800EA24C 02008114 */  bne        $a0, $at, .L800EA258
/* AA50 800EA250 00000000 */   nop
/* AA54 800EA254 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L800EA258:
/* AA58 800EA258 12200000 */  mflo       $a0
/* AA5C 800EA25C 00830500 */  sll        $s0, $a1, 12
/* AA60 800EA260 1A000302 */  div        $zero, $s0, $v1
/* AA64 800EA264 02006014 */  bnez       $v1, .L800EA270
/* AA68 800EA268 00000000 */   nop
/* AA6C 800EA26C 0D000700 */  break      7
.L800EA270:
/* AA70 800EA270 FFFF0124 */  addiu      $at, $zero, -0x1
/* AA74 800EA274 04006114 */  bne        $v1, $at, .L800EA288
/* AA78 800EA278 0080013C */   lui       $at, (0x80000000 >> 16)
/* AA7C 800EA27C 02000116 */  bne        $s0, $at, .L800EA288
/* AA80 800EA280 00000000 */   nop
/* AA84 800EA284 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L800EA288:
/* AA88 800EA288 12800000 */  mflo       $s0
/* AA8C 800EA28C 00220400 */  sll        $a0, $a0, 8
/* AA90 800EA290 1A008600 */  div        $zero, $a0, $a2
/* AA94 800EA294 0200C014 */  bnez       $a2, .L800EA2A0
/* AA98 800EA298 00000000 */   nop
/* AA9C 800EA29C 0D000700 */  break      7
.L800EA2A0:
/* AAA0 800EA2A0 FFFF0124 */  addiu      $at, $zero, -0x1
/* AAA4 800EA2A4 0400C114 */  bne        $a2, $at, .L800EA2B8
/* AAA8 800EA2A8 0080013C */   lui       $at, (0x80000000 >> 16)
/* AAAC 800EA2AC 02008114 */  bne        $a0, $at, .L800EA2B8
/* AAB0 800EA2B0 00000000 */   nop
/* AAB4 800EA2B4 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L800EA2B8:
/* AAB8 800EA2B8 12200000 */  mflo       $a0
/* AABC 800EA2BC 2DA6030C */  jal        func_800E98B4
/* AAC0 800EA2C0 00831000 */   sll       $s0, $s0, 12
/* AAC4 800EA2C4 30A6030C */  jal        func_800E98C0
/* AAC8 800EA2C8 21200002 */   addu      $a0, $s0, $zero
.L800EA2CC:
/* AACC 800EA2CC 1400BF8F */  lw         $ra, 0x14($sp)
/* AAD0 800EA2D0 1000B08F */  lw         $s0, 0x10($sp)
/* AAD4 800EA2D4 1800BD27 */  addiu      $sp, $sp, 0x18
/* AAD8 800EA2D8 0800E003 */  jr         $ra
/* AADC 800EA2DC 00000000 */   nop
