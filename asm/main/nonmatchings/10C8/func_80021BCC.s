.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021BCC
/* A3CC 80021BCC C0FDBD27 */  addiu      $sp, $sp, -0x240
/* A3D0 80021BD0 3802BFAF */  sw         $ra, 0x238($sp)
/* A3D4 80021BD4 3402B5AF */  sw         $s5, 0x234($sp)
/* A3D8 80021BD8 3002B4AF */  sw         $s4, 0x230($sp)
/* A3DC 80021BDC 2C02B3AF */  sw         $s3, 0x22C($sp)
/* A3E0 80021BE0 2802B2AF */  sw         $s2, 0x228($sp)
/* A3E4 80021BE4 2402B1AF */  sw         $s1, 0x224($sp)
/* A3E8 80021BE8 2002B0AF */  sw         $s0, 0x220($sp)
/* A3EC 80021BEC 21888000 */  addu       $s1, $a0, $zero
/* A3F0 80021BF0 2190A000 */  addu       $s2, $a1, $zero
/* A3F4 80021BF4 21A0C000 */  addu       $s4, $a2, $zero
/* A3F8 80021BF8 0080000C */  jal        func_80020000
/* A3FC 80021BFC 21A8E000 */   addu      $s5, $a3, $zero
/* A400 80021C00 21804000 */  addu       $s0, $v0, $zero
/* A404 80021C04 01000234 */  ori        $v0, $zero, 0x1
/* A408 80021C08 36000216 */  bne        $s0, $v0, .L80021CE4
/* A40C 80021C0C 21100002 */   addu      $v0, $s0, $zero
/* A410 80021C10 21202002 */  addu       $a0, $s1, $zero
/* A414 80021C14 21284002 */  addu       $a1, $s2, $zero
/* A418 80021C18 00029326 */  addiu      $s3, $s4, 0x200
/* A41C 80021C1C 4780000C */  jal        func_8002011C
/* A420 80021C20 21306002 */   addu      $a2, $s3, $zero
/* A424 80021C24 08004010 */  beqz       $v0, .L80021C48
/* A428 80021C28 21202002 */   addu      $a0, $s1, $zero
/* A42C 80021C2C 21284002 */  addu       $a1, $s2, $zero
/* A430 80021C30 6880000C */  jal        func_800201A0
/* A434 80021C34 03800634 */   ori       $a2, $zero, 0x8003
/* A438 80021C38 21804000 */  addu       $s0, $v0, $zero
/* A43C 80021C3C FFFF022A */  slti       $v0, $s0, -0x1
/* A440 80021C40 03004010 */  beqz       $v0, .L80021C50
/* A444 80021C44 21200002 */   addu      $a0, $s0, $zero
.L80021C48:
/* A448 80021C48 39870008 */  j          .L80021CE4
/* A44C 80021C4C FDFF0224 */   addiu     $v0, $zero, -0x3
.L80021C50:
/* A450 80021C50 21280000 */  addu       $a1, $zero, $zero
/* A454 80021C54 0581000C */  jal        func_80020414
/* A458 80021C58 21300000 */   addu      $a2, $zero, $zero
/* A45C 80021C5C 0380023C */  lui        $v0, %hi(D_80032FDC)
/* A460 80021C60 DC2F4224 */  addiu      $v0, $v0, %lo(D_80032FDC)
/* A464 80021C64 1000A2AF */  sw         $v0, 0x10($sp)
/* A468 80021C68 0380023C */  lui        $v0, %hi(D_80032E5C)
/* A46C 80021C6C 5C2E4224 */  addiu      $v0, $v0, %lo(D_80032E5C)
/* A470 80021C70 1400A2AF */  sw         $v0, 0x14($sp)
/* A474 80021C74 0380023C */  lui        $v0, %hi(D_80032EDC)
/* A478 80021C78 DC2E4224 */  addiu      $v0, $v0, %lo(D_80032EDC)
/* A47C 80021C7C 1800A2AF */  sw         $v0, 0x18($sp)
/* A480 80021C80 0380023C */  lui        $v0, %hi(D_80032F5C)
/* A484 80021C84 5C2F4224 */  addiu      $v0, $v0, %lo(D_80032F5C)
/* A488 80021C88 1C00A2AF */  sw         $v0, 0x1C($sp)
/* A48C 80021C8C 2000A427 */  addiu      $a0, $sp, 0x20
/* A490 80021C90 13000534 */  ori        $a1, $zero, 0x13
/* A494 80021C94 21306002 */  addu       $a2, $s3, $zero
/* A498 80021C98 0D81000C */  jal        func_80020434
/* A49C 80021C9C 2138A002 */   addu      $a3, $s5, $zero
/* A4A0 80021CA0 21200002 */  addu       $a0, $s0, $zero
/* A4A4 80021CA4 2000A527 */  addiu      $a1, $sp, 0x20
/* A4A8 80021CA8 A880000C */  jal        func_800202A0
/* A4AC 80021CAC 00020634 */   ori       $a2, $zero, 0x200
.L80021CB0:
/* A4B0 80021CB0 177F000C */  jal        func_8001FC5C
/* A4B4 80021CB4 00000000 */   nop
/* A4B8 80021CB8 07004014 */  bnez       $v0, .L80021CD8
/* A4BC 80021CBC 00000000 */   nop
/* A4C0 80021CC0 286C000C */  jal        func_8001B0A0
/* A4C4 80021CC4 00000000 */   nop
/* A4C8 80021CC8 2C86000C */  jal        func_800218B0
/* A4CC 80021CCC 00000000 */   nop
/* A4D0 80021CD0 2C870008 */  j          .L80021CB0
/* A4D4 80021CD4 00000000 */   nop
.L80021CD8:
/* A4D8 80021CD8 8280000C */  jal        func_80020208
/* A4DC 80021CDC 21200002 */   addu      $a0, $s0, $zero
/* A4E0 80021CE0 21108002 */  addu       $v0, $s4, $zero
.L80021CE4:
/* A4E4 80021CE4 3802BF8F */  lw         $ra, 0x238($sp)
/* A4E8 80021CE8 3402B58F */  lw         $s5, 0x234($sp)
/* A4EC 80021CEC 3002B48F */  lw         $s4, 0x230($sp)
/* A4F0 80021CF0 2C02B38F */  lw         $s3, 0x22C($sp)
/* A4F4 80021CF4 2802B28F */  lw         $s2, 0x228($sp)
/* A4F8 80021CF8 2402B18F */  lw         $s1, 0x224($sp)
/* A4FC 80021CFC 2002B08F */  lw         $s0, 0x220($sp)
/* A500 80021D00 0800E003 */  jr         $ra
/* A504 80021D04 4002BD27 */   addiu     $sp, $sp, 0x240
