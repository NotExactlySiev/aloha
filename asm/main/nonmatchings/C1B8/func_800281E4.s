.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800281E4
/* 109E4 800281E4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 109E8 800281E8 1000BFAF */  sw         $ra, 0x10($sp)
/* 109EC 800281EC 17A6000C */  jal        func_8002985C
/* 109F0 800281F0 00000000 */   nop
/* 109F4 800281F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 109F8 800281F8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 109FC 800281FC 0800E003 */  jr         $ra
/* 10A00 80028200 00000000 */   nop
