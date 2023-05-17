.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800EA14C
/* A94C 800EA14C 23200400 */  negu       $a0, $a0
/* A950 800EA150 80210400 */  sll        $a0, $a0, 6
/* A954 800EA154 1A008500 */  div        $zero, $a0, $a1
/* A958 800EA158 0200A014 */  bnez       $a1, .L800EA164
/* A95C 800EA15C 00000000 */   nop
/* A960 800EA160 0D000700 */  break      7
.L800EA164:
/* A964 800EA164 FFFF0124 */  addiu      $at, $zero, -0x1
/* A968 800EA168 0400A114 */  bne        $a1, $at, .L800EA17C
/* A96C 800EA16C 0080013C */   lui       $at, (0x80000000 >> 16)
/* A970 800EA170 02008114 */  bne        $a0, $at, .L800EA17C
/* A974 800EA174 00000000 */   nop
/* A978 800EA178 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L800EA17C:
/* A97C 800EA17C 12200000 */  mflo       $a0
/* A980 800EA180 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A984 800EA184 1000BFAF */  sw         $ra, 0x10($sp)
/* A988 800EA188 2DA6030C */  jal        func_800E98B4
/* A98C 800EA18C 00000000 */   nop
/* A990 800EA190 30A6030C */  jal        func_800E98C0
/* A994 800EA194 4001043C */   lui       $a0, (0x1400000 >> 16)
/* A998 800EA198 1000BF8F */  lw         $ra, 0x10($sp)
/* A99C 800EA19C 1800BD27 */  addiu      $sp, $sp, 0x18
/* A9A0 800EA1A0 0800E003 */  jr         $ra
/* A9A4 800EA1A4 00000000 */   nop
