.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DA00
/* 6200 8001DA00 50DFBD27 */  addiu      $sp, $sp, -0x20B0
/* 6204 8001DA04 A820BFAF */  sw         $ra, 0x20A8($sp)
/* 6208 8001DA08 A420B3AF */  sw         $s3, 0x20A4($sp)
/* 620C 8001DA0C A020B2AF */  sw         $s2, 0x20A0($sp)
/* 6210 8001DA10 9C20B1AF */  sw         $s1, 0x209C($sp)
/* 6214 8001DA14 9820B0AF */  sw         $s0, 0x2098($sp)
/* 6218 8001DA18 21988000 */  addu       $s3, $a0, $zero
/* 621C 8001DA1C 1820B027 */  addiu      $s0, $sp, 0x2018
/* 6220 8001DA20 0580013C */  lui        $at, %hi(D_800548EC)
/* 6224 8001DA24 EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 6228 8001DA28 2120A000 */  addu       $a0, $a1, $zero
/* 622C 8001DA2C 1076000C */  jal        func_8001D840
/* 6230 8001DA30 21280002 */   addu      $a1, $s0, $zero
/* 6234 8001DA34 21884000 */  addu       $s1, $v0, $zero
/* 6238 8001DA38 2B002012 */  beqz       $s1, .L8001DAE8
/* 623C 8001DA3C 21100000 */   addu      $v0, $zero, $zero
/* 6240 8001DA40 AB75000C */  jal        func_8001D6AC
/* 6244 8001DA44 1000A427 */   addiu     $a0, $sp, 0x10
/* 6248 8001DA48 03004014 */  bnez       $v0, .L8001DA58
/* 624C 8001DA4C 00000000 */   nop
.L8001DA50:
/* 6250 8001DA50 BA760008 */  j          .L8001DAE8
/* 6254 8001DA54 21100000 */   addu      $v0, $zero, $zero
.L8001DA58:
/* 6258 8001DA58 2300201A */  blez       $s1, .L8001DAE8
/* 625C 8001DA5C 01000234 */   ori       $v0, $zero, 0x1
/* 6260 8001DA60 1800B227 */  addiu      $s2, $sp, 0x18
/* 6264 8001DA64 1000A427 */  addiu      $a0, $sp, 0x10
.L8001DA68:
/* 6268 8001DA68 21284002 */  addu       $a1, $s2, $zero
/* 626C 8001DA6C E075000C */  jal        func_8001D780
/* 6270 8001DA70 04000634 */   ori       $a2, $zero, 0x4
/* 6274 8001DA74 F6FF4010 */  beqz       $v0, .L8001DA50
/* 6278 8001DA78 21200002 */   addu      $a0, $s0, $zero
/* 627C 8001DA7C 21284002 */  addu       $a1, $s2, $zero
/* 6280 8001DA80 21304000 */  addu       $a2, $v0, $zero
/* 6284 8001DA84 2C76000C */  jal        func_8001D8B0
/* 6288 8001DA88 21386002 */   addu      $a3, $s3, $zero
/* 628C 8001DA8C 21304000 */  addu       $a2, $v0, $zero
/* 6290 8001DA90 0400638E */  lw         $v1, 0x4($s3)
/* 6294 8001DA94 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 6298 8001DA98 13006210 */  beq        $v1, $v0, .L8001DAE8
/* 629C 8001DA9C 21100000 */   addu      $v0, $zero, $zero
/* 62A0 8001DAA0 0300628A */  lwl        $v0, 0x3($s3)
/* 62A4 8001DAA4 0000629A */  lwr        $v0, 0x0($s3)
/* 62A8 8001DAA8 00000000 */  nop
/* 62AC 8001DAAC 1300A2AB */  swl        $v0, 0x13($sp)
/* 62B0 8001DAB0 1000A2BB */  swr        $v0, 0x10($sp)
/* 62B4 8001DAB4 01000234 */  ori        $v0, $zero, 0x1
/* 62B8 8001DAB8 03002212 */  beq        $s1, $v0, .L8001DAC8
/* 62BC 8001DABC 0200C230 */   andi      $v0, $a2, 0x2
/* 62C0 8001DAC0 09004010 */  beqz       $v0, .L8001DAE8
/* 62C4 8001DAC4 21100000 */   addu      $v0, $zero, $zero
.L8001DAC8:
/* 62C8 8001DAC8 00000292 */  lbu        $v0, 0x0($s0)
/* 62CC 8001DACC 00000000 */  nop
/* 62D0 8001DAD0 FDFF4014 */  bnez       $v0, .L8001DAC8
/* 62D4 8001DAD4 01001026 */   addiu     $s0, $s0, 0x1
/* 62D8 8001DAD8 FFFF3126 */  addiu      $s1, $s1, -0x1
/* 62DC 8001DADC E2FF201E */  bgtz       $s1, .L8001DA68
/* 62E0 8001DAE0 1000A427 */   addiu     $a0, $sp, 0x10
/* 62E4 8001DAE4 01000234 */  ori        $v0, $zero, 0x1
.L8001DAE8:
/* 62E8 8001DAE8 A820BF8F */  lw         $ra, 0x20A8($sp)
/* 62EC 8001DAEC A420B38F */  lw         $s3, 0x20A4($sp)
/* 62F0 8001DAF0 A020B28F */  lw         $s2, 0x20A0($sp)
/* 62F4 8001DAF4 9C20B18F */  lw         $s1, 0x209C($sp)
/* 62F8 8001DAF8 9820B08F */  lw         $s0, 0x2098($sp)
/* 62FC 8001DAFC 0800E003 */  jr         $ra
/* 6300 8001DB00 B020BD27 */   addiu     $sp, $sp, 0x20B0
