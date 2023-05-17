.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002EAFC
/* 172FC 8002EAFC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 17300 8002EB00 1000BFAF */  sw         $ra, 0x10($sp)
/* 17304 8002EB04 0380043C */  lui        $a0, %hi(func_8002EF00)
/* 17308 8002EB08 00EF8424 */  addiu      $a0, $a0, %lo(func_8002EF00)
/* 1730C 8002EB0C 5EC2000C */  jal        func_80030978
/* 17310 8002EB10 00000000 */   nop
/* 17314 8002EB14 03000234 */  ori        $v0, $zero, 0x3
/* 17318 8002EB18 1000BF8F */  lw         $ra, 0x10($sp)
/* 1731C 8002EB1C 1800BD27 */  addiu      $sp, $sp, 0x18
/* 17320 8002EB20 0800E003 */  jr         $ra
/* 17324 8002EB24 00000000 */   nop
