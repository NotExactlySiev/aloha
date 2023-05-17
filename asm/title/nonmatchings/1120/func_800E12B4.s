.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E12B4
/* 1AB4 800E12B4 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1AB8 800E12B8 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1ABC 800E12BC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1AC0 800E12C0 1000BFAF */  sw         $ra, 0x10($sp)
/* 1AC4 800E12C4 E2006290 */  lbu        $v0, 0xE2($v1)
/* 1AC8 800E12C8 00000000 */  nop
/* 1ACC 800E12CC 29004010 */  beqz       $v0, .L800E1374
/* 1AD0 800E12D0 21388000 */   addu      $a3, $a0, $zero
/* 1AD4 800E12D4 0F80023C */  lui        $v0, %hi(D_800F4E58)
/* 1AD8 800E12D8 584E428C */  lw         $v0, %lo(D_800F4E58)($v0)
/* 1ADC 800E12DC 00000000 */  nop
/* 1AE0 800E12E0 0A004014 */  bnez       $v0, .L800E130C
/* 1AE4 800E12E4 00000000 */   nop
/* 1AE8 800E12E8 E4006290 */  lbu        $v0, 0xE4($v1)
/* 1AEC 800E12EC 00000000 */  nop
/* 1AF0 800E12F0 40100200 */  sll        $v0, $v0, 1
/* 1AF4 800E12F4 0F80013C */  lui        $at, %hi(D_800EB38C)
/* 1AF8 800E12F8 8CB32124 */  addiu      $at, $at, %lo(D_800EB38C)
/* 1AFC 800E12FC 21082200 */  addu       $at, $at, $v0
/* 1B00 800E1300 00002494 */  lhu        $a0, 0x0($at)
/* 1B04 800E1304 D0840308 */  j          .L800E1340
/* 1B08 800E1308 00000000 */   nop
.L800E130C:
/* 1B0C 800E130C 0F80023C */  lui        $v0, %hi(D_800F4E60)
/* 1B10 800E1310 604E428C */  lw         $v0, %lo(D_800F4E60)($v0)
/* 1B14 800E1314 00000000 */  nop
/* 1B18 800E1318 08004014 */  bnez       $v0, .L800E133C
/* 1B1C 800E131C 00000000 */   nop
/* 1B20 800E1320 E9006290 */  lbu        $v0, 0xE9($v1)
/* 1B24 800E1324 00000000 */  nop
/* 1B28 800E1328 01004230 */  andi       $v0, $v0, 0x1
/* 1B2C 800E132C 04004010 */  beqz       $v0, .L800E1340
/* 1B30 800E1330 25000434 */   ori       $a0, $zero, 0x25
/* 1B34 800E1334 D0840308 */  j          .L800E1340
/* 1B38 800E1338 18000434 */   ori       $a0, $zero, 0x18
.L800E133C:
/* 1B3C 800E133C 25000434 */  ori        $a0, $zero, 0x25
.L800E1340:
/* 1B40 800E1340 0F80033C */  lui        $v1, %hi(D_800EB46E)
/* 1B44 800E1344 6EB46384 */  lh         $v1, %lo(D_800EB46E)($v1)
/* 1B48 800E1348 0F80023C */  lui        $v0, %hi(D_800EB46C)
/* 1B4C 800E134C 6CB44284 */  lh         $v0, %lo(D_800EB46C)($v0)
/* 1B50 800E1350 0F80053C */  lui        $a1, %hi(D_800F4E30)
/* 1B54 800E1354 304EA58C */  lw         $a1, %lo(D_800F4E30)($a1)
/* 1B58 800E1358 40300300 */  sll        $a2, $v1, 1
/* 1B5C 800E135C 2130C300 */  addu       $a2, $a2, $v1
/* 1B60 800E1360 C0100200 */  sll        $v0, $v0, 3
/* 1B64 800E1364 7AFFA524 */  addiu      $a1, $a1, -0x86
/* 1B68 800E1368 23284500 */  subu       $a1, $v0, $a1
/* 1B6C 800E136C EF96030C */  jal        func_800E5BBC
/* 1B70 800E1370 80300600 */   sll       $a2, $a2, 2
.L800E1374:
/* 1B74 800E1374 1000BF8F */  lw         $ra, 0x10($sp)
/* 1B78 800E1378 00000000 */  nop
/* 1B7C 800E137C 0800E003 */  jr         $ra
/* 1B80 800E1380 1800BD27 */   addiu     $sp, $sp, 0x18
