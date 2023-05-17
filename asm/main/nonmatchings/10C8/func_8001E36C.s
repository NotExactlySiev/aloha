.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E36C
/* 6B6C 8001E36C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B70 8001E370 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B74 8001E374 2FB0000C */  jal        func_8002C0BC
/* 6B78 8001E378 FFFF8430 */   andi      $a0, $a0, 0xFFFF
/* 6B7C 8001E37C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B80 8001E380 00000000 */  nop
/* 6B84 8001E384 0800E003 */  jr         $ra
/* 6B88 8001E388 1800BD27 */   addiu     $sp, $sp, 0x18
