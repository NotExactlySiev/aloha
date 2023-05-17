.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A8A0
/* 30A0 8001A8A0 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 30A4 8001A8A4 0200A104 */  bgez       $a1, .L8001A8B0
/* 30A8 8001A8A8 3800BFAF */   sw        $ra, 0x38($sp)
/* 30AC 8001A8AC 21280000 */  addu       $a1, $zero, $zero
.L8001A8B0:
/* 30B0 8001A8B0 0104A228 */  slti       $v0, $a1, 0x401
/* 30B4 8001A8B4 02004014 */  bnez       $v0, .L8001A8C0
/* 30B8 8001A8B8 C0000234 */   ori       $v0, $zero, 0xC0
/* 30BC 8001A8BC 00040534 */  ori        $a1, $zero, 0x400
.L8001A8C0:
/* 30C0 8001A8C0 1000A2AF */  sw         $v0, 0x10($sp)
/* 30C4 8001A8C4 00008284 */  lh         $v0, 0x0($a0)
/* 30C8 8001A8C8 00000000 */  nop
/* 30CC 8001A8CC 18004500 */  mult       $v0, $a1
/* 30D0 8001A8D0 12100000 */  mflo       $v0
/* 30D4 8001A8D4 00000000 */  nop
/* 30D8 8001A8D8 00000000 */  nop
/* 30DC 8001A8DC 02004104 */  bgez       $v0, .L8001A8E8
/* 30E0 8001A8E0 00000000 */   nop
/* 30E4 8001A8E4 FF034224 */  addiu      $v0, $v0, 0x3FF
.L8001A8E8:
/* 30E8 8001A8E8 83120200 */  sra        $v0, $v0, 10
/* 30EC 8001A8EC 2000A2A7 */  sh         $v0, 0x20($sp)
/* 30F0 8001A8F0 02008284 */  lh         $v0, 0x2($a0)
/* 30F4 8001A8F4 00000000 */  nop
/* 30F8 8001A8F8 18004500 */  mult       $v0, $a1
/* 30FC 8001A8FC 12100000 */  mflo       $v0
/* 3100 8001A900 00000000 */  nop
/* 3104 8001A904 00000000 */  nop
/* 3108 8001A908 02004104 */  bgez       $v0, .L8001A914
/* 310C 8001A90C 00000000 */   nop
/* 3110 8001A910 FF034224 */  addiu      $v0, $v0, 0x3FF
.L8001A914:
/* 3114 8001A914 83120200 */  sra        $v0, $v0, 10
/* 3118 8001A918 2200A2A7 */  sh         $v0, 0x22($sp)
/* 311C 8001A91C C0C2000C */  jal        func_80030B00
/* 3120 8001A920 1000A427 */   addiu     $a0, $sp, 0x10
/* 3124 8001A924 3800BF8F */  lw         $ra, 0x38($sp)
/* 3128 8001A928 00000000 */  nop
/* 312C 8001A92C 0800E003 */  jr         $ra
/* 3130 8001A930 4000BD27 */   addiu     $sp, $sp, 0x40
