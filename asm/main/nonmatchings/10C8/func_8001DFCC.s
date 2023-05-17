.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DFCC
/* 67CC 8001DFCC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 67D0 8001DFD0 1000BFAF */  sw         $ra, 0x10($sp)
/* 67D4 8001DFD4 3CB8000C */  jal        func_8002E0F0
/* 67D8 8001DFD8 00000000 */   nop
/* 67DC 8001DFDC 1000BF8F */  lw         $ra, 0x10($sp)
/* 67E0 8001DFE0 00000000 */  nop
/* 67E4 8001DFE4 0800E003 */  jr         $ra
/* 67E8 8001DFE8 1800BD27 */   addiu     $sp, $sp, 0x18
