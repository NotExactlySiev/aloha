.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800280B0
/* 108B0 800280B0 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 108B4 800280B4 21108000 */  addu       $v0, $a0, $zero
/* 108B8 800280B8 1800B0AF */  sw         $s0, 0x18($sp)
/* 108BC 800280BC 2180A000 */  addu       $s0, $a1, $zero
/* 108C0 800280C0 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 108C4 800280C4 2188C000 */  addu       $s1, $a2, $zero
/* 108C8 800280C8 1000A427 */  addiu      $a0, $sp, 0x10
/* 108CC 800280CC 21284000 */  addu       $a1, $v0, $zero
/* 108D0 800280D0 00010234 */  ori        $v0, $zero, 0x100
/* 108D4 800280D4 1400A2A7 */  sh         $v0, 0x14($sp)
/* 108D8 800280D8 01000234 */  ori        $v0, $zero, 0x1
/* 108DC 800280DC 2000BFAF */  sw         $ra, 0x20($sp)
/* 108E0 800280E0 1000B0A7 */  sh         $s0, 0x10($sp)
/* 108E4 800280E4 1200B1A7 */  sh         $s1, 0x12($sp)
/* 108E8 800280E8 B094000C */  jal        func_800252C0
/* 108EC 800280EC 1600A2A7 */   sh        $v0, 0x16($sp)
/* 108F0 800280F0 21200002 */  addu       $a0, $s0, $zero
/* 108F4 800280F4 5F9E000C */  jal        func_8002797C
/* 108F8 800280F8 21282002 */   addu      $a1, $s1, $zero
/* 108FC 800280FC FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* 10900 80028100 2000BF8F */  lw         $ra, 0x20($sp)
/* 10904 80028104 1C00B18F */  lw         $s1, 0x1C($sp)
/* 10908 80028108 1800B08F */  lw         $s0, 0x18($sp)
/* 1090C 8002810C 2800BD27 */  addiu      $sp, $sp, 0x28
/* 10910 80028110 0800E003 */  jr         $ra
/* 10914 80028114 00000000 */   nop
