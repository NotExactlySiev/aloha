.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022C5C
/* B45C 80022C5C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B460 80022C60 1000BFAF */  sw         $ra, 0x10($sp)
/* B464 80022C64 2CA0000C */  jal        func_800280B0
/* B468 80022C68 00000000 */   nop
/* B46C 80022C6C 1000BF8F */  lw         $ra, 0x10($sp)
/* B470 80022C70 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* B474 80022C74 0800E003 */  jr         $ra
/* B478 80022C78 1800BD27 */   addiu     $sp, $sp, 0x18
