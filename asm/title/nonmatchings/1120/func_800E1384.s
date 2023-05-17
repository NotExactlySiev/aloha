.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1384
/* 1B84 800E1384 1A80033C */  lui        $v1, %hi(D_801A0FA8)
/* 1B88 800E1388 A80F638C */  lw         $v1, %lo(D_801A0FA8)($v1)
/* 1B8C 800E138C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1B90 800E1390 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1B94 800E1394 01000234 */  ori        $v0, $zero, 0x1
/* 1B98 800E1398 1B006214 */  bne        $v1, $v0, .L800E1408
/* 1B9C 800E139C 1800B0AF */   sw        $s0, 0x18($sp)
/* 1BA0 800E13A0 1A80023C */  lui        $v0, %hi(D_801A0FB0)
/* 1BA4 800E13A4 B00F428C */  lw         $v0, %lo(D_801A0FB0)($v0)
/* 1BA8 800E13A8 00000000 */  nop
/* 1BAC 800E13AC 16004310 */  beq        $v0, $v1, .L800E1408
/* 1BB0 800E13B0 00110200 */   sll       $v0, $v0, 4
/* 1BB4 800E13B4 1000A0A7 */  sh         $zero, 0x10($sp)
/* 1BB8 800E13B8 20004224 */  addiu      $v0, $v0, 0x20
/* 1BBC 800E13BC 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1BC0 800E13C0 FF000234 */  ori        $v0, $zero, 0xFF
/* 1BC4 800E13C4 1400A2A7 */  sh         $v0, 0x14($sp)
/* 1BC8 800E13C8 10001034 */  ori        $s0, $zero, 0x10
/* 1BCC 800E13CC 1600B0A7 */  sh         $s0, 0x16($sp)
/* 1BD0 800E13D0 1000A427 */  addiu      $a0, $sp, 0x10
/* 1BD4 800E13D4 18000534 */  ori        $a1, $zero, 0x18
/* 1BD8 800E13D8 E49A030C */  jal        func_800E6B90
/* 1BDC 800E13DC 30000634 */   ori       $a2, $zero, 0x30
/* 1BE0 800E13E0 1000B0A7 */  sh         $s0, 0x10($sp)
/* 1BE4 800E13E4 24000234 */  ori        $v0, $zero, 0x24
/* 1BE8 800E13E8 1200A2A7 */  sh         $v0, 0x12($sp)
/* 1BEC 800E13EC 18010234 */  ori        $v0, $zero, 0x118
/* 1BF0 800E13F0 1400A2A7 */  sh         $v0, 0x14($sp)
/* 1BF4 800E13F4 28000234 */  ori        $v0, $zero, 0x28
/* 1BF8 800E13F8 1600A2A7 */  sh         $v0, 0x16($sp)
/* 1BFC 800E13FC 1000A427 */  addiu      $a0, $sp, 0x10
/* 1C00 800E1400 509A030C */  jal        func_800E6940
/* 1C04 800E1404 20000534 */   ori       $a1, $zero, 0x20
.L800E1408:
/* 1C08 800E1408 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1C0C 800E140C 1800B08F */  lw         $s0, 0x18($sp)
/* 1C10 800E1410 0800E003 */  jr         $ra
/* 1C14 800E1414 2000BD27 */   addiu     $sp, $sp, 0x20
