.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E22C
/* 6A2C 8001E22C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6A30 8001E230 1000BFAF */  sw         $ra, 0x10($sp)
/* 6A34 8001E234 21288000 */  addu       $a1, $a0, $zero
/* 6A38 8001E238 BCC5000C */  jal        func_800316F0
/* 6A3C 8001E23C 01000434 */   ori       $a0, $zero, 0x1
/* 6A40 8001E240 1000BF8F */  lw         $ra, 0x10($sp)
/* 6A44 8001E244 00000000 */  nop
/* 6A48 8001E248 0800E003 */  jr         $ra
/* 6A4C 8001E24C 1800BD27 */   addiu     $sp, $sp, 0x18
