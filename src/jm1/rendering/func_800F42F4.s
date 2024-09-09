.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800F42F4
/* 44AF4 800F42F4 FCFFBD27 */  addiu      $sp, $sp, -0x4
/* 44AF8 800F42F8 0000BFAF */  sw         $ra, 0x0($sp)
/* 44AFC 800F42FC 0F80023C */  lui        $v0, %hi(func_800F68B0)
/* 44B00 800F4300 B0684224 */  addiu      $v0, $v0, %lo(func_800F68B0)
/* 44B04 800F4304 040044A4 */  sh         $a0, 0x4($v0)
/* 44B08 800F4308 02240400 */  srl        $a0, $a0, 16
/* 44B0C 800F430C 000044A4 */  sh         $a0, 0x0($v0)
/* 44B10 800F4310 21204000 */  addu       $a0, $v0, $zero
/* 44B14 800F4314 C79D030C */  jal        func_800E771C
/* 44B18 800F4318 00000000 */   nop
/* 44B1C 800F431C 04008424 */  addiu      $a0, $a0, 0x4
/* 44B20 800F4320 C79D030C */  jal        func_800E771C
/* 44B24 800F4324 00000000 */   nop
/* 44B28 800F4328 0000BF8F */  lw         $ra, 0x0($sp)
/* 44B2C 800F432C 0400BD27 */  addiu      $sp, $sp, 0x4
/* 44B30 800F4330 0800E003 */  jr         $ra
/* 44B34 800F4334 00000000 */   nop
