.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800202FC
/* 8AFC 800202FC 58FFBD27 */  addiu      $sp, $sp, -0xA8
/* 8B00 80020300 A400BFAF */  sw         $ra, 0xA4($sp)
/* 8B04 80020304 A000B4AF */  sw         $s4, 0xA0($sp)
/* 8B08 80020308 9C00B3AF */  sw         $s3, 0x9C($sp)
/* 8B0C 8002030C 9800B2AF */  sw         $s2, 0x98($sp)
/* 8B10 80020310 9400B1AF */  sw         $s1, 0x94($sp)
/* 8B14 80020314 9000B0AF */  sw         $s0, 0x90($sp)
/* 8B18 80020318 21A08000 */  addu       $s4, $a0, $zero
/* 8B1C 8002031C 2188A000 */  addu       $s1, $a1, $zero
/* 8B20 80020320 2198C000 */  addu       $s3, $a2, $zero
/* 8B24 80020324 C2111300 */  srl        $v0, $s3, 7
/* 8B28 80020328 C0810200 */  sll        $s0, $v0, 7
/* 8B2C 8002032C 05000012 */  beqz       $s0, .L80020344
/* 8B30 80020330 1000B227 */   addiu     $s2, $sp, 0x10
/* 8B34 80020334 FE8E000C */  jal         read
/* 8B38 80020338 21300002 */   addu      $a2, $s0, $zero
/* 8B3C 8002033C 13005014 */  bne        $v0, $s0, .L8002038C
/* 8B40 80020340 21883002 */   addu      $s1, $s1, $s0
.L80020344:
/* 8B44 80020344 7F007032 */  andi       $s0, $s3, 0x7F
/* 8B48 80020348 0F000012 */  beqz       $s0, .L80020388
/* 8B4C 8002034C 21208002 */   addu      $a0, $s4, $zero
/* 8B50 80020350 1000A527 */  addiu      $a1, $sp, 0x10
/* 8B54 80020354 FE8E000C */  jal         read
/* 8B58 80020358 80000634 */   ori       $a2, $zero, 0x80
/* 8B5C 8002035C 80000334 */  ori        $v1, $zero, 0x80
/* 8B60 80020360 0A004314 */  bne        $v0, $v1, .L8002038C
/* 8B64 80020364 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 8B68 80020368 0800001A */  blez       $s0, .L8002038C
/* 8B6C 8002036C 21106002 */   addu      $v0, $s3, $zero
.L80020370:
/* 8B70 80020370 00004292 */  lbu        $v0, 0x0($s2)
/* 8B74 80020374 01005226 */  addiu      $s2, $s2, 0x1
/* 8B78 80020378 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 8B7C 8002037C 000022A2 */  sb         $v0, 0x0($s1)
/* 8B80 80020380 FBFF001E */  bgtz       $s0, .L80020370
/* 8B84 80020384 01003126 */   addiu     $s1, $s1, 0x1
.L80020388:
/* 8B88 80020388 21106002 */  addu       $v0, $s3, $zero
.L8002038C:
/* 8B8C 8002038C A400BF8F */  lw         $ra, 0xA4($sp)
/* 8B90 80020390 A000B48F */  lw         $s4, 0xA0($sp)
/* 8B94 80020394 9C00B38F */  lw         $s3, 0x9C($sp)
/* 8B98 80020398 9800B28F */  lw         $s2, 0x98($sp)
/* 8B9C 8002039C 9400B18F */  lw         $s1, 0x94($sp)
/* 8BA0 800203A0 9000B08F */  lw         $s0, 0x90($sp)
/* 8BA4 800203A4 0800E003 */  jr         $ra
/* 8BA8 800203A8 A800BD27 */   addiu     $sp, $sp, 0xA8
