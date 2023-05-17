.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C418
/* 4C18 8001C418 D8FEBD27 */  addiu      $sp, $sp, -0x128
/* 4C1C 8001C41C 2001BFAF */  sw         $ra, 0x120($sp)
/* 4C20 8001C420 1C01B3AF */  sw         $s3, 0x11C($sp)
/* 4C24 8001C424 1801B2AF */  sw         $s2, 0x118($sp)
/* 4C28 8001C428 1401B1AF */  sw         $s1, 0x114($sp)
/* 4C2C 8001C42C 1001B0AF */  sw         $s0, 0x110($sp)
/* 4C30 8001C430 21988000 */  addu       $s3, $a0, $zero
/* 4C34 8001C434 0A001034 */  ori        $s0, $zero, 0xA
/* 4C38 8001C438 9000B227 */  addiu      $s2, $sp, 0x90
/* 4C3C 8001C43C 2120A000 */  addu       $a0, $a1, $zero
/* 4C40 8001C440 1000B127 */  addiu      $s1, $sp, 0x10
/* 4C44 8001C444 E78B000C */  jal        func_80022F9C
/* 4C48 8001C448 21282002 */   addu      $a1, $s1, $zero
/* 4C4C 8001C44C 1000A393 */  lbu        $v1, 0x10($sp)
/* 4C50 8001C450 5C000234 */  ori        $v0, $zero, 0x5C
/* 4C54 8001C454 04006210 */  beq        $v1, $v0, .L8001C468
/* 4C58 8001C458 21202002 */   addu      $a0, $s1, $zero
/* 4C5C 8001C45C 5C000234 */  ori        $v0, $zero, 0x5C
/* 4C60 8001C460 9000A2A3 */  sb         $v0, 0x90($sp)
/* 4C64 8001C464 9100B227 */  addiu      $s2, $sp, 0x91
.L8001C468:
/* 4C68 8001C468 D98B000C */  jal        func_80022F64
/* 4C6C 8001C46C 3B000534 */   ori       $a1, $zero, 0x3B
/* 4C70 8001C470 09004014 */  bnez       $v0, .L8001C498
/* 4C74 8001C474 21202002 */   addu      $a0, $s1, $zero
/* 4C78 8001C478 0480053C */  lui        $a1, %hi(D_80047D90)
/* 4C7C 8001C47C 907DA524 */  addiu      $a1, $a1, %lo(D_80047D90)
/* 4C80 8001C480 C58B000C */  jal        func_80022F14
/* 4C84 8001C484 21304002 */   addu      $a2, $s2, $zero
/* 4C88 8001C488 29710008 */  j          .L8001C4A4
/* 4C8C 8001C48C FFFF1026 */   addiu     $s0, $s0, -0x1
.L8001C490:
/* 4C90 8001C490 35710008 */  j          .L8001C4D4
/* 4C94 8001C494 01000234 */   ori       $v0, $zero, 0x1
.L8001C498:
/* 4C98 8001C498 BA8B000C */  jal        func_80022EE8
/* 4C9C 8001C49C 21284002 */   addu      $a1, $s2, $zero
/* 4CA0 8001C4A0 FFFF1026 */  addiu      $s0, $s0, -0x1
.L8001C4A4:
/* 4CA4 8001C4A4 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 4CA8 8001C4A8 0A000212 */  beq        $s0, $v0, .L8001C4D4
/* 4CAC 8001C4AC 21100000 */   addu      $v0, $zero, $zero
/* 4CB0 8001C4B0 FFFF1124 */  addiu      $s1, $zero, -0x1
/* 4CB4 8001C4B4 21206002 */  addu       $a0, $s3, $zero
.L8001C4B8:
/* 4CB8 8001C4B8 8076000C */  jal        func_8001DA00
/* 4CBC 8001C4BC 9000A527 */   addiu     $a1, $sp, 0x90
/* 4CC0 8001C4C0 F3FF4014 */  bnez       $v0, .L8001C490
/* 4CC4 8001C4C4 FFFF1026 */   addiu     $s0, $s0, -0x1
/* 4CC8 8001C4C8 FBFF1116 */  bne        $s0, $s1, .L8001C4B8
/* 4CCC 8001C4CC 21206002 */   addu      $a0, $s3, $zero
/* 4CD0 8001C4D0 21100000 */  addu       $v0, $zero, $zero
.L8001C4D4:
/* 4CD4 8001C4D4 2001BF8F */  lw         $ra, 0x120($sp)
/* 4CD8 8001C4D8 1C01B38F */  lw         $s3, 0x11C($sp)
/* 4CDC 8001C4DC 1801B28F */  lw         $s2, 0x118($sp)
/* 4CE0 8001C4E0 1401B18F */  lw         $s1, 0x114($sp)
/* 4CE4 8001C4E4 1001B08F */  lw         $s0, 0x110($sp)
/* 4CE8 8001C4E8 0800E003 */  jr         $ra
/* 4CEC 8001C4EC 2801BD27 */   addiu     $sp, $sp, 0x128
