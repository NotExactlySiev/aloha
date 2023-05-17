.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DB04
/* 6304 8001DB04 28DFBD27 */  addiu      $sp, $sp, -0x20D8
/* 6308 8001DB08 D420BFAF */  sw         $ra, 0x20D4($sp)
/* 630C 8001DB0C D020BEAF */  sw         $fp, 0x20D0($sp)
/* 6310 8001DB10 CC20B7AF */  sw         $s7, 0x20CC($sp)
/* 6314 8001DB14 C820B6AF */  sw         $s6, 0x20C8($sp)
/* 6318 8001DB18 C420B5AF */  sw         $s5, 0x20C4($sp)
/* 631C 8001DB1C C020B4AF */  sw         $s4, 0x20C0($sp)
/* 6320 8001DB20 BC20B3AF */  sw         $s3, 0x20BC($sp)
/* 6324 8001DB24 B820B2AF */  sw         $s2, 0x20B8($sp)
/* 6328 8001DB28 B420B1AF */  sw         $s1, 0x20B4($sp)
/* 632C 8001DB2C B020B0AF */  sw         $s0, 0x20B0($sp)
/* 6330 8001DB30 21A08000 */  addu       $s4, $a0, $zero
/* 6334 8001DB34 1820B127 */  addiu      $s1, $sp, 0x2018
/* 6338 8001DB38 1800B027 */  addiu      $s0, $sp, 0x18
/* 633C 8001DB3C 21B00000 */  addu       $s6, $zero, $zero
/* 6340 8001DB40 0580013C */  lui        $at, %hi(D_800548EC)
/* 6344 8001DB44 EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 6348 8001DB48 2120A000 */  addu       $a0, $a1, $zero
/* 634C 8001DB4C 21282002 */  addu       $a1, $s1, $zero
/* 6350 8001DB50 1076000C */  jal        func_8001D840
/* 6354 8001DB54 21F0C000 */   addu      $fp, $a2, $zero
/* 6358 8001DB58 21904000 */  addu       $s2, $v0, $zero
/* 635C 8001DB5C 7B004012 */  beqz       $s2, .L8001DD4C
/* 6360 8001DB60 21100000 */   addu      $v0, $zero, $zero
/* 6364 8001DB64 AB75000C */  jal        func_8001D6AC
/* 6368 8001DB68 1000A427 */   addiu     $a0, $sp, 0x10
/* 636C 8001DB6C 2A004010 */  beqz       $v0, .L8001DC18
/* 6370 8001DB70 0200422A */   slti      $v0, $s2, 0x2
/* 6374 8001DB74 21004014 */  bnez       $v0, .L8001DBFC
/* 6378 8001DB78 1000A427 */   addiu     $a0, $sp, 0x10
/* 637C 8001DB7C 21A80002 */  addu       $s5, $s0, $zero
.L8001DB80:
/* 6380 8001DB80 2128A002 */  addu       $a1, $s5, $zero
/* 6384 8001DB84 E075000C */  jal        func_8001D780
/* 6388 8001DB88 04000634 */   ori       $a2, $zero, 0x4
/* 638C 8001DB8C 21984000 */  addu       $s3, $v0, $zero
/* 6390 8001DB90 21006012 */  beqz       $s3, .L8001DC18
/* 6394 8001DB94 21202002 */   addu      $a0, $s1, $zero
/* 6398 8001DB98 2128A002 */  addu       $a1, $s5, $zero
/* 639C 8001DB9C 21306002 */  addu       $a2, $s3, $zero
/* 63A0 8001DBA0 2C76000C */  jal        func_8001D8B0
/* 63A4 8001DBA4 9820A727 */   addiu     $a3, $sp, 0x2098
/* 63A8 8001DBA8 21304000 */  addu       $a2, $v0, $zero
/* 63AC 8001DBAC 9C20A38F */  lw         $v1, 0x209C($sp)
/* 63B0 8001DBB0 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 63B4 8001DBB4 65006210 */  beq        $v1, $v0, .L8001DD4C
/* 63B8 8001DBB8 21100000 */   addu      $v0, $zero, $zero
/* 63BC 8001DBBC 9B20A28B */  lwl        $v0, 0x209B($sp)
/* 63C0 8001DBC0 9820A29B */  lwr        $v0, 0x2098($sp)
/* 63C4 8001DBC4 00000000 */  nop
/* 63C8 8001DBC8 1300A2AB */  swl        $v0, 0x13($sp)
/* 63CC 8001DBCC 1000A2BB */  swr        $v0, 0x10($sp)
/* 63D0 8001DBD0 0200C230 */  andi       $v0, $a2, 0x2
/* 63D4 8001DBD4 5D004010 */  beqz       $v0, .L8001DD4C
/* 63D8 8001DBD8 21100000 */   addu      $v0, $zero, $zero
.L8001DBDC:
/* 63DC 8001DBDC 00002292 */  lbu        $v0, 0x0($s1)
/* 63E0 8001DBE0 00000000 */  nop
/* 63E4 8001DBE4 FDFF4014 */  bnez       $v0, .L8001DBDC
/* 63E8 8001DBE8 01003126 */   addiu     $s1, $s1, 0x1
/* 63EC 8001DBEC FFFF5226 */  addiu      $s2, $s2, -0x1
/* 63F0 8001DBF0 0200422A */  slti       $v0, $s2, 0x2
/* 63F4 8001DBF4 E2FF4010 */  beqz       $v0, .L8001DB80
/* 63F8 8001DBF8 1000A427 */   addiu     $a0, $sp, 0x10
.L8001DBFC:
/* 63FC 8001DBFC 1800B127 */  addiu      $s1, $sp, 0x18
/* 6400 8001DC00 21282002 */  addu       $a1, $s1, $zero
/* 6404 8001DC04 E075000C */  jal        func_8001D780
/* 6408 8001DC08 04000634 */   ori       $a2, $zero, 0x4
/* 640C 8001DC0C 21984000 */  addu       $s3, $v0, $zero
/* 6410 8001DC10 03006016 */  bnez       $s3, .L8001DC20
/* 6414 8001DC14 21183302 */   addu      $v1, $s1, $s3
.L8001DC18:
/* 6418 8001DC18 53770008 */  j          .L8001DD4C
/* 641C 8001DC1C 21100000 */   addu      $v0, $zero, $zero
.L8001DC20:
/* 6420 8001DC20 2A100302 */  slt        $v0, $s0, $v1
/* 6424 8001DC24 49004010 */  beqz       $v0, .L8001DD4C
/* 6428 8001DC28 2110C002 */   addu      $v0, $s6, $zero
/* 642C 8001DC2C 21902002 */  addu       $s2, $s1, $zero
/* 6430 8001DC30 2E001534 */  ori        $s5, $zero, 0x2E
/* 6434 8001DC34 21B86000 */  addu       $s7, $v1, $zero
/* 6438 8001DC38 08009126 */  addiu      $s1, $s4, 0x8
.L8001DC3C:
/* 643C 8001DC3C 00000292 */  lbu        $v0, 0x0($s0)
/* 6440 8001DC40 00000000 */  nop
/* 6444 8001DC44 0A004014 */  bnez       $v0, .L8001DC70
/* 6448 8001DC48 07000434 */   ori       $a0, $zero, 0x7
/* 644C 8001DC4C 00080226 */  addiu      $v0, $s0, 0x800
/* 6450 8001DC50 23105200 */  subu       $v0, $v0, $s2
/* 6454 8001DC54 C2120200 */  srl        $v0, $v0, 11
/* 6458 8001DC58 C0220200 */  sll        $a0, $v0, 11
/* 645C 8001DC5C 2B109300 */  sltu       $v0, $a0, $s3
/* 6460 8001DC60 3A004010 */  beqz       $v0, .L8001DD4C
/* 6464 8001DC64 2110C002 */   addu      $v0, $s6, $zero
/* 6468 8001DC68 4C770008 */  j          .L8001DD30
/* 646C 8001DC6C 21804402 */   addu      $s0, $s2, $a0
.L8001DC70:
/* 6470 8001DC70 12000526 */  addiu      $a1, $s0, 0x12
/* 6474 8001DC74 19000292 */  lbu        $v0, 0x19($s0)
/* 6478 8001DC78 0C008626 */  addiu      $a2, $s4, 0xC
/* 647C 8001DC7C 288C000C */  jal        func_800230A0
/* 6480 8001DC80 200022A2 */   sb        $v0, 0x20($s1)
/* 6484 8001DC84 04000434 */  ori        $a0, $zero, 0x4
/* 6488 8001DC88 0A000526 */  addiu      $a1, $s0, 0xA
/* 648C 8001DC8C 288C000C */  jal        func_800230A0
/* 6490 8001DC90 21308002 */   addu      $a2, $s4, $zero
/* 6494 8001DC94 21000526 */  addiu      $a1, $s0, 0x21
/* 6498 8001DC98 20000492 */  lbu        $a0, 0x20($s0)
/* 649C 8001DC9C 288C000C */  jal        func_800230A0
/* 64A0 8001DCA0 14008626 */   addiu     $a2, $s4, 0x14
/* 64A4 8001DCA4 20000292 */  lbu        $v0, 0x20($s0)
/* 64A8 8001DCA8 00000000 */  nop
/* 64AC 8001DCAC 21108202 */  addu       $v0, $s4, $v0
/* 64B0 8001DCB0 140040A0 */  sb         $zero, 0x14($v0)
/* 64B4 8001DCB4 20000492 */  lbu        $a0, 0x20($s0)
/* 64B8 8001DCB8 01000234 */  ori        $v0, $zero, 0x1
/* 64BC 8001DCBC 12008214 */  bne        $a0, $v0, .L8001DD08
/* 64C0 8001DCC0 00000000 */   nop
/* 64C4 8001DCC4 21000292 */  lbu        $v0, 0x21($s0)
/* 64C8 8001DCC8 00000000 */  nop
/* 64CC 8001DCCC 03004014 */  bnez       $v0, .L8001DCDC
/* 64D0 8001DCD0 00000000 */   nop
/* 64D4 8001DCD4 0C0035A2 */  sb         $s5, 0xC($s1)
/* 64D8 8001DCD8 0D0020A2 */  sb         $zero, 0xD($s1)
.L8001DCDC:
/* 64DC 8001DCDC 20000392 */  lbu        $v1, 0x20($s0)
/* 64E0 8001DCE0 00000000 */  nop
/* 64E4 8001DCE4 08006414 */  bne        $v1, $a0, .L8001DD08
/* 64E8 8001DCE8 00000000 */   nop
/* 64EC 8001DCEC 21000292 */  lbu        $v0, 0x21($s0)
/* 64F0 8001DCF0 00000000 */  nop
/* 64F4 8001DCF4 04004314 */  bne        $v0, $v1, .L8001DD08
/* 64F8 8001DCF8 00000000 */   nop
/* 64FC 8001DCFC 0C0035A2 */  sb         $s5, 0xC($s1)
/* 6500 8001DD00 0D0035A2 */  sb         $s5, 0xD($s1)
/* 6504 8001DD04 0E0020A2 */  sb         $zero, 0xE($s1)
.L8001DD08:
/* 6508 8001DD08 9F75000C */  jal        func_8001D67C
/* 650C 8001DD0C 02000426 */   addiu     $a0, $s0, 0x2
/* 6510 8001DD10 21204000 */  addu       $a0, $v0, $zero
/* 6514 8001DD14 85A2000C */  jal        func_80028A14
/* 6518 8001DD18 21282002 */   addu      $a1, $s1, $zero
/* 651C 8001DD1C 2C003126 */  addiu      $s1, $s1, 0x2C
/* 6520 8001DD20 0100D626 */  addiu      $s6, $s6, 0x1
/* 6524 8001DD24 2A10DE02 */  slt        $v0, $s6, $fp
/* 6528 8001DD28 07004010 */  beqz       $v0, .L8001DD48
/* 652C 8001DD2C 2C009426 */   addiu     $s4, $s4, 0x2C
.L8001DD30:
/* 6530 8001DD30 00000292 */  lbu        $v0, 0x0($s0)
/* 6534 8001DD34 00000000 */  nop
/* 6538 8001DD38 21800202 */  addu       $s0, $s0, $v0
/* 653C 8001DD3C 2A101702 */  slt        $v0, $s0, $s7
/* 6540 8001DD40 BEFF4014 */  bnez       $v0, .L8001DC3C
/* 6544 8001DD44 00000000 */   nop
.L8001DD48:
/* 6548 8001DD48 2110C002 */  addu       $v0, $s6, $zero
.L8001DD4C:
/* 654C 8001DD4C D420BF8F */  lw         $ra, 0x20D4($sp)
/* 6550 8001DD50 D020BE8F */  lw         $fp, 0x20D0($sp)
/* 6554 8001DD54 CC20B78F */  lw         $s7, 0x20CC($sp)
/* 6558 8001DD58 C820B68F */  lw         $s6, 0x20C8($sp)
/* 655C 8001DD5C C420B58F */  lw         $s5, 0x20C4($sp)
/* 6560 8001DD60 C020B48F */  lw         $s4, 0x20C0($sp)
/* 6564 8001DD64 BC20B38F */  lw         $s3, 0x20BC($sp)
/* 6568 8001DD68 B820B28F */  lw         $s2, 0x20B8($sp)
/* 656C 8001DD6C B420B18F */  lw         $s1, 0x20B4($sp)
/* 6570 8001DD70 B020B08F */  lw         $s0, 0x20B0($sp)
/* 6574 8001DD74 0800E003 */  jr         $ra
/* 6578 8001DD78 D820BD27 */   addiu     $sp, $sp, 0x20D8
