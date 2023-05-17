.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020DC4
/* 95C4 80020DC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 95C8 80020DC8 1000BFAF */  sw         $ra, 0x10($sp)
/* 95CC 80020DCC 00240400 */  sll        $a0, $a0, 16
/* 95D0 80020DD0 EB7B000C */  jal        func_8001EFAC
/* 95D4 80020DD4 03240400 */   sra       $a0, $a0, 16
/* 95D8 80020DD8 1000BF8F */  lw         $ra, 0x10($sp)
/* 95DC 80020DDC 00000000 */  nop
/* 95E0 80020DE0 0800E003 */  jr         $ra
/* 95E4 80020DE4 1800BD27 */   addiu     $sp, $sp, 0x18
