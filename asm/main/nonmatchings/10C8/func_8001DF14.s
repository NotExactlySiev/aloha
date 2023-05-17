.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DF14
/* 6714 8001DF14 D0FFBD27 */  addiu      $sp, $sp, -0x30
/* 6718 8001DF18 2C00BFAF */  sw         $ra, 0x2C($sp)
/* 671C 8001DF1C 2800B0AF */  sw         $s0, 0x28($sp)
/* 6720 8001DF20 21808000 */  addu       $s0, $a0, $zero
/* 6724 8001DF24 07000234 */  ori        $v0, $zero, 0x7
/* 6728 8001DF28 1000A2AF */  sw         $v0, 0x10($sp)
/* 672C 8001DF2C 1400B0AF */  sw         $s0, 0x14($sp)
/* 6730 8001DF30 1800A5A7 */  sh         $a1, 0x18($sp)
/* 6734 8001DF34 1A00A5A7 */  sh         $a1, 0x1A($sp)
/* 6738 8001DF38 61C4000C */  jal        func_80031184
/* 673C 8001DF3C 21200000 */   addu      $a0, $zero, $zero
/* 6740 8001DF40 ABB3000C */  jal        func_8002CEAC
/* 6744 8001DF44 1000A427 */   addiu     $a0, $sp, 0x10
/* 6748 8001DF48 61C4000C */  jal        func_80031184
/* 674C 8001DF4C 21200000 */   addu      $a0, $zero, $zero
/* 6750 8001DF50 27C4000C */  jal        func_8003109C
/* 6754 8001DF54 1000A427 */   addiu     $a0, $sp, 0x10
/* 6758 8001DF58 61C4000C */  jal        func_80031184
/* 675C 8001DF5C 21200000 */   addu      $a0, $zero, $zero
/* 6760 8001DF60 A5C3000C */  jal        func_80030E94
/* 6764 8001DF64 21200002 */   addu      $a0, $s0, $zero
/* 6768 8001DF68 2C00BF8F */  lw         $ra, 0x2C($sp)
/* 676C 8001DF6C 2800B08F */  lw         $s0, 0x28($sp)
/* 6770 8001DF70 0800E003 */  jr         $ra
/* 6774 8001DF74 3000BD27 */   addiu     $sp, $sp, 0x30
