.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BC34
/* 14434 8002BC34 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14438 8002BC38 1000BFAF */  sw         $ra, 0x10($sp)
/* 1443C 8002BC3C 728E000C */  jal        func_800239C8
/* 14440 8002BC40 00000000 */   nop
/* 14444 8002BC44 0480043C */  lui        $a0, %hi(D_8004734C)
/* 14448 8002BC48 4C738424 */  addiu      $a0, $a0, %lo(D_8004734C)
/* 1444C 8002BC4C 27AF000C */  jal        func_8002BC9C
/* 14450 8002BC50 19000534 */   ori       $a1, $zero, 0x19
/* 14454 8002BC54 0480023C */  lui        $v0, %hi(D_800473B0)
/* 14458 8002BC58 B073428C */  lw         $v0, %lo(D_800473B0)($v0)
/* 1445C 8002BC5C 0480033C */  lui        $v1, %hi(D_800473B4)
/* 14460 8002BC60 B473638C */  lw         $v1, %lo(D_800473B4)($v1)
/* 14464 8002BC64 000040A4 */  sh         $zero, 0x0($v0)
/* 14468 8002BC68 00004294 */  lhu        $v0, 0x0($v0)
/* 1446C 8002BC6C 00000000 */  nop
/* 14470 8002BC70 000062A4 */  sh         $v0, 0x0($v1)
/* 14474 8002BC74 77B0000C */  jal        func_8002C1DC
/* 14478 8002BC78 00000000 */   nop
/* 1447C 8002BC7C 5FAF000C */  jal        func_8002BD7C
/* 14480 8002BC80 00000000 */   nop
/* 14484 8002BC84 068F000C */  jal        func_80023C18
/* 14488 8002BC88 00000000 */   nop
/* 1448C 8002BC8C 1000BF8F */  lw         $ra, 0x10($sp)
/* 14490 8002BC90 1800BD27 */  addiu      $sp, $sp, 0x18
/* 14494 8002BC94 0800E003 */  jr         $ra
/* 14498 8002BC98 00000000 */   nop
