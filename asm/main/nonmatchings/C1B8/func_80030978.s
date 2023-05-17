.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80030978
/* 19178 80030978 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1917C 8003097C 1000BFAF */  sw         $ra, 0x10($sp)
/* 19180 80030980 21288000 */  addu       $a1, $a0, $zero
/* 19184 80030984 E0AD000C */  jal        func_8002B780
/* 19188 80030988 04000434 */   ori       $a0, $zero, 0x4
/* 1918C 8003098C 1000BF8F */  lw         $ra, 0x10($sp)
/* 19190 80030990 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19194 80030994 0800E003 */  jr         $ra
/* 19198 80030998 00000000 */   nop
