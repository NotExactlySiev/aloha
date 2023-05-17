.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CA84
/* 5284 8001CA84 B0F7BD27 */  addiu      $sp, $sp, -0x850
/* 5288 8001CA88 4C08BFAF */  sw         $ra, 0x84C($sp)
/* 528C 8001CA8C 4808B6AF */  sw         $s6, 0x848($sp)
/* 5290 8001CA90 4408B5AF */  sw         $s5, 0x844($sp)
/* 5294 8001CA94 4008B4AF */  sw         $s4, 0x840($sp)
/* 5298 8001CA98 3C08B3AF */  sw         $s3, 0x83C($sp)
/* 529C 8001CA9C 3808B2AF */  sw         $s2, 0x838($sp)
/* 52A0 8001CAA0 3408B1AF */  sw         $s1, 0x834($sp)
/* 52A4 8001CAA4 3008B0AF */  sw         $s0, 0x830($sp)
/* 52A8 8001CAA8 21888000 */  addu       $s1, $a0, $zero
/* 52AC 8001CAAC 21B0A000 */  addu       $s6, $a1, $zero
/* 52B0 8001CAB0 DF69000C */  jal        func_8001A77C
/* 52B4 8001CAB4 21A0C000 */   addu      $s4, $a2, $zero
/* 52B8 8001CAB8 536E000C */  jal        func_8001B94C
/* 52BC 8001CABC 00000000 */   nop
/* 52C0 8001CAC0 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 52C4 8001CAC4 66004310 */  beq        $v0, $v1, .L8001CC60
/* 52C8 8001CAC8 1000B227 */   addiu     $s2, $sp, 0x10
/* 52CC 8001CACC 1008B027 */  addiu      $s0, $sp, 0x810
/* 52D0 8001CAD0 21200002 */  addu       $a0, $s0, $zero
/* 52D4 8001CAD4 0671000C */  jal        func_8001C418
/* 52D8 8001CAD8 21282002 */   addu      $a1, $s1, $zero
/* 52DC 8001CADC 03004014 */  bnez       $v0, .L8001CAEC
/* 52E0 8001CAE0 21200002 */   addu      $a0, $s0, $zero
/* 52E4 8001CAE4 26730008 */  j          .L8001CC98
/* 52E8 8001CAE8 FEFF0224 */   addiu     $v0, $zero, -0x2
.L8001CAEC:
/* 52EC 8001CAEC 1408A28F */  lw         $v0, 0x814($sp)
/* 52F0 8001CAF0 00000000 */  nop
/* 52F4 8001CAF4 C6A2000C */  jal        func_80028B18
/* 52F8 8001CAF8 00F85524 */   addiu     $s5, $v0, -0x800
/* 52FC 8001CAFC 01004424 */  addiu      $a0, $v0, 0x1
/* 5300 8001CB00 85A2000C */  jal        func_80028A14
/* 5304 8001CB04 2808A527 */   addiu     $a1, $sp, 0x828
/* 5308 8001CB08 02000434 */  ori        $a0, $zero, 0x2
.L8001CB0C:
/* 530C 8001CB0C 1008B127 */  addiu      $s1, $sp, 0x810
.L8001CB10:
/* 5310 8001CB10 21282002 */  addu       $a1, $s1, $zero
/* 5314 8001CB14 5B68000C */  jal        func_8001A16C
/* 5318 8001CB18 21300000 */   addu      $a2, $zero, $zero
/* 531C 8001CB1C 01000434 */  ori        $a0, $zero, 0x1
/* 5320 8001CB20 21284002 */  addu       $a1, $s2, $zero
/* 5324 8001CB24 9C68000C */  jal        func_8001A270
/* 5328 8001CB28 80000634 */   ori       $a2, $zero, 0x80
/* 532C 8001CB2C 21200000 */  addu       $a0, $zero, $zero
/* 5330 8001CB30 B268000C */  jal        func_8001A2C8
/* 5334 8001CB34 21280000 */   addu      $a1, $zero, $zero
/* 5338 8001CB38 21804000 */  addu       $s0, $v0, $zero
/* 533C 8001CB3C FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5340 8001CB40 0E000216 */  bne        $s0, $v0, .L8001CB7C
/* 5344 8001CB44 21388002 */   addu      $a3, $s4, $zero
/* 5348 8001CB48 02000434 */  ori        $a0, $zero, 0x2
/* 534C 8001CB4C 21282002 */  addu       $a1, $s1, $zero
/* 5350 8001CB50 5B68000C */  jal        func_8001A16C
/* 5354 8001CB54 21300000 */   addu      $a2, $zero, $zero
/* 5358 8001CB58 01000434 */  ori        $a0, $zero, 0x1
/* 535C 8001CB5C 21284002 */  addu       $a1, $s2, $zero
/* 5360 8001CB60 9C68000C */  jal        func_8001A270
/* 5364 8001CB64 80000634 */   ori       $a2, $zero, 0x80
/* 5368 8001CB68 21200000 */  addu       $a0, $zero, $zero
/* 536C 8001CB6C B268000C */  jal        func_8001A2C8
/* 5370 8001CB70 21280000 */   addu      $a1, $zero, $zero
/* 5374 8001CB74 3A005010 */  beq        $v0, $s0, .L8001CC60
/* 5378 8001CB78 21388002 */   addu      $a3, $s4, $zero
.L8001CB7C:
/* 537C 8001CB7C 10004626 */  addiu      $a2, $s2, 0x10
/* 5380 8001CB80 40004826 */  addiu      $t0, $s2, 0x40
.L8001CB84:
/* 5384 8001CB84 0000C28C */  lw         $v0, 0x0($a2)
/* 5388 8001CB88 0400C38C */  lw         $v1, 0x4($a2)
/* 538C 8001CB8C 0800C48C */  lw         $a0, 0x8($a2)
/* 5390 8001CB90 0C00C58C */  lw         $a1, 0xC($a2)
/* 5394 8001CB94 0000E2AC */  sw         $v0, 0x0($a3)
/* 5398 8001CB98 0400E3AC */  sw         $v1, 0x4($a3)
/* 539C 8001CB9C 0800E4AC */  sw         $a0, 0x8($a3)
/* 53A0 8001CBA0 0C00E5AC */  sw         $a1, 0xC($a3)
/* 53A4 8001CBA4 1000C624 */  addiu      $a2, $a2, 0x10
/* 53A8 8001CBA8 F6FFC814 */  bne        $a2, $t0, .L8001CB84
/* 53AC 8001CBAC 1000E724 */   addiu     $a3, $a3, 0x10
/* 53B0 8001CBB0 0000C28C */  lw         $v0, 0x0($a2)
/* 53B4 8001CBB4 0400C38C */  lw         $v1, 0x4($a2)
/* 53B8 8001CBB8 0800C48C */  lw         $a0, 0x8($a2)
/* 53BC 8001CBBC 0000E2AC */  sw         $v0, 0x0($a3)
/* 53C0 8001CBC0 0400E3AC */  sw         $v1, 0x4($a3)
/* 53C4 8001CBC4 0800E4AC */  sw         $a0, 0x8($a3)
/* 53C8 8001CBC8 200096AE */  sw         $s6, 0x20($s4)
/* 53CC 8001CBCC 02000434 */  ori        $a0, $zero, 0x2
/* 53D0 8001CBD0 2808B327 */  addiu      $s3, $sp, 0x828
/* 53D4 8001CBD4 21286002 */  addu       $a1, $s3, $zero
/* 53D8 8001CBD8 5B68000C */  jal        func_8001A16C
/* 53DC 8001CBDC 21300000 */   addu      $a2, $zero, $zero
/* 53E0 8001CBE0 FF07B026 */  addiu      $s0, $s5, 0x7FF
/* 53E4 8001CBE4 02000106 */  bgez       $s0, .L8001CBF0
/* 53E8 8001CBE8 21200002 */   addu      $a0, $s0, $zero
/* 53EC 8001CBEC FE0FA426 */  addiu      $a0, $s5, 0xFFE
.L8001CBF0:
/* 53F0 8001CBF0 C3220400 */  sra        $a0, $a0, 11
/* 53F4 8001CBF4 0800858E */  lw         $a1, 0x8($s4)
/* 53F8 8001CBF8 9C68000C */  jal        func_8001A270
/* 53FC 8001CBFC 80000634 */   ori       $a2, $zero, 0x80
/* 5400 8001CC00 21200000 */  addu       $a0, $zero, $zero
/* 5404 8001CC04 B268000C */  jal        func_8001A2C8
/* 5408 8001CC08 21280000 */   addu      $a1, $zero, $zero
/* 540C 8001CC0C 21884000 */  addu       $s1, $v0, $zero
/* 5410 8001CC10 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5414 8001CC14 14002216 */  bne        $s1, $v0, .L8001CC68
/* 5418 8001CC18 2D58033C */   lui       $v1, (0x582D5350 >> 16)
/* 541C 8001CC1C 02000434 */  ori        $a0, $zero, 0x2
/* 5420 8001CC20 21286002 */  addu       $a1, $s3, $zero
/* 5424 8001CC24 5B68000C */  jal        func_8001A16C
/* 5428 8001CC28 21300000 */   addu      $a2, $zero, $zero
/* 542C 8001CC2C 21200002 */  addu       $a0, $s0, $zero
/* 5430 8001CC30 03008104 */  bgez       $a0, .L8001CC40
/* 5434 8001CC34 C3220400 */   sra       $a0, $a0, 11
/* 5438 8001CC38 FE0FA426 */  addiu      $a0, $s5, 0xFFE
/* 543C 8001CC3C C3220400 */  sra        $a0, $a0, 11
.L8001CC40:
/* 5440 8001CC40 0800858E */  lw         $a1, 0x8($s4)
/* 5444 8001CC44 9C68000C */  jal        func_8001A270
/* 5448 8001CC48 80000634 */   ori       $a2, $zero, 0x80
/* 544C 8001CC4C 21200000 */  addu       $a0, $zero, $zero
/* 5450 8001CC50 B268000C */  jal        func_8001A2C8
/* 5454 8001CC54 21280000 */   addu      $a1, $zero, $zero
/* 5458 8001CC58 03005114 */  bne        $v0, $s1, .L8001CC68
/* 545C 8001CC5C 2D58033C */   lui       $v1, (0x582D5350 >> 16)
.L8001CC60:
/* 5460 8001CC60 26730008 */  j          .L8001CC98
/* 5464 8001CC64 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001CC68:
/* 5468 8001CC68 0000428E */  lw         $v0, 0x0($s2)
/* 546C 8001CC6C 50536334 */  ori        $v1, $v1, (0x582D5350 & 0xFFFF)
/* 5470 8001CC70 A6FF4314 */  bne        $v0, $v1, .L8001CB0C
/* 5474 8001CC74 02000434 */   ori       $a0, $zero, 0x2
/* 5478 8001CC78 5845033C */  lui        $v1, (0x45584520 >> 16)
/* 547C 8001CC7C 0400428E */  lw         $v0, 0x4($s2)
/* 5480 8001CC80 20456334 */  ori        $v1, $v1, (0x45584520 & 0xFFFF)
/* 5484 8001CC84 A2FF4314 */  bne        $v0, $v1, .L8001CB10
/* 5488 8001CC88 1008B127 */   addiu     $s1, $sp, 0x810
/* 548C 8001CC8C 2166000C */  jal        func_80019884
/* 5490 8001CC90 00000000 */   nop
/* 5494 8001CC94 21100000 */  addu       $v0, $zero, $zero
.L8001CC98:
/* 5498 8001CC98 4C08BF8F */  lw         $ra, 0x84C($sp)
/* 549C 8001CC9C 4808B68F */  lw         $s6, 0x848($sp)
/* 54A0 8001CCA0 4408B58F */  lw         $s5, 0x844($sp)
/* 54A4 8001CCA4 4008B48F */  lw         $s4, 0x840($sp)
/* 54A8 8001CCA8 3C08B38F */  lw         $s3, 0x83C($sp)
/* 54AC 8001CCAC 3808B28F */  lw         $s2, 0x838($sp)
/* 54B0 8001CCB0 3408B18F */  lw         $s1, 0x834($sp)
/* 54B4 8001CCB4 3008B08F */  lw         $s0, 0x830($sp)
/* 54B8 8001CCB8 0800E003 */  jr         $ra
/* 54BC 8001CCBC 5008BD27 */   addiu     $sp, $sp, 0x850
