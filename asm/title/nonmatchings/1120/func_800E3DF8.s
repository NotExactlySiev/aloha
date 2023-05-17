.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3DF8
/* 45F8 800E3DF8 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 45FC 800E3DFC 2000BFAF */  sw         $ra, 0x20($sp)
/* 4600 800E3E00 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4604 800E3E04 1800B0AF */  sw         $s0, 0x18($sp)
/* 4608 800E3E08 21888000 */  addu       $s1, $a0, $zero
/* 460C 800E3E0C 0300A288 */  lwl        $v0, 0x3($a1)
/* 4610 800E3E10 0000A298 */  lwr        $v0, 0x0($a1)
/* 4614 800E3E14 0700A388 */  lwl        $v1, 0x7($a1)
/* 4618 800E3E18 0400A398 */  lwr        $v1, 0x4($a1)
/* 461C 800E3E1C 1300A2AB */  swl        $v0, 0x13($sp)
/* 4620 800E3E20 1000A2BB */  swr        $v0, 0x10($sp)
/* 4624 800E3E24 1700A3AB */  swl        $v1, 0x17($sp)
/* 4628 800E3E28 1400A3BB */  swr        $v1, 0x14($sp)
/* 462C 800E3E2C 21202002 */  addu       $a0, $s1, $zero
/* 4630 800E3E30 0F000534 */  ori        $a1, $zero, 0xF
/* 4634 800E3E34 1000A297 */  lhu        $v0, 0x10($sp)
/* 4638 800E3E38 1000B027 */  addiu      $s0, $sp, 0x10
/* 463C 800E3E3C 21300002 */  addu       $a2, $s0, $zero
/* 4640 800E3E40 01004224 */  addiu      $v0, $v0, 0x1
/* 4644 800E3E44 479B030C */  jal        func_800E6D1C
/* 4648 800E3E48 1000A2A7 */   sh        $v0, 0x10($sp)
/* 464C 800E3E4C 21202002 */  addu       $a0, $s1, $zero
/* 4650 800E3E50 1200A297 */  lhu        $v0, 0x12($sp)
/* 4654 800E3E54 0F000534 */  ori        $a1, $zero, 0xF
/* 4658 800E3E58 21300002 */  addu       $a2, $s0, $zero
/* 465C 800E3E5C 01004224 */  addiu      $v0, $v0, 0x1
/* 4660 800E3E60 479B030C */  jal        func_800E6D1C
/* 4664 800E3E64 1200A2A7 */   sh        $v0, 0x12($sp)
/* 4668 800E3E68 21202002 */  addu       $a0, $s1, $zero
/* 466C 800E3E6C 0E000534 */  ori        $a1, $zero, 0xE
/* 4670 800E3E70 1000A297 */  lhu        $v0, 0x10($sp)
/* 4674 800E3E74 1200A397 */  lhu        $v1, 0x12($sp)
/* 4678 800E3E78 21300002 */  addu       $a2, $s0, $zero
/* 467C 800E3E7C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4680 800E3E80 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4684 800E3E84 FFFF6324 */  addiu      $v1, $v1, -0x1
/* 4688 800E3E88 479B030C */  jal        func_800E6D1C
/* 468C 800E3E8C 1200A3A7 */   sh        $v1, 0x12($sp)
/* 4690 800E3E90 2000BF8F */  lw         $ra, 0x20($sp)
/* 4694 800E3E94 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4698 800E3E98 1800B08F */  lw         $s0, 0x18($sp)
/* 469C 800E3E9C 0800E003 */  jr         $ra
/* 46A0 800E3EA0 2800BD27 */   addiu     $sp, $sp, 0x28
