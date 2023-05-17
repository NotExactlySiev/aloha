.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001B020
/* 3820 8001B020 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 3824 8001B024 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3828 8001B028 1800B2AF */  sw         $s2, 0x18($sp)
/* 382C 8001B02C 1400B1AF */  sw         $s1, 0x14($sp)
/* 3830 8001B030 1000B0AF */  sw         $s0, 0x10($sp)
/* 3834 8001B034 2188A000 */  addu       $s1, $a1, $zero
/* 3838 8001B038 2190C000 */  addu       $s2, $a2, $zero
/* 383C 8001B03C 0480023C */  lui        $v0, %hi(D_80047EF4)
/* 3840 8001B040 F47E428C */  lw         $v0, %lo(D_80047EF4)($v0)
/* 3844 8001B044 00000000 */  nop
/* 3848 8001B048 0B004014 */  bnez       $v0, .L8001B078
/* 384C 8001B04C 21808000 */   addu      $s0, $a0, $zero
/* 3850 8001B050 186C0008 */  j          .L8001B060
/* 3854 8001B054 00000000 */   nop
.L8001B058:
/* 3858 8001B058 286C000C */  jal        func_8001B0A0
/* 385C 8001B05C 00000000 */   nop
.L8001B060:
/* 3860 8001B060 0480023C */  lui        $v0, %hi(D_80047F3C)
/* 3864 8001B064 3C7F4294 */  lhu        $v0, %lo(D_80047F3C)($v0)
/* 3868 8001B068 00000000 */  nop
/* 386C 8001B06C C100422C */  sltiu      $v0, $v0, 0xC1
/* 3870 8001B070 F9FF4010 */  beqz       $v0, .L8001B058
/* 3874 8001B074 00000000 */   nop
.L8001B078:
/* 3878 8001B078 FF000432 */  andi       $a0, $s0, 0xFF
/* 387C 8001B07C 21282002 */  addu       $a1, $s1, $zero
/* 3880 8001B080 CA6B000C */  jal        func_8001AF28
/* 3884 8001B084 21304002 */   addu      $a2, $s2, $zero
/* 3888 8001B088 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 388C 8001B08C 1800B28F */  lw         $s2, 0x18($sp)
/* 3890 8001B090 1400B18F */  lw         $s1, 0x14($sp)
/* 3894 8001B094 1000B08F */  lw         $s0, 0x10($sp)
/* 3898 8001B098 0800E003 */  jr         $ra
/* 389C 8001B09C 2000BD27 */   addiu     $sp, $sp, 0x20
