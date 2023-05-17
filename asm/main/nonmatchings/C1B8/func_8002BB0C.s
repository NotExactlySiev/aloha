.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002BB0C
/* 1430C 8002BB0C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14310 8002BB10 1000B0AF */  sw         $s0, 0x10($sp)
/* 14314 8002BB14 21808000 */  addu       $s0, $a0, $zero
/* 14318 8002BB18 0480063C */  lui        $a2, %hi(D_80047350)
/* 1431C 8002BB1C 5073C624 */  addiu      $a2, $a2, %lo(D_80047350)
/* 14320 8002BB20 80101000 */  sll        $v0, $s0, 2
/* 14324 8002BB24 21204600 */  addu       $a0, $v0, $a2
/* 14328 8002BB28 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 1432C 8002BB2C 1800B2AF */  sw         $s2, 0x18($sp)
/* 14330 8002BB30 1400B1AF */  sw         $s1, 0x14($sp)
/* 14334 8002BB34 0000928C */  lw         $s2, 0x0($a0)
/* 14338 8002BB38 2188A000 */  addu       $s1, $a1, $zero
/* 1433C 8002BB3C 36003212 */  beq        $s1, $s2, .L8002BC18
/* 14340 8002BB40 21104002 */   addu      $v0, $s2, $zero
/* 14344 8002BB44 FCFFC294 */  lhu        $v0, -0x4($a2)
/* 14348 8002BB48 00000000 */  nop
/* 1434C 8002BB4C 32004010 */  beqz       $v0, .L8002BC18
/* 14350 8002BB50 21104002 */   addu      $v0, $s2, $zero
/* 14354 8002BB54 0480023C */  lui        $v0, %hi(D_800473B4)
/* 14358 8002BB58 B473428C */  lw         $v0, %lo(D_800473B4)($v0)
/* 1435C 8002BB5C 00000000 */  nop
/* 14360 8002BB60 00004394 */  lhu        $v1, 0x0($v0)
/* 14364 8002BB64 000040A4 */  sh         $zero, 0x0($v0)
/* 14368 8002BB68 0A002012 */  beqz       $s1, .L8002BB94
/* 1436C 8002BB6C FFFF6530 */   andi      $a1, $v1, 0xFFFF
/* 14370 8002BB70 01000234 */  ori        $v0, $zero, 0x1
/* 14374 8002BB74 04100202 */  sllv       $v0, $v0, $s0
/* 14378 8002BB78 000091AC */  sw         $s1, 0x0($a0)
/* 1437C 8002BB7C 2C00C38C */  lw         $v1, 0x2C($a2)
/* 14380 8002BB80 2528A200 */  or         $a1, $a1, $v0
/* 14384 8002BB84 25104300 */  or         $v0, $v0, $v1
/* 14388 8002BB88 2C00C2AC */  sw         $v0, 0x2C($a2)
/* 1438C 8002BB8C EFAE0008 */  j          .L8002BBBC
/* 14390 8002BB90 00000000 */   nop
.L8002BB94:
/* 14394 8002BB94 01000234 */  ori        $v0, $zero, 0x1
/* 14398 8002BB98 04100202 */  sllv       $v0, $v0, $s0
/* 1439C 8002BB9C 27100200 */  nor        $v0, $zero, $v0
/* 143A0 8002BBA0 000080AC */  sw         $zero, 0x0($a0)
/* 143A4 8002BBA4 0480033C */  lui        $v1, %hi(D_8004737C)
/* 143A8 8002BBA8 7C73638C */  lw         $v1, %lo(D_8004737C)($v1)
/* 143AC 8002BBAC 2428A200 */  and        $a1, $a1, $v0
/* 143B0 8002BBB0 24104300 */  and        $v0, $v0, $v1
/* 143B4 8002BBB4 0480013C */  lui        $at, %hi(D_8004737C)
/* 143B8 8002BBB8 7C7322AC */  sw         $v0, %lo(D_8004737C)($at)
.L8002BBBC:
/* 143BC 8002BBBC 0480023C */  lui        $v0, %hi(D_800473B4)
/* 143C0 8002BBC0 B473428C */  lw         $v0, %lo(D_800473B4)($v0)
/* 143C4 8002BBC4 00000000 */  nop
/* 143C8 8002BBC8 000045A4 */  sh         $a1, 0x0($v0)
/* 143CC 8002BBCC 04000234 */  ori        $v0, $zero, 0x4
/* 143D0 8002BBD0 05000216 */  bne        $s0, $v0, .L8002BBE8
/* 143D4 8002BBD4 05000234 */   ori       $v0, $zero, 0x5
/* 143D8 8002BBD8 21200000 */  addu       $a0, $zero, $zero
/* 143DC 8002BBDC 36AF000C */  jal        func_8002BCD8
/* 143E0 8002BBE0 0100252E */   sltiu     $a1, $s1, 0x1
/* 143E4 8002BBE4 05000234 */  ori        $v0, $zero, 0x5
.L8002BBE8:
/* 143E8 8002BBE8 05000216 */  bne        $s0, $v0, .L8002BC00
/* 143EC 8002BBEC 06000234 */   ori       $v0, $zero, 0x6
/* 143F0 8002BBF0 01000434 */  ori        $a0, $zero, 0x1
/* 143F4 8002BBF4 36AF000C */  jal        func_8002BCD8
/* 143F8 8002BBF8 0100252E */   sltiu     $a1, $s1, 0x1
/* 143FC 8002BBFC 06000234 */  ori        $v0, $zero, 0x6
.L8002BC00:
/* 14400 8002BC00 05000216 */  bne        $s0, $v0, .L8002BC18
/* 14404 8002BC04 21104002 */   addu      $v0, $s2, $zero
/* 14408 8002BC08 02000434 */  ori        $a0, $zero, 0x2
/* 1440C 8002BC0C 36AF000C */  jal        func_8002BCD8
/* 14410 8002BC10 0100252E */   sltiu     $a1, $s1, 0x1
/* 14414 8002BC14 21104002 */  addu       $v0, $s2, $zero
.L8002BC18:
/* 14418 8002BC18 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1441C 8002BC1C 1800B28F */  lw         $s2, 0x18($sp)
/* 14420 8002BC20 1400B18F */  lw         $s1, 0x14($sp)
/* 14424 8002BC24 1000B08F */  lw         $s0, 0x10($sp)
/* 14428 8002BC28 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1442C 8002BC2C 0800E003 */  jr         $ra
/* 14430 8002BC30 00000000 */   nop
