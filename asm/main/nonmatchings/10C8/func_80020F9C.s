.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020F9C
/* 979C 80020F9C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 97A0 80020FA0 1000BFAF */  sw         $ra, 0x10($sp)
/* 97A4 80020FA4 002C0500 */  sll        $a1, $a1, 16
/* 97A8 80020FA8 C577000C */  jal        func_8001DF14
/* 97AC 80020FAC 032C0500 */   sra       $a1, $a1, 16
/* 97B0 80020FB0 1000BF8F */  lw         $ra, 0x10($sp)
/* 97B4 80020FB4 00000000 */  nop
/* 97B8 80020FB8 0800E003 */  jr         $ra
/* 97BC 80020FBC 1800BD27 */   addiu     $sp, $sp, 0x18
