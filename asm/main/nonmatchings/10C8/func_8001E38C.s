.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E38C
/* 6B8C 8001E38C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6B90 8001E390 1000BFAF */  sw         $ra, 0x10($sp)
/* 6B94 8001E394 0280043C */  lui        $a0, %hi(func_8001E438)
/* 6B98 8001E398 38E48424 */  addiu      $a0, $a0, %lo(func_8001E438)
/* 6B9C 8001E39C 4266000C */  jal        func_80019908
/* 6BA0 8001E3A0 D0000534 */   ori       $a1, $zero, 0xD0
/* 6BA4 8001E3A4 0280043C */  lui        $a0, %hi(func_8001E5BC)
/* 6BA8 8001E3A8 BCE58424 */  addiu      $a0, $a0, %lo(func_8001E5BC)
/* 6BAC 8001E3AC 4266000C */  jal        func_80019908
/* 6BB0 8001E3B0 D1000534 */   ori       $a1, $zero, 0xD1
/* 6BB4 8001E3B4 0480013C */  lui        $at, %hi(D_80047F5C)
/* 6BB8 8001E3B8 5C7F20AC */  sw         $zero, %lo(D_80047F5C)($at)
/* 6BBC 8001E3BC 0480013C */  lui        $at, %hi(D_80047F64)
/* 6BC0 8001E3C0 647F20AC */  sw         $zero, %lo(D_80047F64)($at)
/* 6BC4 8001E3C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 6BC8 8001E3C8 00000000 */  nop
/* 6BCC 8001E3CC 0800E003 */  jr         $ra
/* 6BD0 8001E3D0 1800BD27 */   addiu     $sp, $sp, 0x18
