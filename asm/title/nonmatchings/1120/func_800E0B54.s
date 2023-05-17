.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0B54
/* 1354 800E0B54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1358 800E0B58 1400BFAF */  sw         $ra, 0x14($sp)
/* 135C 800E0B5C 1000B0AF */  sw         $s0, 0x10($sp)
/* 1360 800E0B60 00290234 */  ori        $v0, $zero, 0x2900
/* 1364 800E0B64 20008214 */  bne        $a0, $v0, .L800E0BE8
/* 1368 800E0B68 64001034 */   ori       $s0, $zero, 0x64
/* 136C 800E0B6C 0F80023C */  lui        $v0, %hi(D_800F4D00)
/* 1370 800E0B70 004D428C */  lw         $v0, %lo(D_800F4D00)($v0)
/* 1374 800E0B74 00000000 */  nop
/* 1378 800E0B78 09004004 */  bltz       $v0, .L800E0BA0
/* 137C 800E0B7C 00000000 */   nop
/* 1380 800E0B80 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1384 800E0B84 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1388 800E0B88 0F80043C */  lui        $a0, %hi(D_800F4CFC)
/* 138C 800E0B8C FC4C8494 */  lhu        $a0, %lo(D_800F4CFC)($a0)
/* 1390 800E0B90 680C428C */  lw         $v0, 0xC68($v0)
/* 1394 800E0B94 00000000 */  nop
/* 1398 800E0B98 09F84000 */  jalr       $v0
/* 139C 800E0B9C 00000000 */   nop
.L800E0BA0:
/* 13A0 800E0BA0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 13A4 800E0BA4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 13A8 800E0BA8 00290434 */  ori        $a0, $zero, 0x2900
/* 13AC 800E0BAC 440C428C */  lw         $v0, 0xC44($v0)
/* 13B0 800E0BB0 3E000534 */  ori        $a1, $zero, 0x3E
/* 13B4 800E0BB4 09F84000 */  jalr       $v0
/* 13B8 800E0BB8 21300002 */   addu      $a2, $s0, $zero
/* 13BC 800E0BBC 21184000 */  addu       $v1, $v0, $zero
/* 13C0 800E0BC0 0F80013C */  lui        $at, %hi(D_800F4CFC)
/* 13C4 800E0BC4 FC4C23A4 */  sh         $v1, %lo(D_800F4CFC)($at)
/* 13C8 800E0BC8 0F80023C */  lui        $v0, %hi(D_800F4CFC)
/* 13CC 800E0BCC FC4C4294 */  lhu        $v0, %lo(D_800F4CFC)($v0)
/* 13D0 800E0BD0 0F80013C */  lui        $at, %hi(D_800F4D00)
/* 13D4 800E0BD4 004D20AC */  sw         $zero, %lo(D_800F4D00)($at)
/* 13D8 800E0BD8 0F80013C */  lui        $at, %hi(D_800F4D04)
/* 13DC 800E0BDC 044D23A4 */  sh         $v1, %lo(D_800F4D04)($at)
/* 13E0 800E0BE0 05830308 */  j          .L800E0C14
/* 13E4 800E0BE4 00000000 */   nop
.L800E0BE8:
/* 13E8 800E0BE8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 13EC 800E0BEC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 13F0 800E0BF0 00000000 */  nop
/* 13F4 800E0BF4 440C428C */  lw         $v0, 0xC44($v0)
/* 13F8 800E0BF8 3E000534 */  ori        $a1, $zero, 0x3E
/* 13FC 800E0BFC 09F84000 */  jalr       $v0
/* 1400 800E0C00 21300002 */   addu      $a2, $s0, $zero
/* 1404 800E0C04 0F80013C */  lui        $at, %hi(D_800F4D04)
/* 1408 800E0C08 044D22A4 */  sh         $v0, %lo(D_800F4D04)($at)
/* 140C 800E0C0C 0F80023C */  lui        $v0, %hi(D_800F4D04)
/* 1410 800E0C10 044D4294 */  lhu        $v0, %lo(D_800F4D04)($v0)
.L800E0C14:
/* 1414 800E0C14 1400BF8F */  lw         $ra, 0x14($sp)
/* 1418 800E0C18 1000B08F */  lw         $s0, 0x10($sp)
/* 141C 800E0C1C 0800E003 */  jr         $ra
/* 1420 800E0C20 1800BD27 */   addiu     $sp, $sp, 0x18
