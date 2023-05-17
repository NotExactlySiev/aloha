.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1418
/* 1C18 800E1418 1A80033C */  lui        $v1, %hi(D_801A0FA8)
/* 1C1C 800E141C A80F638C */  lw         $v1, %lo(D_801A0FA8)($v1)
/* 1C20 800E1420 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1C24 800E1424 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1C28 800E1428 01000234 */  ori        $v0, $zero, 0x1
/* 1C2C 800E142C 19006214 */  bne        $v1, $v0, .L800E1494
/* 1C30 800E1430 1800B0AF */   sw        $s0, 0x18($sp)
/* 1C34 800E1434 1000A0A7 */  sh         $zero, 0x10($sp)
/* 1C38 800E1438 F0000234 */  ori        $v0, $zero, 0xF0
/* 1C3C 800E143C 1400A2A7 */  sh         $v0, 0x14($sp)
/* 1C40 800E1440 10001034 */  ori        $s0, $zero, 0x10
/* 1C44 800E1444 1600B0A7 */  sh         $s0, 0x16($sp)
/* 1C48 800E1448 1000A427 */  addiu      $a0, $sp, 0x10
/* 1C4C 800E144C 1A80023C */  lui        $v0, %hi(D_801A0FB0)
/* 1C50 800E1450 B00F428C */  lw         $v0, %lo(D_801A0FB0)($v0)
/* 1C54 800E1454 20000534 */  ori        $a1, $zero, 0x20
/* 1C58 800E1458 58000634 */  ori        $a2, $zero, 0x58
/* 1C5C 800E145C 00110200 */  sll        $v0, $v0, 4
/* 1C60 800E1460 20004224 */  addiu      $v0, $v0, 0x20
/* 1C64 800E1464 E49A030C */  jal        func_800E6B90
/* 1C68 800E1468 1200A2A7 */   sh        $v0, 0x12($sp)
/* 1C6C 800E146C 1000B0A7 */  sh         $s0, 0x10($sp)
/* 1C70 800E1470 4C000234 */  ori        $v0, $zero, 0x4C
/* 1C74 800E1474 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1C78 800E1478 18010234 */  ori        $v0, $zero, 0x118
/* 1C7C 800E147C 1400A2A7 */  sh         $v0, 0x14($sp)
/* 1C80 800E1480 28000234 */  ori        $v0, $zero, 0x28
/* 1C84 800E1484 1600A2A7 */  sh         $v0, 0x16($sp)
/* 1C88 800E1488 1000A427 */  addiu      $a0, $sp, 0x10
/* 1C8C 800E148C 509A030C */  jal        func_800E6940
/* 1C90 800E1490 20000534 */   ori       $a1, $zero, 0x20
.L800E1494:
/* 1C94 800E1494 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1C98 800E1498 1800B08F */  lw         $s0, 0x18($sp)
/* 1C9C 800E149C 0800E003 */  jr         $ra
/* 1CA0 800E14A0 2000BD27 */   addiu     $sp, $sp, 0x20
