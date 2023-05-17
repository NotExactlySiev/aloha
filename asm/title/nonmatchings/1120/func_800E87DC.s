.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E87DC
/* 8FDC 800E87DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8FE0 800E87E0 1400BFAF */  sw         $ra, 0x14($sp)
/* 8FE4 800E87E4 1000B0AF */  sw         $s0, 0x10($sp)
/* 8FE8 800E87E8 21800000 */  addu       $s0, $zero, $zero
.L800E87EC:
/* 8FEC 800E87EC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8FF0 800E87F0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8FF4 800E87F4 00221000 */  sll        $a0, $s0, 8
/* 8FF8 800E87F8 6C0C428C */  lw         $v0, 0xC6C($v0)
/* 8FFC 800E87FC 01000534 */  ori        $a1, $zero, 0x1
/* 9000 800E8800 09F84000 */  jalr       $v0
/* 9004 800E8804 01001026 */   addiu     $s0, $s0, 0x1
/* 9008 800E8808 5900022A */  slti       $v0, $s0, 0x59
/* 900C 800E880C F7FF4014 */  bnez       $v0, .L800E87EC
/* 9010 800E8810 00000000 */   nop
/* 9014 800E8814 39001034 */  ori        $s0, $zero, 0x39
.L800E8818:
/* 9018 800E8818 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 901C 800E881C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 9020 800E8820 00221000 */  sll        $a0, $s0, 8
/* 9024 800E8824 6C0C428C */  lw         $v0, 0xC6C($v0)
/* 9028 800E8828 21280000 */  addu       $a1, $zero, $zero
/* 902C 800E882C 09F84000 */  jalr       $v0
/* 9030 800E8830 01001026 */   addiu     $s0, $s0, 0x1
/* 9034 800E8834 5700022A */  slti       $v0, $s0, 0x57
/* 9038 800E8838 F7FF4014 */  bnez       $v0, .L800E8818
/* 903C 800E883C 001A0434 */   ori       $a0, $zero, 0x1A00
/* 9040 800E8840 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 9044 800E8844 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 9048 800E8848 00000000 */  nop
/* 904C 800E884C 6C0C428C */  lw         $v0, 0xC6C($v0)
/* 9050 800E8850 00000000 */  nop
/* 9054 800E8854 09F84000 */  jalr       $v0
/* 9058 800E8858 21280000 */   addu      $a1, $zero, $zero
/* 905C 800E885C 1400BF8F */  lw         $ra, 0x14($sp)
/* 9060 800E8860 1000B08F */  lw         $s0, 0x10($sp)
/* 9064 800E8864 0800E003 */  jr         $ra
/* 9068 800E8868 1800BD27 */   addiu     $sp, $sp, 0x18
