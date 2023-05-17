.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8084
/* 8884 800E8084 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8888 800E8088 1000BFAF */  sw         $ra, 0x10($sp)
/* 888C 800E808C 7BA6030C */  jal        func_800E99EC
/* 8890 800E8090 00000000 */   nop
/* 8894 800E8094 2AA6030C */  jal        func_800E98A8
/* 8898 800E8098 80000434 */   ori       $a0, $zero, 0x80
/* 889C 800E809C A0000434 */  ori        $a0, $zero, 0xA0
/* 88A0 800E80A0 24A6030C */  jal        func_800E9890
/* 88A4 800E80A4 78000534 */   ori       $a1, $zero, 0x78
/* 88A8 800E80A8 001A0434 */  ori        $a0, $zero, 0x1A00
/* 88AC 800E80AC 53A8030C */  jal        func_800EA14C
/* 88B0 800E80B0 80000534 */   ori       $a1, $zero, 0x80
/* 88B4 800E80B4 0F80043C */  lui        $a0, %hi(D_800F4DF0)
/* 88B8 800E80B8 F04D8424 */  addiu      $a0, $a0, %lo(D_800F4DF0)
/* 88BC 800E80BC 0F80053C */  lui        $a1, %hi(D_800F05E0)
/* 88C0 800E80C0 E005A524 */  addiu      $a1, $a1, %lo(D_800F05E0)
/* 88C4 800E80C4 FB9F030C */  jal        func_800E7FEC
/* 88C8 800E80C8 00000000 */   nop
/* 88CC 800E80CC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 88D0 800E80D0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 88D4 800E80D4 00000000 */  nop
/* 88D8 800E80D8 1C00428C */  lw         $v0, 0x1C($v0)
/* 88DC 800E80DC 00000000 */  nop
/* 88E0 800E80E0 09F84000 */  jalr       $v0
/* 88E4 800E80E4 00000000 */   nop
/* 88E8 800E80E8 01000334 */  ori        $v1, $zero, 0x1
/* 88EC 800E80EC 09004314 */  bne        $v0, $v1, .L800E8114
/* 88F0 800E80F0 33130234 */   ori       $v0, $zero, 0x1333
/* 88F4 800E80F4 0F80013C */  lui        $at, %hi(D_800F4DE4)
/* 88F8 800E80F8 E44D22AC */  sw         $v0, %lo(D_800F4DE4)($at)
/* 88FC 800E80FC 0F80013C */  lui        $at, %hi(D_800F4DE8)
/* 8900 800E8100 E84D22AC */  sw         $v0, %lo(D_800F4DE8)($at)
/* 8904 800E8104 0100023C */  lui        $v0, (0x13330 >> 16)
/* 8908 800E8108 30334234 */  ori        $v0, $v0, (0x13330 & 0xFFFF)
/* 890C 800E810C 0F80013C */  lui        $at, %hi(D_800F4DEC)
/* 8910 800E8110 EC4D22AC */  sw         $v0, %lo(D_800F4DEC)($at)
.L800E8114:
/* 8914 800E8114 1000BF8F */  lw         $ra, 0x10($sp)
/* 8918 800E8118 00000000 */  nop
/* 891C 800E811C 0800E003 */  jr         $ra
/* 8920 800E8120 1800BD27 */   addiu     $sp, $sp, 0x18
