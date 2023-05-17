.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E0AC
/* 68AC 8001E0AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 68B0 8001E0B0 1000BFAF */  sw         $ra, 0x10($sp)
/* 68B4 8001E0B4 2AB1000C */  jal        func_8002C4A8
/* 68B8 8001E0B8 00000000 */   nop
/* 68BC 8001E0BC 1000BF8F */  lw         $ra, 0x10($sp)
/* 68C0 8001E0C0 00000000 */  nop
/* 68C4 8001E0C4 0800E003 */  jr         $ra
/* 68C8 8001E0C8 1800BD27 */   addiu     $sp, $sp, 0x18
