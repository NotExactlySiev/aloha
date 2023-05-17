.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F5DC
/* 7DDC 8001F5DC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 7DE0 8001F5E0 1800BFAF */  sw         $ra, 0x18($sp)
/* 7DE4 8001F5E4 1000A0AF */  sw         $zero, 0x10($sp)
/* 7DE8 8001F5E8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 7DEC 8001F5EC 1400A2AF */  sw         $v0, 0x14($sp)
/* 7DF0 8001F5F0 3F000534 */  ori        $a1, $zero, 0x3F
/* 7DF4 8001F5F4 64000634 */  ori        $a2, $zero, 0x64
/* 7DF8 8001F5F8 937D000C */  jal        func_8001F64C
/* 7DFC 8001F5FC 21380000 */   addu      $a3, $zero, $zero
/* 7E00 8001F600 1800BF8F */  lw         $ra, 0x18($sp)
/* 7E04 8001F604 00000000 */  nop
/* 7E08 8001F608 0800E003 */  jr         $ra
/* 7E0C 8001F60C 2000BD27 */   addiu     $sp, $sp, 0x20
