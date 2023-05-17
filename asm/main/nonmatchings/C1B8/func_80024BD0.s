.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024BD0
/* D3D0 80024BD0 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D3D4 80024BD4 E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D3D8 80024BD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* D3DC 80024BDC 1000B0AF */  sw         $s0, 0x10($sp)
/* D3E0 80024BE0 21808000 */  addu       $s0, $a0, $zero
/* D3E4 80024BE4 02004228 */  slti       $v0, $v0, 0x2
/* D3E8 80024BE8 08004014 */  bnez       $v0, .L80024C0C
/* D3EC 80024BEC 1400BFAF */   sw        $ra, 0x14($sp)
/* D3F0 80024BF0 0280043C */  lui        $a0, %hi(D_80018240)
/* D3F4 80024BF4 40828424 */  addiu      $a0, $a0, %lo(D_80018240)
/* D3F8 80024BF8 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D3FC 80024BFC DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D400 80024C00 00000000 */  nop
/* D404 80024C04 09F84000 */  jalr       $v0
/* D408 80024C08 21280002 */   addu      $a1, $s0, $zero
.L80024C0C:
/* D40C 80024C0C 03000232 */  andi       $v0, $s0, 0x3
/* D410 80024C10 14004014 */  bnez       $v0, .L80024C64
/* D414 80024C14 00000000 */   nop
/* D418 80024C18 C8AD000C */  jal        func_8002B720
/* D41C 80024C1C 00000000 */   nop
/* D420 80024C20 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D424 80024C24 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D428 80024C28 00000000 */  nop
/* D42C 80024C2C 3400428C */  lw         $v0, 0x34($v0)
/* D430 80024C30 00000000 */  nop
/* D434 80024C34 09F84000 */  jalr       $v0
/* D438 80024C38 21200000 */   addu      $a0, $zero, $zero
/* D43C 80024C3C FF00033C */  lui        $v1, (0xFFFFFF >> 16)
/* D440 80024C40 0480043C */  lui        $a0, %hi(D_80046ED8)
/* D444 80024C44 D86E848C */  lw         $a0, %lo(D_80046ED8)($a0)
/* D448 80024C48 FFFF6334 */  ori        $v1, $v1, (0xFFFFFF & 0xFFFF)
/* D44C 80024C4C 0480013C */  lui        $at, %hi(D_80046EE4)
/* D450 80024C50 E46E22AC */  sw         $v0, %lo(D_80046EE4)($at)
/* D454 80024C54 359E000C */  jal        func_800278D4
/* D458 80024C58 24208300 */   and       $a0, $a0, $v1
/* D45C 80024C5C 2A930008 */  j          .L80024CA8
/* D460 80024C60 00000000 */   nop
.L80024C64:
/* D464 80024C64 0E004004 */  bltz       $v0, .L80024CA0
/* D468 80024C68 04004228 */   slti      $v0, $v0, 0x4
/* D46C 80024C6C 47004010 */  beqz       $v0, .L80024D8C
/* D470 80024C70 FFFF0224 */   addiu     $v0, $zero, -0x1
/* D474 80024C74 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D478 80024C78 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D47C 80024C7C 00000000 */  nop
/* D480 80024C80 3400428C */  lw         $v0, 0x34($v0)
/* D484 80024C84 00000000 */  nop
/* D488 80024C88 09F84000 */  jalr       $v0
/* D48C 80024C8C 01000434 */   ori       $a0, $zero, 0x1
/* D490 80024C90 0480013C */  lui        $at, %hi(D_80046EE4)
/* D494 80024C94 E46E22AC */  sw         $v0, %lo(D_80046EE4)($at)
/* D498 80024C98 2A930008 */  j          .L80024CA8
/* D49C 80024C9C 00000000 */   nop
.L80024CA0:
/* D4A0 80024CA0 63930008 */  j          .L80024D8C
/* D4A4 80024CA4 FFFF0224 */   addiu     $v0, $zero, -0x1
.L80024CA8:
/* D4A8 80024CA8 0580043C */  lui        $a0, %hi(D_80052288)
/* D4AC 80024CAC 88228424 */  addiu      $a0, $a0, %lo(D_80052288)
/* D4B0 80024CB0 FFFF0524 */  addiu      $a1, $zero, -0x1
/* D4B4 80024CB4 2A9E000C */  jal        func_800278A8
/* D4B8 80024CB8 5C000634 */   ori       $a2, $zero, 0x5C
/* D4BC 80024CBC 0580043C */  lui        $a0, %hi(D_800522E4)
/* D4C0 80024CC0 E4228424 */  addiu      $a0, $a0, %lo(D_800522E4)
/* D4C4 80024CC4 FFFF0524 */  addiu      $a1, $zero, -0x1
/* D4C8 80024CC8 2A9E000C */  jal        func_800278A8
/* D4CC 80024CCC 14000634 */   ori       $a2, $zero, 0x14
/* D4D0 80024CD0 0480023C */  lui        $v0, %hi(D_80046EE4)
/* D4D4 80024CD4 E46E428C */  lw         $v0, %lo(D_80046EE4)($v0)
/* D4D8 80024CD8 00000000 */  nop
/* D4DC 80024CDC 2B004010 */  beqz       $v0, .L80024D8C
/* D4E0 80024CE0 00000000 */   nop
/* D4E4 80024CE4 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D4E8 80024CE8 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D4EC 80024CEC 00000000 */  nop
/* D4F0 80024CF0 2800428C */  lw         $v0, 0x28($v0)
/* D4F4 80024CF4 00000000 */  nop
/* D4F8 80024CF8 09F84000 */  jalr       $v0
/* D4FC 80024CFC 08000434 */   ori       $a0, $zero, 0x8
/* D500 80024D00 0480033C */  lui        $v1, %hi(D_80046EE8)
/* D504 80024D04 E86E638C */  lw         $v1, %lo(D_80046EE8)($v1)
/* D508 80024D08 00000000 */  nop
/* D50C 80024D0C 04006010 */  beqz       $v1, .L80024D20
/* D510 80024D10 21204000 */   addu      $a0, $v0, $zero
/* D514 80024D14 0008023C */  lui        $v0, (0x8000080 >> 16)
/* D518 80024D18 49930008 */  j          .L80024D24
/* D51C 80024D1C 80004234 */   ori       $v0, $v0, (0x8000080 & 0xFFFF)
.L80024D20:
/* D520 80024D20 0008023C */  lui        $v0, (0x8000000 >> 16)
.L80024D24:
/* D524 80024D24 25208200 */  or         $a0, $a0, $v0
/* D528 80024D28 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D52C 80024D2C D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D530 80024D30 00000000 */  nop
/* D534 80024D34 1000428C */  lw         $v0, 0x10($v0)
/* D538 80024D38 00000000 */  nop
/* D53C 80024D3C 09F84000 */  jalr       $v0
/* D540 80024D40 00000000 */   nop
/* D544 80024D44 08000232 */  andi       $v0, $s0, 0x8
/* D548 80024D48 10004010 */  beqz       $v0, .L80024D8C
/* D54C 80024D4C 0020043C */   lui       $a0, (0x20000504 >> 16)
/* D550 80024D50 02000234 */  ori        $v0, $zero, 0x2
/* D554 80024D54 0480013C */  lui        $at, %hi(D_80046EE4)
/* D558 80024D58 E46E22AC */  sw         $v0, %lo(D_80046EE4)($at)
/* D55C 80024D5C 0480023C */  lui        $v0, %hi(D_80046EE8)
/* D560 80024D60 E86E428C */  lw         $v0, %lo(D_80046EE8)($v0)
/* D564 80024D64 0480033C */  lui        $v1, %hi(D_80046ED8)
/* D568 80024D68 D86E638C */  lw         $v1, %lo(D_80046ED8)($v1)
/* D56C 80024D6C 03004010 */  beqz       $v0, .L80024D7C
/* D570 80024D70 04058434 */   ori       $a0, $a0, (0x20000504 & 0xFFFF)
/* D574 80024D74 0020043C */  lui        $a0, (0x20000501 >> 16)
/* D578 80024D78 01058434 */  ori        $a0, $a0, (0x20000501 & 0xFFFF)
.L80024D7C:
/* D57C 80024D7C 1000628C */  lw         $v0, 0x10($v1)
/* D580 80024D80 00000000 */  nop
/* D584 80024D84 09F84000 */  jalr       $v0
/* D588 80024D88 00000000 */   nop
.L80024D8C:
/* D58C 80024D8C 1400BF8F */  lw         $ra, 0x14($sp)
/* D590 80024D90 1000B08F */  lw         $s0, 0x10($sp)
/* D594 80024D94 1800BD27 */  addiu      $sp, $sp, 0x18
/* D598 80024D98 0800E003 */  jr         $ra
/* D59C 80024D9C 00000000 */   nop
