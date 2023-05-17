.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C40C
/* 14C0C 8002C40C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 14C10 8002C410 C02B0500 */  sll        $a1, $a1, 15
/* 14C14 8002C414 1000A5AF */  sw         $a1, 0x10($sp)
/* 14C18 8002C418 0480023C */  lui        $v0, %hi(D_800473F8)
/* 14C1C 8002C41C F873428C */  lw         $v0, %lo(D_800473F8)($v0)
/* 14C20 8002C420 00000000 */  nop
/* 14C24 8002C424 2A104400 */  slt        $v0, $v0, $a0
/* 14C28 8002C428 1B004010 */  beqz       $v0, .L8002C498
/* 14C2C 8002C42C 1800BFAF */   sw        $ra, 0x18($sp)
/* 14C30 8002C430 FFFF0324 */  addiu      $v1, $zero, -0x1
.L8002C434:
/* 14C34 8002C434 1000A28F */  lw         $v0, 0x10($sp)
/* 14C38 8002C438 00000000 */  nop
/* 14C3C 8002C43C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 14C40 8002C440 1000A2AF */  sw         $v0, 0x10($sp)
/* 14C44 8002C444 1000A28F */  lw         $v0, 0x10($sp)
/* 14C48 8002C448 00000000 */  nop
/* 14C4C 8002C44C 0C004314 */  bne        $v0, $v1, .L8002C480
/* 14C50 8002C450 00000000 */   nop
/* 14C54 8002C454 0280043C */  lui        $a0, %hi(D_800187C0)
/* 14C58 8002C458 C0878424 */  addiu      $a0, $a0, %lo(D_800187C0)
/* 14C5C 8002C45C 1E8F000C */  jal        k_printf
/* 14C60 8002C460 00000000 */   nop
/* 14C64 8002C464 EA8E000C */  jal        func_80023BA8
/* 14C68 8002C468 21200000 */   addu      $a0, $zero, $zero
/* 14C6C 8002C46C 03000434 */  ori        $a0, $zero, 0x3
/* 14C70 8002C470 36AF000C */  jal        func_8002BCD8
/* 14C74 8002C474 21280000 */   addu      $a1, $zero, $zero
/* 14C78 8002C478 26B10008 */  j          .L8002C498
/* 14C7C 8002C47C 00000000 */   nop
.L8002C480:
/* 14C80 8002C480 0480023C */  lui        $v0, %hi(D_800473F8)
/* 14C84 8002C484 F873428C */  lw         $v0, %lo(D_800473F8)($v0)
/* 14C88 8002C488 00000000 */  nop
/* 14C8C 8002C48C 2A104400 */  slt        $v0, $v0, $a0
/* 14C90 8002C490 E8FF4014 */  bnez       $v0, .L8002C434
/* 14C94 8002C494 00000000 */   nop
.L8002C498:
/* 14C98 8002C498 1800BF8F */  lw         $ra, 0x18($sp)
/* 14C9C 8002C49C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 14CA0 8002C4A0 0800E003 */  jr         $ra
/* 14CA4 8002C4A4 00000000 */   nop
