.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C39C
/* 4B9C 8001C39C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 4BA0 8001C3A0 2000BFAF */  sw         $ra, 0x20($sp)
/* 4BA4 8001C3A4 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 4BA8 8001C3A8 1800B0AF */  sw         $s0, 0x18($sp)
/* 4BAC 8001C3AC 0480113C */  lui        $s1, %hi(D_80047D88)
/* 4BB0 8001C3B0 887D318E */  lw         $s1, %lo(D_80047D88)($s1)
/* 4BB4 8001C3B4 21808000 */  addu       $s0, $a0, $zero
/* 4BB8 8001C3B8 0480013C */  lui        $at, %hi(D_80047D88)
/* 4BBC 8001C3BC 887D30AC */  sw         $s0, %lo(D_80047D88)($at)
/* 4BC0 8001C3C0 376E000C */  jal        func_8001B8DC
/* 4BC4 8001C3C4 00000000 */   nop
/* 4BC8 8001C3C8 07000016 */  bnez       $s0, .L8001C3E8
/* 4BCC 8001C3CC 5B000234 */   ori       $v0, $zero, 0x5B
/* 4BD0 8001C3D0 80000234 */  ori        $v0, $zero, 0x80
/* 4BD4 8001C3D4 1000A2A3 */  sb         $v0, 0x10($sp)
/* 4BD8 8001C3D8 1100A0A3 */  sb         $zero, 0x11($sp)
/* 4BDC 8001C3DC 1200A2A3 */  sb         $v0, 0x12($sp)
/* 4BE0 8001C3E0 FE700008 */  j          .L8001C3F8
/* 4BE4 8001C3E4 1300A0A3 */   sb        $zero, 0x13($sp)
.L8001C3E8:
/* 4BE8 8001C3E8 1000A2A3 */  sb         $v0, 0x10($sp)
/* 4BEC 8001C3EC 1100A2A3 */  sb         $v0, 0x11($sp)
/* 4BF0 8001C3F0 1200A2A3 */  sb         $v0, 0x12($sp)
/* 4BF4 8001C3F4 1300A2A3 */  sb         $v0, 0x13($sp)
.L8001C3F8:
/* 4BF8 8001C3F8 C668000C */  jal        func_8001A318
/* 4BFC 8001C3FC 1000A427 */   addiu     $a0, $sp, 0x10
/* 4C00 8001C400 21102002 */  addu       $v0, $s1, $zero
/* 4C04 8001C404 2000BF8F */  lw         $ra, 0x20($sp)
/* 4C08 8001C408 1C00B18F */  lw         $s1, 0x1C($sp)
/* 4C0C 8001C40C 1800B08F */  lw         $s0, 0x18($sp)
/* 4C10 8001C410 0800E003 */  jr         $ra
/* 4C14 8001C414 2800BD27 */   addiu     $sp, $sp, 0x28
