.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800201A0
/* 89A0 800201A0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 89A4 800201A4 1400BFAF */  sw         $ra, 0x14($sp)
/* 89A8 800201A8 1000B0AF */  sw         $s0, 0x10($sp)
/* 89AC 800201AC 2180C000 */  addu       $s0, $a2, $zero
/* 89B0 800201B0 0580063C */  lui        $a2, %hi(D_800521F8)
/* 89B4 800201B4 F821C624 */  addiu      $a2, $a2, %lo(D_800521F8)
/* 89B8 800201B8 0880000C */  jal        func_80020020
/* 89BC 800201BC 00000000 */   nop
/* 89C0 800201C0 01000334 */  ori        $v1, $zero, 0x1
/* 89C4 800201C4 03004310 */  beq        $v0, $v1, .L800201D4
/* 89C8 800201C8 00000000 */   nop
/* 89CC 800201CC 7E800008 */  j          .L800201F8
/* 89D0 800201D0 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800201D4:
/* 89D4 800201D4 0580043C */  lui        $a0, %hi(D_800521F8)
/* 89D8 800201D8 F8218424 */  addiu      $a0, $a0, %lo(D_800521F8)
/* 89DC 800201DC 0A8F000C */  jal        func_80023C28
/* 89E0 800201E0 21280002 */   addu      $a1, $s0, $zero
/* 89E4 800201E4 21204000 */  addu       $a0, $v0, $zero
/* 89E8 800201E8 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 89EC 800201EC 02008310 */  beq        $a0, $v1, .L800201F8
/* 89F0 800201F0 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 89F4 800201F4 21108000 */  addu       $v0, $a0, $zero
.L800201F8:
/* 89F8 800201F8 1400BF8F */  lw         $ra, 0x14($sp)
/* 89FC 800201FC 1000B08F */  lw         $s0, 0x10($sp)
/* 8A00 80020200 0800E003 */  jr         $ra
/* 8A04 80020204 1800BD27 */   addiu     $sp, $sp, 0x18
