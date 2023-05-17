.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031550
/* 19D50 80031550 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19D54 80031554 0700023C */  lui        $v0, (0x7FFF8 >> 16)
/* 19D58 80031558 F8FF4234 */  ori        $v0, $v0, (0x7FFF8 & 0xFFFF)
/* 19D5C 8003155C 2B104400 */  sltu       $v0, $v0, $a0
/* 19D60 80031560 1000BFAF */  sw         $ra, 0x10($sp)
/* 19D64 80031564 03004010 */  beqz       $v0, .L80031574
/* 19D68 80031568 1800A4AF */   sw        $a0, 0x18($sp)
/* 19D6C 8003156C 69C50008 */  j          .L800315A4
/* 19D70 80031570 21100000 */   addu      $v0, $zero, $zero
.L80031574:
/* 19D74 80031574 07008230 */  andi       $v0, $a0, 0x7
/* 19D78 80031578 05004010 */  beqz       $v0, .L80031590
/* 19D7C 8003157C 2B000534 */   ori       $a1, $zero, 0x2B
/* 19D80 80031580 08008224 */  addiu      $v0, $a0, 0x8
/* 19D84 80031584 F8FF0324 */  addiu      $v1, $zero, -0x8
/* 19D88 80031588 24104300 */  and        $v0, $v0, $v1
/* 19D8C 8003158C 1800A2AF */  sw         $v0, 0x18($sp)
.L80031590:
/* 19D90 80031590 0480043C */  lui        $a0, %hi(D_800478DC)
/* 19D94 80031594 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 19D98 80031598 10BD000C */  jal        func_8002F440
/* 19D9C 8003159C 1800A627 */   addiu     $a2, $sp, 0x18
/* 19DA0 800315A0 1800A28F */  lw         $v0, 0x18($sp)
.L800315A4:
/* 19DA4 800315A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 19DA8 800315A8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19DAC 800315AC 0800E003 */  jr         $ra
/* 19DB0 800315B0 00000000 */   nop
