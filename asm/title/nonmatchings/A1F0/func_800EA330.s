.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800EA330
/* AB30 800EA330 00008F84 */  lh         $t7, 0x0($a0)
/* AB34 800EA334 2110A000 */  addu       $v0, $a1, $zero
/* AB38 800EA338 0E00E105 */  bgez       $t7, .L800EA374
/* AB3C 800EA33C FF0FF931 */   andi      $t9, $t7, 0xFFF
/* AB40 800EA340 23780F00 */  negu       $t7, $t7
/* AB44 800EA344 0100E105 */  bgez       $t7, .L800EA34C
/* AB48 800EA348 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA34C:
/* AB4C 800EA34C 80C00F00 */  sll        $t8, $t7, 2
/* AB50 800EA350 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AB54 800EA354 21C83803 */  addu       $t9, $t9, $t8
/* AB58 800EA358 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AB5C 800EA35C 00000000 */  nop
/* AB60 800EA360 00C41900 */  sll        $t8, $t9, 16
/* AB64 800EA364 03C41800 */  sra        $t8, $t8, 16
/* AB68 800EA368 23581800 */  negu       $t3, $t8
/* AB6C 800EA36C E5A80308 */  j          .L800EA394
/* AB70 800EA370 03441900 */   sra       $t0, $t9, 16
.L800EA374:
/* AB74 800EA374 80C01900 */  sll        $t8, $t9, 2
/* AB78 800EA378 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AB7C 800EA37C 21C83803 */  addu       $t9, $t9, $t8
/* AB80 800EA380 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AB84 800EA384 00000000 */  nop
/* AB88 800EA388 00C41900 */  sll        $t8, $t9, 16
/* AB8C 800EA38C 035C1800 */  sra        $t3, $t8, 16
/* AB90 800EA390 03441900 */  sra        $t0, $t9, 16
.L800EA394:
/* AB94 800EA394 02008F84 */  lh         $t7, 0x2($a0)
/* AB98 800EA398 00000000 */  nop
/* AB9C 800EA39C 0E00E105 */  bgez       $t7, .L800EA3D8
/* ABA0 800EA3A0 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* ABA4 800EA3A4 23780F00 */  negu       $t7, $t7
/* ABA8 800EA3A8 0100E105 */  bgez       $t7, .L800EA3B0
/* ABAC 800EA3AC FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA3B0:
/* ABB0 800EA3B0 80C00F00 */  sll        $t8, $t7, 2
/* ABB4 800EA3B4 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* ABB8 800EA3B8 21C83803 */  addu       $t9, $t9, $t8
/* ABBC 800EA3BC 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* ABC0 800EA3C0 00000000 */  nop
/* ABC4 800EA3C4 00641900 */  sll        $t4, $t9, 16
/* ABC8 800EA3C8 03640C00 */  sra        $t4, $t4, 16
/* ABCC 800EA3CC 23700C00 */  negu       $t6, $t4
/* ABD0 800EA3D0 FFA80308 */  j          .L800EA3FC
/* ABD4 800EA3D4 034C1900 */   sra       $t1, $t9, 16
.L800EA3D8:
/* ABD8 800EA3D8 80C01900 */  sll        $t8, $t9, 2
/* ABDC 800EA3DC 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* ABE0 800EA3E0 21C83803 */  addu       $t9, $t9, $t8
/* ABE4 800EA3E4 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* ABE8 800EA3E8 00000000 */  nop
/* ABEC 800EA3EC 00741900 */  sll        $t6, $t9, 16
/* ABF0 800EA3F0 03740E00 */  sra        $t6, $t6, 16
/* ABF4 800EA3F4 23600E00 */  negu       $t4, $t6
/* ABF8 800EA3F8 034C1900 */  sra        $t1, $t9, 16
.L800EA3FC:
/* ABFC 800EA3FC 19002B01 */  multu      $t1, $t3
/* AC00 800EA400 04008F84 */  lh         $t7, 0x4($a0)
/* AC04 800EA404 0400AEA4 */  sh         $t6, 0x4($a1)
/* AC08 800EA408 12C00000 */  mflo       $t8
/* AC0C 800EA40C 23C81800 */  negu       $t9, $t8
/* AC10 800EA410 03731900 */  sra        $t6, $t9, 12
/* AC14 800EA414 19002801 */  multu      $t1, $t0
/* AC18 800EA418 0A00AEA4 */  sh         $t6, 0xA($a1)
/* AC1C 800EA41C 1100E105 */  bgez       $t7, .L800EA464
/* AC20 800EA420 FF0FF931 */   andi      $t9, $t7, 0xFFF
/* AC24 800EA424 12C00000 */  mflo       $t8
/* AC28 800EA428 03731800 */  sra        $t6, $t8, 12
/* AC2C 800EA42C 1000AEA4 */  sh         $t6, 0x10($a1)
/* AC30 800EA430 23780F00 */  negu       $t7, $t7
/* AC34 800EA434 0100E105 */  bgez       $t7, .L800EA43C
/* AC38 800EA438 FF0FEF31 */   andi      $t7, $t7, 0xFFF
.L800EA43C:
/* AC3C 800EA43C 80C00F00 */  sll        $t8, $t7, 2
/* AC40 800EA440 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AC44 800EA444 21C83803 */  addu       $t9, $t9, $t8
/* AC48 800EA448 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AC4C 800EA44C 00000000 */  nop
/* AC50 800EA450 00C41900 */  sll        $t8, $t9, 16
/* AC54 800EA454 03C41800 */  sra        $t8, $t8, 16
/* AC58 800EA458 23681800 */  negu       $t5, $t8
/* AC5C 800EA45C 24A90308 */  j          .L800EA490
/* AC60 800EA460 03541900 */   sra       $t2, $t9, 16
.L800EA464:
/* AC64 800EA464 12780000 */  mflo       $t7
/* AC68 800EA468 03730F00 */  sra        $t6, $t7, 12
/* AC6C 800EA46C 1000AEA4 */  sh         $t6, 0x10($a1)
/* AC70 800EA470 80C01900 */  sll        $t8, $t9, 2
/* AC74 800EA474 0F80193C */  lui        $t9, %hi(D_800F0C20)
/* AC78 800EA478 21C83803 */  addu       $t9, $t9, $t8
/* AC7C 800EA47C 200C398F */  lw         $t9, %lo(D_800F0C20)($t9)
/* AC80 800EA480 00000000 */  nop
/* AC84 800EA484 00C41900 */  sll        $t8, $t9, 16
/* AC88 800EA488 036C1800 */  sra        $t5, $t8, 16
/* AC8C 800EA48C 03541900 */  sra        $t2, $t9, 16
.L800EA490:
/* AC90 800EA490 19004901 */  multu      $t2, $t1
/* AC94 800EA494 00000000 */  nop
/* AC98 800EA498 00000000 */  nop
/* AC9C 800EA49C 12780000 */  mflo       $t7
/* ACA0 800EA4A0 03730F00 */  sra        $t6, $t7, 12
/* ACA4 800EA4A4 0000AEA4 */  sh         $t6, 0x0($a1)
/* ACA8 800EA4A8 1900A901 */  multu      $t5, $t1
/* ACAC 800EA4AC 00000000 */  nop
/* ACB0 800EA4B0 00000000 */  nop
/* ACB4 800EA4B4 12780000 */  mflo       $t7
/* ACB8 800EA4B8 23700F00 */  negu       $t6, $t7
/* ACBC 800EA4BC 037B0E00 */  sra        $t7, $t6, 12
/* ACC0 800EA4C0 19004C01 */  multu      $t2, $t4
/* ACC4 800EA4C4 0200AFA4 */  sh         $t7, 0x2($a1)
/* ACC8 800EA4C8 00000000 */  nop
/* ACCC 800EA4CC 12780000 */  mflo       $t7
/* ACD0 800EA4D0 03C30F00 */  sra        $t8, $t7, 12
/* ACD4 800EA4D4 00000000 */  nop
/* ACD8 800EA4D8 19000B03 */  multu      $t8, $t3
/* ACDC 800EA4DC 00000000 */  nop
/* ACE0 800EA4E0 00000000 */  nop
/* ACE4 800EA4E4 12780000 */  mflo       $t7
/* ACE8 800EA4E8 03730F00 */  sra        $t6, $t7, 12
/* ACEC 800EA4EC 00000000 */  nop
/* ACF0 800EA4F0 1900A801 */  multu      $t5, $t0
/* ACF4 800EA4F4 00000000 */  nop
/* ACF8 800EA4F8 00000000 */  nop
/* ACFC 800EA4FC 12780000 */  mflo       $t7
/* AD00 800EA500 03CB0F00 */  sra        $t9, $t7, 12
/* AD04 800EA504 23782E03 */  subu       $t7, $t9, $t6
/* AD08 800EA508 19000803 */  multu      $t8, $t0
/* AD0C 800EA50C 0600AFA4 */  sh         $t7, 0x6($a1)
/* AD10 800EA510 00000000 */  nop
/* AD14 800EA514 12700000 */  mflo       $t6
/* AD18 800EA518 037B0E00 */  sra        $t7, $t6, 12
/* AD1C 800EA51C 00000000 */  nop
/* AD20 800EA520 1900AB01 */  multu      $t5, $t3
/* AD24 800EA524 00000000 */  nop
/* AD28 800EA528 00000000 */  nop
/* AD2C 800EA52C 12700000 */  mflo       $t6
/* AD30 800EA530 03CB0E00 */  sra        $t9, $t6, 12
/* AD34 800EA534 21702F03 */  addu       $t6, $t9, $t7
/* AD38 800EA538 1900AC01 */  multu      $t5, $t4
/* AD3C 800EA53C 0C00AEA4 */  sh         $t6, 0xC($a1)
/* AD40 800EA540 00000000 */  nop
/* AD44 800EA544 12780000 */  mflo       $t7
/* AD48 800EA548 03C30F00 */  sra        $t8, $t7, 12
/* AD4C 800EA54C 00000000 */  nop
/* AD50 800EA550 19000B03 */  multu      $t8, $t3
/* AD54 800EA554 00000000 */  nop
/* AD58 800EA558 00000000 */  nop
/* AD5C 800EA55C 12780000 */  mflo       $t7
/* AD60 800EA560 03730F00 */  sra        $t6, $t7, 12
/* AD64 800EA564 00000000 */  nop
/* AD68 800EA568 19004801 */  multu      $t2, $t0
/* AD6C 800EA56C 00000000 */  nop
/* AD70 800EA570 00000000 */  nop
/* AD74 800EA574 12780000 */  mflo       $t7
/* AD78 800EA578 03CB0F00 */  sra        $t9, $t7, 12
/* AD7C 800EA57C 21782E03 */  addu       $t7, $t9, $t6
/* AD80 800EA580 19000803 */  multu      $t8, $t0
/* AD84 800EA584 0800AFA4 */  sh         $t7, 0x8($a1)
/* AD88 800EA588 00000000 */  nop
/* AD8C 800EA58C 12700000 */  mflo       $t6
/* AD90 800EA590 037B0E00 */  sra        $t7, $t6, 12
/* AD94 800EA594 00000000 */  nop
/* AD98 800EA598 19004B01 */  multu      $t2, $t3
/* AD9C 800EA59C 00000000 */  nop
/* ADA0 800EA5A0 00000000 */  nop
/* ADA4 800EA5A4 12700000 */  mflo       $t6
/* ADA8 800EA5A8 03CB0E00 */  sra        $t9, $t6, 12
/* ADAC 800EA5AC 23702F03 */  subu       $t6, $t9, $t7
/* ADB0 800EA5B0 0E00AEA4 */  sh         $t6, 0xE($a1)
/* ADB4 800EA5B4 0800E003 */  jr         $ra
/* ADB8 800EA5B8 00000000 */   nop
