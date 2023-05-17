.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DFAC
/* 67AC 8001DFAC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 67B0 8001DFB0 1000BFAF */  sw         $ra, 0x10($sp)
/* 67B4 8001DFB4 56B7000C */  jal        func_8002DD58
/* 67B8 8001DFB8 00000000 */   nop
/* 67BC 8001DFBC 1000BF8F */  lw         $ra, 0x10($sp)
/* 67C0 8001DFC0 00000000 */  nop
/* 67C4 8001DFC4 0800E003 */  jr         $ra
/* 67C8 8001DFC8 1800BD27 */   addiu     $sp, $sp, 0x18
