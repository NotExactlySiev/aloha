.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A77C
/* 2F7C 8001A77C E8F7BD27 */  addiu      $sp, $sp, -0x818
/* 2F80 8001A780 1408BFAF */  sw         $ra, 0x814($sp)
/* 2F84 8001A784 1008B0AF */  sw         $s0, 0x810($sp)
/* 2F88 8001A788 21200000 */  addu       $a0, $zero, $zero
/* 2F8C 8001A78C 81A0000C */  jal        func_80028204
/* 2F90 8001A790 21280000 */   addu      $a1, $zero, $zero
/* 2F94 8001A794 01001034 */  ori        $s0, $zero, 0x1
.L8001A798:
/* 2F98 8001A798 0480043C */  lui        $a0, %hi(D_80047EDC)
/* 2F9C 8001A79C DC7E8424 */  addiu      $a0, $a0, %lo(D_80047EDC)
/* 2FA0 8001A7A0 D268000C */  jal        func_8001A348
/* 2FA4 8001A7A4 00000000 */   nop
/* 2FA8 8001A7A8 FBFF5014 */  bne        $v0, $s0, .L8001A798
/* 2FAC 8001A7AC 00000000 */   nop
/* 2FB0 8001A7B0 0480023C */  lui        $v0, %hi(D_80047EDC)
/* 2FB4 8001A7B4 DC7E4290 */  lbu        $v0, %lo(D_80047EDC)($v0)
/* 2FB8 8001A7B8 00000000 */  nop
/* 2FBC 8001A7BC 10004230 */  andi       $v0, $v0, 0x10
/* 2FC0 8001A7C0 33004010 */  beqz       $v0, .L8001A890
/* 2FC4 8001A7C4 01001034 */   ori       $s0, $zero, 0x1
/* 2FC8 8001A7C8 046A0008 */  j          .L8001A810
/* 2FCC 8001A7CC 00000000 */   nop
.L8001A7D0:
/* 2FD0 8001A7D0 81A0000C */  jal        func_80028204
/* 2FD4 8001A7D4 21280000 */   addu      $a1, $zero, $zero
/* 2FD8 8001A7D8 21200000 */  addu       $a0, $zero, $zero
/* 2FDC 8001A7DC 0480063C */  lui        $a2, %hi(D_80047EDC)
/* 2FE0 8001A7E0 DC7EC624 */  addiu      $a2, $a2, %lo(D_80047EDC)
/* 2FE4 8001A7E4 C5A0000C */  jal        func_80028314
/* 2FE8 8001A7E8 21280000 */   addu      $a1, $zero, $zero
/* 2FEC 8001A7EC 21200000 */  addu       $a0, $zero, $zero
/* 2FF0 8001A7F0 81A0000C */  jal        func_80028204
/* 2FF4 8001A7F4 21280000 */   addu      $a1, $zero, $zero
.L8001A7F8:
/* 2FF8 8001A7F8 0480043C */  lui        $a0, %hi(D_80047EDC)
/* 2FFC 8001A7FC DC7E8424 */  addiu      $a0, $a0, %lo(D_80047EDC)
/* 3000 8001A800 D268000C */  jal        func_8001A348
/* 3004 8001A804 00000000 */   nop
/* 3008 8001A808 FBFF5014 */  bne        $v0, $s0, .L8001A7F8
/* 300C 8001A80C 00000000 */   nop
.L8001A810:
/* 3010 8001A810 0480023C */  lui        $v0, %hi(D_80047EDC)
/* 3014 8001A814 DC7E4290 */  lbu        $v0, %lo(D_80047EDC)($v0)
/* 3018 8001A818 00000000 */  nop
/* 301C 8001A81C 10004230 */  andi       $v0, $v0, 0x10
/* 3020 8001A820 EBFF4014 */  bnez       $v0, .L8001A7D0
/* 3024 8001A824 21200000 */   addu      $a0, $zero, $zero
/* 3028 8001A828 81A0000C */  jal        func_80028204
/* 302C 8001A82C 21280000 */   addu      $a1, $zero, $zero
.L8001A830:
/* 3030 8001A830 0480043C */  lui        $a0, %hi(D_80047EDC)
/* 3034 8001A834 DC7E8424 */  addiu      $a0, $a0, %lo(D_80047EDC)
/* 3038 8001A838 D268000C */  jal        func_8001A348
/* 303C 8001A83C 00000000 */   nop
/* 3040 8001A840 FBFF5014 */  bne        $v0, $s0, .L8001A830
/* 3044 8001A844 02000434 */   ori       $a0, $zero, 0x2
/* 3048 8001A848 0480053C */  lui        $a1, %hi(D_80047DAC)
/* 304C 8001A84C AC7DA524 */  addiu      $a1, $a1, %lo(D_80047DAC)
/* 3050 8001A850 C5A0000C */  jal        func_80028314
/* 3054 8001A854 21300000 */   addu      $a2, $zero, $zero
/* 3058 8001A858 01000434 */  ori        $a0, $zero, 0x1
/* 305C 8001A85C 1000A527 */  addiu      $a1, $sp, 0x10
/* 3060 8001A860 9C68000C */  jal        func_8001A270
/* 3064 8001A864 80000634 */   ori       $a2, $zero, 0x80
/* 3068 8001A868 21200000 */  addu       $a0, $zero, $zero
/* 306C 8001A86C B268000C */  jal        func_8001A2C8
/* 3070 8001A870 21280000 */   addu      $a1, $zero, $zero
/* 3074 8001A874 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 3078 8001A878 E5FF4310 */  beq        $v0, $v1, .L8001A810
/* 307C 8001A87C 00000000 */   nop
/* 3080 8001A880 0480013C */  lui        $at, %hi(D_80047EE4)
/* 3084 8001A884 E47E20AC */  sw         $zero, %lo(D_80047EE4)($at)
/* 3088 8001A888 0575000C */  jal        func_8001D414
/* 308C 8001A88C 00000000 */   nop
.L8001A890:
/* 3090 8001A890 1408BF8F */  lw         $ra, 0x814($sp)
/* 3094 8001A894 1008B08F */  lw         $s0, 0x810($sp)
/* 3098 8001A898 0800E003 */  jr         $ra
/* 309C 8001A89C 1808BD27 */   addiu     $sp, $sp, 0x818
