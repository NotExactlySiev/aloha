.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019680
/* 1E80 80019680 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1E84 80019684 1400BFAF */  sw         $ra, 0x14($sp)
/* 1E88 80019688 EE68000C */  jal        func_8001A3B8
/* 1E8C 8001968C 1000B0AF */   sw        $s0, 0x10($sp)
/* 1E90 80019690 7966000C */  jal        func_800199E4
/* 1E94 80019694 01001034 */   ori       $s0, $zero, 0x1
/* 1E98 80019698 7566000C */  jal        func_800199D4
/* 1E9C 8001969C 00000000 */   nop
/* 1EA0 800196A0 02004014 */  bnez       $v0, .L800196AC
/* 1EA4 800196A4 00000000 */   nop
/* 1EA8 800196A8 21800000 */  addu       $s0, $zero, $zero
.L800196AC:
/* 1EAC 800196AC E98A000C */  jal        func_80022BA4
/* 1EB0 800196B0 21200000 */   addu      $a0, $zero, $zero
/* 1EB4 800196B4 4FB0000C */  jal        func_8002C13C
/* 1EB8 800196B8 21200002 */   addu      $a0, $s0, $zero
/* 1EBC 800196BC E98A000C */  jal        func_80022BA4
/* 1EC0 800196C0 21200000 */   addu      $a0, $zero, $zero
/* 1EC4 800196C4 C08A000C */  jal        func_80022B00
/* 1EC8 800196C8 21200000 */   addu      $a0, $zero, $zero
/* 1ECC 800196CC F68A000C */  jal        func_80022BD8
/* 1ED0 800196D0 21200000 */   addu      $a0, $zero, $zero
/* 1ED4 800196D4 078B000C */  jal        func_80022C1C
/* 1ED8 800196D8 21200000 */   addu      $a0, $zero, $zero
/* 1EDC 800196DC 5F77000C */  jal        func_8001DD7C
/* 1EE0 800196E0 00000000 */   nop
/* 1EE4 800196E4 3C8B000C */  jal        func_80022CF0
/* 1EE8 800196E8 00000000 */   nop
/* 1EEC 800196EC AD62000C */  jal        func_80018AB4
/* 1EF0 800196F0 00000000 */   nop
/* 1EF4 800196F4 CF78000C */  jal        func_8001E33C
/* 1EF8 800196F8 00000000 */   nop
/* 1EFC 800196FC 4B82000C */  jal        func_8002092C
/* 1F00 80019700 00000000 */   nop
/* 1F04 80019704 5587000C */  jal        func_80021D54
/* 1F08 80019708 00000000 */   nop
/* 1F0C 8001970C EC79000C */  jal        func_8001E7B0
/* 1F10 80019710 00000000 */   nop
/* 1F14 80019714 E378000C */  jal        func_8001E38C
/* 1F18 80019718 00000000 */   nop
/* 1F1C 8001971C 1400BF8F */  lw         $ra, 0x14($sp)
/* 1F20 80019720 1000B08F */  lw         $s0, 0x10($sp)
/* 1F24 80019724 0800E003 */  jr         $ra
/* 1F28 80019728 1800BD27 */   addiu     $sp, $sp, 0x18
