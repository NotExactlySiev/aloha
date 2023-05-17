.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E078
/* 16878 8002E078 0080083C */  lui        $t0, (0x80000000 >> 16)
/* 1687C 8002E07C 0040073C */  lui        $a3, (0x40000000 >> 16)
/* 16880 8002E080 FF0F063C */  lui        $a2, (0xFFFFFFF >> 16)
/* 16884 8002E084 FFFFC634 */  ori        $a2, $a2, (0xFFFFFFF & 0xFFFF)
/* 16888 8002E088 0580023C */  lui        $v0, %hi(D_800546D4)
/* 1688C 8002E08C D446428C */  lw         $v0, %lo(D_800546D4)($v0)
/* 16890 8002E090 0580053C */  lui        $a1, %hi(D_800546D8)
/* 16894 8002E094 D846A58C */  lw         $a1, %lo(D_800546D8)($a1)
/* 16898 8002E098 04204400 */  sllv       $a0, $a0, $v0
.L8002E09C:
/* 1689C 8002E09C 0000A38C */  lw         $v1, 0x0($a1)
/* 168A0 8002E0A0 00000000 */  nop
/* 168A4 8002E0A4 24106800 */  and        $v0, $v1, $t0
/* 168A8 8002E0A8 0C004014 */  bnez       $v0, .L8002E0DC
/* 168AC 8002E0AC 24106700 */   and       $v0, $v1, $a3
/* 168B0 8002E0B0 0C004014 */  bnez       $v0, .L8002E0E4
/* 168B4 8002E0B4 24186600 */   and       $v1, $v1, $a2
/* 168B8 8002E0B8 2B106400 */  sltu       $v0, $v1, $a0
/* 168BC 8002E0BC 0A004010 */  beqz       $v0, .L8002E0E8
/* 168C0 8002E0C0 01000234 */   ori       $v0, $zero, 0x1
/* 168C4 8002E0C4 0400A28C */  lw         $v0, 0x4($a1)
/* 168C8 8002E0C8 00000000 */  nop
/* 168CC 8002E0CC 21106200 */  addu       $v0, $v1, $v0
/* 168D0 8002E0D0 2B108200 */  sltu       $v0, $a0, $v0
/* 168D4 8002E0D4 04004014 */  bnez       $v0, .L8002E0E8
/* 168D8 8002E0D8 01000234 */   ori       $v0, $zero, 0x1
.L8002E0DC:
/* 168DC 8002E0DC 27B80008 */  j          .L8002E09C
/* 168E0 8002E0E0 0800A524 */   addiu     $a1, $a1, 0x8
.L8002E0E4:
/* 168E4 8002E0E4 21100000 */  addu       $v0, $zero, $zero
.L8002E0E8:
/* 168E8 8002E0E8 0800E003 */  jr         $ra
/* 168EC 8002E0EC 00000000 */   nop
