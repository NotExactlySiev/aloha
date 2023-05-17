.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F918
/* 8118 8001F918 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 811C 8001F91C 1400BFAF */  sw         $ra, 0x14($sp)
/* 8120 8001F920 1000B0AF */  sw         $s0, 0x10($sp)
/* 8124 8001F924 21808000 */  addu       $s0, $a0, $zero
/* 8128 8001F928 00241000 */  sll        $a0, $s0, 16
/* 812C 8001F92C DE7E000C */  jal        func_8001FB78
/* 8130 8001F930 03240400 */   sra       $a0, $a0, 16
/* 8134 8001F934 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 8138 8001F938 04004310 */  beq        $v0, $v1, .L8001F94C
/* 813C 8001F93C 1F000232 */   andi      $v0, $s0, 0x1F
/* 8140 8001F940 01000434 */  ori        $a0, $zero, 0x1
/* 8144 8001F944 5E7D000C */  jal        func_8001F578
/* 8148 8001F948 04204400 */   sllv      $a0, $a0, $v0
.L8001F94C:
/* 814C 8001F94C 1400BF8F */  lw         $ra, 0x14($sp)
/* 8150 8001F950 1000B08F */  lw         $s0, 0x10($sp)
/* 8154 8001F954 0800E003 */  jr         $ra
/* 8158 8001F958 1800BD27 */   addiu     $sp, $sp, 0x18
