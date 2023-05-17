.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001F9EC
/* 81EC 8001F9EC A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 81F0 8001F9F0 5400BFAF */  sw         $ra, 0x54($sp)
/* 81F4 8001F9F4 5000B0AF */  sw         $s0, 0x50($sp)
/* 81F8 8001F9F8 2140A000 */  addu       $t0, $a1, $zero
/* 81FC 8001F9FC 2148C000 */  addu       $t1, $a2, $zero
/* 8200 8001FA00 1F008A30 */  andi       $t2, $a0, 0x1F
/* 8204 8001FA04 00110A00 */  sll        $v0, $t2, 4
/* 8208 8001FA08 0580033C */  lui        $v1, %hi(D_80052060)
/* 820C 8001FA0C 60206324 */  addiu      $v1, $v1, %lo(D_80052060)
/* 8210 8001FA10 21384300 */  addu       $a3, $v0, $v1
/* 8214 8001FA14 0F00E290 */  lbu        $v0, 0xF($a3)
/* 8218 8001FA18 00000000 */  nop
/* 821C 8001FA1C 05004010 */  beqz       $v0, .L8001FA34
/* 8220 8001FA20 21808000 */   addu      $s0, $a0, $zero
/* 8224 8001FA24 0400E384 */  lh         $v1, 0x4($a3)
/* 8228 8001FA28 E07F8230 */  andi       $v0, $a0, 0x7FE0
/* 822C 8001FA2C 03006210 */  beq        $v1, $v0, .L8001FA3C
/* 8230 8001FA30 00140500 */   sll       $v0, $a1, 16
.L8001FA34:
/* 8234 8001FA34 CA7E0008 */  j          .L8001FB28
/* 8238 8001FA38 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001FA3C:
/* 823C 8001FA3C 03004104 */  bgez       $v0, .L8001FA4C
/* 8240 8001FA40 00140800 */   sll       $v0, $t0, 16
/* 8244 8001FA44 21400000 */  addu       $t0, $zero, $zero
/* 8248 8001FA48 00140800 */  sll        $v0, $t0, 16
.L8001FA4C:
/* 824C 8001FA4C 03140200 */  sra        $v0, $v0, 16
/* 8250 8001FA50 7F004228 */  slti       $v0, $v0, 0x7F
/* 8254 8001FA54 02004014 */  bnez       $v0, .L8001FA60
/* 8258 8001FA58 00140600 */   sll       $v0, $a2, 16
/* 825C 8001FA5C 7E000834 */  ori        $t0, $zero, 0x7E
.L8001FA60:
/* 8260 8001FA60 03140200 */  sra        $v0, $v0, 16
/* 8264 8001FA64 80004228 */  slti       $v0, $v0, 0x80
/* 8268 8001FA68 03004014 */  bnez       $v0, .L8001FA78
/* 826C 8001FA6C 00140900 */   sll       $v0, $t1, 16
/* 8270 8001FA70 7F000934 */  ori        $t1, $zero, 0x7F
/* 8274 8001FA74 00140900 */  sll        $v0, $t1, 16
.L8001FA78:
/* 8278 8001FA78 03140200 */  sra        $v0, $v0, 16
/* 827C 8001FA7C 81FF4228 */  slti       $v0, $v0, -0x7F
/* 8280 8001FA80 02004010 */  beqz       $v0, .L8001FA8C
/* 8284 8001FA84 00240800 */   sll       $a0, $t0, 16
/* 8288 8001FA88 81FF0924 */  addiu      $t1, $zero, -0x7F
.L8001FA8C:
/* 828C 8001FA8C 0800E9A4 */  sh         $t1, 0x8($a3)
/* 8290 8001FA90 0A00E8A4 */  sh         $t0, 0xA($a3)
/* 8294 8001FA94 01000234 */  ori        $v0, $zero, 0x1
/* 8298 8001FA98 04104201 */  sllv       $v0, $v0, $t2
/* 829C 8001FA9C 1000A2AF */  sw         $v0, 0x10($sp)
/* 82A0 8001FAA0 03000234 */  ori        $v0, $zero, 0x3
/* 82A4 8001FAA4 1400A2AF */  sw         $v0, 0x14($sp)
/* 82A8 8001FAA8 031C0400 */  sra        $v1, $a0, 16
/* 82AC 8001FAAC 3F006228 */  slti       $v0, $v1, 0x3F
/* 82B0 8001FAB0 02004014 */  bnez       $v0, .L8001FABC
/* 82B4 8001FAB4 03140400 */   sra       $v0, $a0, 16
/* 82B8 8001FAB8 3E000334 */  ori        $v1, $zero, 0x3E
.L8001FABC:
/* 82BC 8001FABC 3E004228 */  slti       $v0, $v0, 0x3E
/* 82C0 8001FAC0 04004014 */  bnez       $v0, .L8001FAD4
/* 82C4 8001FAC4 21286000 */   addu      $a1, $v1, $zero
/* 82C8 8001FAC8 7E000234 */  ori        $v0, $zero, 0x7E
/* 82CC 8001FACC B67E0008 */  j          .L8001FAD8
/* 82D0 8001FAD0 23104800 */   subu      $v0, $v0, $t0
.L8001FAD4:
/* 82D4 8001FAD4 3E000234 */  ori        $v0, $zero, 0x3E
.L8001FAD8:
/* 82D8 8001FAD8 00140200 */  sll        $v0, $v0, 16
/* 82DC 8001FADC 03140200 */  sra        $v0, $v0, 16
/* 82E0 8001FAE0 001C0900 */  sll        $v1, $t1, 16
/* 82E4 8001FAE4 031C0300 */  sra        $v1, $v1, 16
/* 82E8 8001FAE8 18004300 */  mult       $v0, $v1
/* 82EC 8001FAEC 12200000 */  mflo       $a0
/* 82F0 8001FAF0 00000000 */  nop
/* 82F4 8001FAF4 00140500 */  sll        $v0, $a1, 16
/* 82F8 8001FAF8 03140200 */  sra        $v0, $v0, 16
/* 82FC 8001FAFC 18004300 */  mult       $v0, $v1
/* 8300 8001FB00 12100000 */  mflo       $v0
/* 8304 8001FB04 00000000 */  nop
/* 8308 8001FB08 40200400 */  sll        $a0, $a0, 1
/* 830C 8001FB0C 1800A4A7 */  sh         $a0, 0x18($sp)
/* 8310 8001FB10 1000A427 */  addiu      $a0, $sp, 0x10
/* 8314 8001FB14 40100200 */  sll        $v0, $v0, 1
/* 8318 8001FB18 3378000C */  jal        func_8001E0CC
/* 831C 8001FB1C 1A00A2A7 */   sh        $v0, 0x1A($sp)
/* 8320 8001FB20 00141000 */  sll        $v0, $s0, 16
/* 8324 8001FB24 03140200 */  sra        $v0, $v0, 16
.L8001FB28:
/* 8328 8001FB28 5400BF8F */  lw         $ra, 0x54($sp)
/* 832C 8001FB2C 5000B08F */  lw         $s0, 0x50($sp)
/* 8330 8001FB30 0800E003 */  jr         $ra
/* 8334 8001FB34 5800BD27 */   addiu     $sp, $sp, 0x58
