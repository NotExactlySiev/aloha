.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E189C
/* 209C 800E189C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 20A0 800E18A0 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 20A4 800E18A4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 20A8 800E18A8 1000BFAF */  sw         $ra, 0x10($sp)
/* 20AC 800E18AC E2004490 */  lbu        $a0, 0xE2($v0)
/* 20B0 800E18B0 1184030C */  jal        func_800E1044
/* 20B4 800E18B4 00000000 */   nop
/* 20B8 800E18B8 1A80053C */  lui        $a1, %hi(D_801A0FD8)
/* 20BC 800E18BC D80FA58C */  lw         $a1, %lo(D_801A0FD8)($a1)
/* 20C0 800E18C0 0F80013C */  lui        $at, %hi(D_800F4E58)
/* 20C4 800E18C4 584E20AC */  sw         $zero, %lo(D_800F4E58)($at)
/* 20C8 800E18C8 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 20CC 800E18CC 0F80013C */  lui        $at, %hi(D_800F4E60)
/* 20D0 800E18D0 604E23AC */  sw         $v1, %lo(D_800F4E60)($at)
/* 20D4 800E18D4 E900A390 */  lbu        $v1, 0xE9($a1)
/* 20D8 800E18D8 00000000 */  nop
/* 20DC 800E18DC 0E006010 */  beqz       $v1, .L800E1918
/* 20E0 800E18E0 21204000 */   addu      $a0, $v0, $zero
/* 20E4 800E18E4 1405A290 */  lbu        $v0, 0x514($a1)
/* 20E8 800E18E8 00000000 */  nop
/* 20EC 800E18EC 2A108200 */  slt        $v0, $a0, $v0
/* 20F0 800E18F0 09004010 */  beqz       $v0, .L800E1918
/* 20F4 800E18F4 01000234 */   ori       $v0, $zero, 0x1
/* 20F8 800E18F8 0F80013C */  lui        $at, %hi(D_800F4E58)
/* 20FC 800E18FC 584E22AC */  sw         $v0, %lo(D_800F4E58)($at)
/* 2100 800E1900 1405A290 */  lbu        $v0, 0x514($a1)
/* 2104 800E1904 00000000 */  nop
/* 2108 800E1908 23104400 */  subu       $v0, $v0, $a0
/* 210C 800E190C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 2110 800E1910 0F80013C */  lui        $at, %hi(D_800F4E60)
/* 2114 800E1914 604E22AC */  sw         $v0, %lo(D_800F4E60)($at)
.L800E1918:
/* 2118 800E1918 1000BF8F */  lw         $ra, 0x10($sp)
/* 211C 800E191C 00000000 */  nop
/* 2120 800E1920 0800E003 */  jr         $ra
/* 2124 800E1924 1800BD27 */   addiu     $sp, $sp, 0x18
