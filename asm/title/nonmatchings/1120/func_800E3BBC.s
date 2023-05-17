.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3BBC
/* 43BC 800E3BBC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 43C0 800E3BC0 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 43C4 800E3BC4 1800B2AF */  sw         $s2, 0x18($sp)
/* 43C8 800E3BC8 1400B1AF */  sw         $s1, 0x14($sp)
/* 43CC 800E3BCC AF8C030C */  jal        func_800E32BC
/* 43D0 800E3BD0 1000B0AF */   sw        $s0, 0x10($sp)
/* 43D4 800E3BD4 21904000 */  addu       $s2, $v0, $zero
/* 43D8 800E3BD8 FFFF5032 */  andi       $s0, $s2, 0xFFFF
/* 43DC 800E3BDC FCFF0226 */  addiu      $v0, $s0, -0x4
/* 43E0 800E3BE0 0200422C */  sltiu      $v0, $v0, 0x2
/* 43E4 800E3BE4 04004014 */  bnez       $v0, .L800E3BF8
/* 43E8 800E3BE8 028C1200 */   srl       $s1, $s2, 16
/* 43EC 800E3BEC 06000234 */  ori        $v0, $zero, 0x6
/* 43F0 800E3BF0 08000216 */  bne        $s0, $v0, .L800E3C14
/* 43F4 800E3BF4 21200002 */   addu      $a0, $s0, $zero
.L800E3BF8:
/* 43F8 800E3BF8 0F80043C */  lui        $a0, %hi(D_800F4CBC)
/* 43FC 800E3BFC BC4C848C */  lw         $a0, %lo(D_800F4CBC)($a0)
/* 4400 800E3C00 0F80053C */  lui        $a1, %hi(D_800F4CC0)
/* 4404 800E3C04 C04CA58C */  lw         $a1, %lo(D_800F4CC0)($a1)
/* 4408 800E3C08 0E89030C */  jal        func_800E2438
/* 440C 800E3C0C 21300000 */   addu      $a2, $zero, $zero
/* 4410 800E3C10 21200002 */  addu       $a0, $s0, $zero
.L800E3C14:
/* 4414 800E3C14 21282002 */  addu       $a1, $s1, $zero
/* 4418 800E3C18 0E89030C */  jal        func_800E2438
/* 441C 800E3C1C 21300000 */   addu      $a2, $zero, $zero
/* 4420 800E3C20 21200002 */  addu       $a0, $s0, $zero
/* 4424 800E3C24 5A8C030C */  jal        func_800E3168
/* 4428 800E3C28 21282002 */   addu      $a1, $s1, $zero
/* 442C 800E3C2C 21104002 */  addu       $v0, $s2, $zero
/* 4430 800E3C30 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4434 800E3C34 1800B28F */  lw         $s2, 0x18($sp)
/* 4438 800E3C38 1400B18F */  lw         $s1, 0x14($sp)
/* 443C 800E3C3C 1000B08F */  lw         $s0, 0x10($sp)
/* 4440 800E3C40 0800E003 */  jr         $ra
/* 4444 800E3C44 2000BD27 */   addiu     $sp, $sp, 0x20
