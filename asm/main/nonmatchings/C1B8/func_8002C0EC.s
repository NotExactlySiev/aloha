.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C0EC
/* 148EC 8002C0EC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 148F0 8002C0F0 1000BFAF */  sw         $ra, 0x10($sp)
/* 148F4 8002C0F4 47B0000C */  jal        func_8002C11C
/* 148F8 8002C0F8 00000000 */   nop
/* 148FC 8002C0FC 1000BF8F */  lw         $ra, 0x10($sp)
/* 14900 8002C100 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14904 8002C104 0800E003 */  jr         $ra
/* 14908 8002C108 00000000 */   nop
