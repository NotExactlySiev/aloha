.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A380
/* 2B80 8001A380 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2B84 8001A384 1000BFAF */  sw         $ra, 0x10($sp)
/* 2B88 8001A388 0280043C */  lui        $a0, %hi(func_80019FB8)
/* 2B8C 8001A38C B89F8424 */  addiu      $a0, $a0, %lo(func_80019FB8)
/* 2B90 8001A390 B9A0000C */  jal        func_800282E4
/* 2B94 8001A394 00000000 */   nop
/* 2B98 8001A398 0280043C */  lui        $a0, %hi(func_8001A370)
/* 2B9C 8001A39C 70A38424 */  addiu      $a0, $a0, %lo(func_8001A370)
/* 2BA0 8001A3A0 BFA0000C */  jal        func_800282FC
/* 2BA4 8001A3A4 00000000 */   nop
/* 2BA8 8001A3A8 1000BF8F */  lw         $ra, 0x10($sp)
/* 2BAC 8001A3AC 00000000 */  nop
/* 2BB0 8001A3B0 0800E003 */  jr         $ra
/* 2BB4 8001A3B4 1800BD27 */   addiu     $sp, $sp, 0x18
