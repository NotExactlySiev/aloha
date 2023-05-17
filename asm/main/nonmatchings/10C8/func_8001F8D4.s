.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F8D4
/* 80D4 8001F8D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 80D8 8001F8D8 1400BFAF */  sw         $ra, 0x14($sp)
/* 80DC 8001F8DC 1000B0AF */  sw         $s0, 0x10($sp)
/* 80E0 8001F8E0 21808000 */  addu       $s0, $a0, $zero
/* 80E4 8001F8E4 00241000 */  sll        $a0, $s0, 16
/* 80E8 8001F8E8 DE7E000C */  jal        func_8001FB78
/* 80EC 8001F8EC 03240400 */   sra       $a0, $a0, 16
/* 80F0 8001F8F0 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 80F4 8001F8F4 04004310 */  beq        $v0, $v1, .L8001F908
/* 80F8 8001F8F8 1F000232 */   andi      $v0, $s0, 0x1F
/* 80FC 8001F8FC 01000434 */  ori        $a0, $zero, 0x1
/* 8100 8001F900 3C7D000C */  jal        func_8001F4F0
/* 8104 8001F904 04204400 */   sllv      $a0, $a0, $v0
.L8001F908:
/* 8108 8001F908 1400BF8F */  lw         $ra, 0x14($sp)
/* 810C 8001F90C 1000B08F */  lw         $s0, 0x10($sp)
/* 8110 8001F910 0800E003 */  jr         $ra
/* 8114 8001F914 1800BD27 */   addiu     $sp, $sp, 0x18
