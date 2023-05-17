.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CEC8
/* 56C8 8001CEC8 0480023C */  lui        $v0, %hi(D_80047F54)
/* 56CC 8001CECC 547F428C */  lw         $v0, %lo(D_80047F54)($v0)
/* 56D0 8001CED0 00000000 */  nop
/* 56D4 8001CED4 0C004014 */  bnez       $v0, .L8001CF08
/* 56D8 8001CED8 00000000 */   nop
/* 56DC 8001CEDC 0480023C */  lui        $v0, %hi(D_80047DEC)
/* 56E0 8001CEE0 EC7D428C */  lw         $v0, %lo(D_80047DEC)($v0)
/* 56E4 8001CEE4 00000000 */  nop
/* 56E8 8001CEE8 07004014 */  bnez       $v0, .L8001CF08
/* 56EC 8001CEEC 00000000 */   nop
/* 56F0 8001CEF0 0480023C */  lui        $v0, %hi(D_80047F44)
/* 56F4 8001CEF4 447F428C */  lw         $v0, %lo(D_80047F44)($v0)
/* 56F8 8001CEF8 00000000 */  nop
/* 56FC 8001CEFC 01004224 */  addiu      $v0, $v0, 0x1
/* 5700 8001CF00 0480013C */  lui        $at, %hi(D_80047F44)
/* 5704 8001CF04 447F22AC */  sw         $v0, %lo(D_80047F44)($at)
.L8001CF08:
/* 5708 8001CF08 0480033C */  lui        $v1, %hi(D_80047F44)
/* 570C 8001CF0C 447F638C */  lw         $v1, %lo(D_80047F44)($v1)
/* 5710 8001CF10 0480023C */  lui        $v0, %hi(D_80047F4C)
/* 5714 8001CF14 4C7F428C */  lw         $v0, %lo(D_80047F4C)($v0)
/* 5718 8001CF18 00000000 */  nop
/* 571C 8001CF1C 2B104300 */  sltu       $v0, $v0, $v1
/* 5720 8001CF20 03004010 */  beqz       $v0, .L8001CF30
/* 5724 8001CF24 01000234 */   ori       $v0, $zero, 0x1
/* 5728 8001CF28 0480013C */  lui        $at, %hi(D_80047F54)
/* 572C 8001CF2C 547F22AC */  sw         $v0, %lo(D_80047F54)($at)
.L8001CF30:
/* 5730 8001CF30 0800E003 */  jr         $ra
/* 5734 8001CF34 00000000 */   nop
