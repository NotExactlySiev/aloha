.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002522C
/* DA2C 8002522C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* DA30 80025230 1C00B3AF */  sw         $s3, 0x1C($sp)
/* DA34 80025234 21988000 */  addu       $s3, $a0, $zero
/* DA38 80025238 0280043C */  lui        $a0, %hi(D_80018318)
/* DA3C 8002523C 18838424 */  addiu      $a0, $a0, %lo(D_80018318)
/* DA40 80025240 1800B2AF */  sw         $s2, 0x18($sp)
/* DA44 80025244 2190A000 */  addu       $s2, $a1, $zero
/* DA48 80025248 21286002 */  addu       $a1, $s3, $zero
/* DA4C 8002524C 1400B1AF */  sw         $s1, 0x14($sp)
/* DA50 80025250 2188C000 */  addu       $s1, $a2, $zero
/* DA54 80025254 1000B0AF */  sw         $s0, 0x10($sp)
/* DA58 80025258 2000BFAF */  sw         $ra, 0x20($sp)
/* DA5C 8002525C 4594000C */  jal        func_80025114
/* DA60 80025260 2180E000 */   addu      $s0, $a3, $zero
/* DA64 80025264 21286002 */  addu       $a1, $s3, $zero
/* DA68 80025268 FF001032 */  andi       $s0, $s0, 0xFF
/* DA6C 8002526C 00841000 */  sll        $s0, $s0, 16
/* DA70 80025270 FF003132 */  andi       $s1, $s1, 0xFF
/* DA74 80025274 008A1100 */  sll        $s1, $s1, 8
/* DA78 80025278 25801102 */  or         $s0, $s0, $s1
/* DA7C 8002527C FF005232 */  andi       $s2, $s2, 0xFF
/* DA80 80025280 0480023C */  lui        $v0, %hi(D_80046ED8)
/* DA84 80025284 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* DA88 80025288 08000634 */  ori        $a2, $zero, 0x8
/* DA8C 8002528C 0C00448C */  lw         $a0, 0xC($v0)
/* DA90 80025290 0800428C */  lw         $v0, 0x8($v0)
/* DA94 80025294 00000000 */  nop
/* DA98 80025298 09F84000 */  jalr       $v0
/* DA9C 8002529C 25381202 */   or        $a3, $s0, $s2
/* DAA0 800252A0 2000BF8F */  lw         $ra, 0x20($sp)
/* DAA4 800252A4 1C00B38F */  lw         $s3, 0x1C($sp)
/* DAA8 800252A8 1800B28F */  lw         $s2, 0x18($sp)
/* DAAC 800252AC 1400B18F */  lw         $s1, 0x14($sp)
/* DAB0 800252B0 1000B08F */  lw         $s0, 0x10($sp)
/* DAB4 800252B4 2800BD27 */  addiu      $sp, $sp, 0x28
/* DAB8 800252B8 0800E003 */  jr         $ra
/* DABC 800252BC 00000000 */   nop
