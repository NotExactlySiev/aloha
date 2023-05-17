.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020414
/* 8C14 80020414 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8C18 80020418 1000BFAF */  sw         $ra, 0x10($sp)
/* 8C1C 8002041C 768E000C */  jal        func_800239D8
/* 8C20 80020420 00000000 */   nop
/* 8C24 80020424 1000BF8F */  lw         $ra, 0x10($sp)
/* 8C28 80020428 00000000 */  nop
/* 8C2C 8002042C 0800E003 */  jr         $ra
/* 8C30 80020430 1800BD27 */   addiu     $sp, $sp, 0x18
