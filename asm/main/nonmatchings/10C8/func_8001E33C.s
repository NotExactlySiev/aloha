.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E33C
/* 6B3C 8001E33C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B40 8001E340 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B44 8001E344 17B0000C */  jal        func_8002C05C
/* 6B48 8001E348 21200000 */   addu      $a0, $zero, $zero
/* 6B4C 8001E34C 0280043C */  lui        $a0, %hi(func_8001E36C)
/* 6B50 8001E350 6CE38424 */  addiu      $a0, $a0, %lo(func_8001E36C)
/* 6B54 8001E354 4266000C */  jal        func_80019908
/* 6B58 8001E358 F0000534 */   ori       $a1, $zero, 0xF0
/* 6B5C 8001E35C 1000BF8F */  lw         $ra, 0x10($sp)
/* 6B60 8001E360 00000000 */  nop
/* 6B64 8001E364 0800E003 */  jr         $ra
/* 6B68 8001E368 1800BD27 */   addiu     $sp, $sp, 0x18
