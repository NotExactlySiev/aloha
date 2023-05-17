.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001BB50
/* 4350 8001BB50 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 4354 8001BB54 1800BFAF */  sw         $ra, 0x18($sp)
/* 4358 8001BB58 1400B1AF */  sw         $s1, 0x14($sp)
/* 435C 8001BB5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 4360 8001BB60 21808000 */  addu       $s0, $a0, $zero
/* 4364 8001BB64 7566000C */  jal        func_800199D4
/* 4368 8001BB68 2188A000 */   addu      $s1, $a1, $zero
/* 436C 8001BB6C 01000334 */  ori        $v1, $zero, 0x1
/* 4370 8001BB70 02004314 */  bne        $v0, $v1, .L8001BB7C
/* 4374 8001BB74 C8000434 */   ori       $a0, $zero, 0xC8
/* 4378 8001BB78 CB000434 */  ori        $a0, $zero, 0xCB
.L8001BB7C:
/* 437C 8001BB7C 02000106 */  bgez       $s0, .L8001BB88
/* 4380 8001BB80 C8000234 */   ori       $v0, $zero, 0xC8
/* 4384 8001BB84 FF071026 */  addiu      $s0, $s0, 0x7FF
.L8001BB88:
/* 4388 8001BB88 C3821000 */  sra        $s0, $s0, 11
/* 438C 8001BB8C 18000402 */  mult       $s0, $a0
/* 4390 8001BB90 12800000 */  mflo       $s0
/* 4394 8001BB94 00000000 */  nop
/* 4398 8001BB98 00000000 */  nop
/* 439C 8001BB9C 1A000202 */  div        $zero, $s0, $v0
/* 43A0 8001BBA0 02004014 */  bnez       $v0, .L8001BBAC
/* 43A4 8001BBA4 00000000 */   nop
/* 43A8 8001BBA8 0D000700 */  break      7
.L8001BBAC:
/* 43AC 8001BBAC FFFF0124 */  addiu      $at, $zero, -0x1
/* 43B0 8001BBB0 04004114 */  bne        $v0, $at, .L8001BBC4
/* 43B4 8001BBB4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 43B8 8001BBB8 02000116 */  bne        $s0, $at, .L8001BBC4
/* 43BC 8001BBBC 00000000 */   nop
/* 43C0 8001BBC0 0D000600 */  break      6
.L8001BBC4:
/* 43C4 8001BBC4 12800000 */  mflo       $s0
/* 43C8 8001BBC8 4B000634 */  ori        $a2, $zero, 0x4B
/* 43CC 8001BBCC 1A000602 */  div        $zero, $s0, $a2
/* 43D0 8001BBD0 0200C014 */  bnez       $a2, .L8001BBDC
/* 43D4 8001BBD4 00000000 */   nop
/* 43D8 8001BBD8 0D000700 */  break      7
.L8001BBDC:
/* 43DC 8001BBDC FFFF0124 */  addiu      $at, $zero, -0x1
/* 43E0 8001BBE0 0400C114 */  bne        $a2, $at, .L8001BBF4
/* 43E4 8001BBE4 0080013C */   lui       $at, (0x80000000 >> 16)
/* 43E8 8001BBE8 02000116 */  bne        $s0, $at, .L8001BBF4
/* 43EC 8001BBEC 00000000 */   nop
/* 43F0 8001BBF0 0D000600 */  break      6
.L8001BBF4:
/* 43F4 8001BBF4 12300000 */  mflo       $a2
/* 43F8 8001BBF8 10280000 */  mfhi       $a1
/* 43FC 8001BBFC 0A000434 */  ori        $a0, $zero, 0xA
/* 4400 8001BC00 1A00A400 */  div        $zero, $a1, $a0
/* 4404 8001BC04 02008014 */  bnez       $a0, .L8001BC10
/* 4408 8001BC08 00000000 */   nop
/* 440C 8001BC0C 0D000700 */  break      7
.L8001BC10:
/* 4410 8001BC10 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4414 8001BC14 04008114 */  bne        $a0, $at, .L8001BC28
/* 4418 8001BC18 0080013C */   lui       $at, (0x80000000 >> 16)
/* 441C 8001BC1C 0200A114 */  bne        $a1, $at, .L8001BC28
/* 4420 8001BC20 00000000 */   nop
/* 4424 8001BC24 0D000600 */  break      6
.L8001BC28:
/* 4428 8001BC28 12280000 */  mflo       $a1
/* 442C 8001BC2C 10380000 */  mfhi       $a3
/* 4430 8001BC30 3C000234 */  ori        $v0, $zero, 0x3C
/* 4434 8001BC34 1A00C200 */  div        $zero, $a2, $v0
/* 4438 8001BC38 02004014 */  bnez       $v0, .L8001BC44
/* 443C 8001BC3C 00000000 */   nop
/* 4440 8001BC40 0D000700 */  break      7
.L8001BC44:
/* 4444 8001BC44 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4448 8001BC48 04004114 */  bne        $v0, $at, .L8001BC5C
/* 444C 8001BC4C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4450 8001BC50 0200C114 */  bne        $a2, $at, .L8001BC5C
/* 4454 8001BC54 00000000 */   nop
/* 4458 8001BC58 0D000600 */  break      6
.L8001BC5C:
/* 445C 8001BC5C 12300000 */  mflo       $a2
/* 4460 8001BC60 10180000 */  mfhi       $v1
/* 4464 8001BC64 1A006400 */  div        $zero, $v1, $a0
/* 4468 8001BC68 02008014 */  bnez       $a0, .L8001BC74
/* 446C 8001BC6C 00000000 */   nop
/* 4470 8001BC70 0D000700 */  break      7
.L8001BC74:
/* 4474 8001BC74 FFFF0124 */  addiu      $at, $zero, -0x1
/* 4478 8001BC78 04008114 */  bne        $a0, $at, .L8001BC8C
/* 447C 8001BC7C 0080013C */   lui       $at, (0x80000000 >> 16)
/* 4480 8001BC80 02006114 */  bne        $v1, $at, .L8001BC8C
/* 4484 8001BC84 00000000 */   nop
/* 4488 8001BC88 0D000600 */  break      6
.L8001BC8C:
/* 448C 8001BC8C 12180000 */  mflo       $v1
/* 4490 8001BC90 10400000 */  mfhi       $t0
/* 4494 8001BC94 1A00C400 */  div        $zero, $a2, $a0
/* 4498 8001BC98 02008014 */  bnez       $a0, .L8001BCA4
/* 449C 8001BC9C 00000000 */   nop
/* 44A0 8001BCA0 0D000700 */  break      7
.L8001BCA4:
/* 44A4 8001BCA4 FFFF0124 */  addiu      $at, $zero, -0x1
/* 44A8 8001BCA8 04008114 */  bne        $a0, $at, .L8001BCBC
/* 44AC 8001BCAC 0080013C */   lui       $at, (0x80000000 >> 16)
/* 44B0 8001BCB0 0200C114 */  bne        $a2, $at, .L8001BCBC
/* 44B4 8001BCB4 00000000 */   nop
/* 44B8 8001BCB8 0D000600 */  break      6
.L8001BCBC:
/* 44BC 8001BCBC 12300000 */  mflo       $a2
/* 44C0 8001BCC0 10200000 */  mfhi       $a0
/* 44C4 8001BCC4 21102002 */  addu       $v0, $s1, $zero
/* 44C8 8001BCC8 00290500 */  sll        $a1, $a1, 4
/* 44CC 8001BCCC 2128A700 */  addu       $a1, $a1, $a3
/* 44D0 8001BCD0 020045A0 */  sb         $a1, 0x2($v0)
/* 44D4 8001BCD4 00190300 */  sll        $v1, $v1, 4
/* 44D8 8001BCD8 21186800 */  addu       $v1, $v1, $t0
/* 44DC 8001BCDC 010043A0 */  sb         $v1, 0x1($v0)
/* 44E0 8001BCE0 00310600 */  sll        $a2, $a2, 4
/* 44E4 8001BCE4 2130C400 */  addu       $a2, $a2, $a0
/* 44E8 8001BCE8 000046A0 */  sb         $a2, 0x0($v0)
/* 44EC 8001BCEC 1800BF8F */  lw         $ra, 0x18($sp)
/* 44F0 8001BCF0 1400B18F */  lw         $s1, 0x14($sp)
/* 44F4 8001BCF4 1000B08F */  lw         $s0, 0x10($sp)
/* 44F8 8001BCF8 0800E003 */  jr         $ra
/* 44FC 8001BCFC 2000BD27 */   addiu     $sp, $sp, 0x20
