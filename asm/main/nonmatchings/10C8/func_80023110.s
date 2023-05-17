.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80023110
/* B910 80023110 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B914 80023114 1400BFAF */  sw         $ra, 0x14($sp)
/* B918 80023118 1000B0AF */  sw         $s0, 0x10($sp)
/* B91C 8002311C 468F000C */  jal        func_80023D18
/* B920 80023120 21808000 */   addu      $s0, $a0, $zero
/* B924 80023124 21200002 */  addu       $a0, $s0, $zero
/* B928 80023128 3F000534 */  ori        $a1, $zero, 0x3F
/* B92C 8002312C 328F000C */  jal        func_80023CC8
/* B930 80023130 21300000 */   addu      $a2, $zero, $zero
/* B934 80023134 1400BF8F */  lw         $ra, 0x14($sp)
/* B938 80023138 1000B08F */  lw         $s0, 0x10($sp)
/* B93C 8002313C 0800E003 */  jr         $ra
/* B940 80023140 1800BD27 */   addiu     $sp, $sp, 0x18
