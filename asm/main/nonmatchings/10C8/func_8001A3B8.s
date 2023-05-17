.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001A3B8
/* 2BB8 8001A3B8 A8FFBD27 */  addiu      $sp, $sp, -0x58
/* 2BBC 8001A3BC 5400BFAF */  sw         $ra, 0x54($sp)
/* 2BC0 8001A3C0 5000B0AF */  sw         $s0, 0x50($sp)
/* 2BC4 8001A3C4 0480023C */  lui        $v0, %hi(D_80047D74)
/* 2BC8 8001A3C8 747D428C */  lw         $v0, %lo(D_80047D74)($v0)
/* 2BCC 8001A3CC 01001034 */  ori        $s0, $zero, 0x1
/* 2BD0 8001A3D0 DA005010 */  beq        $v0, $s0, .L8001A73C
/* 2BD4 8001A3D4 00000000 */   nop
/* 2BD8 8001A3D8 47A9000C */  jal        func_8002A51C
/* 2BDC 8001A3DC 00000000 */   nop
/* 2BE0 8001A3E0 91A0000C */  jal        func_80028244
/* 2BE4 8001A3E4 21200000 */   addu      $a0, $zero, $zero
/* 2BE8 8001A3E8 0580043C */  lui        $a0, %hi(D_8005475C)
/* 2BEC 8001A3EC 5C478424 */  addiu      $a0, $a0, %lo(D_8005475C)
/* 2BF0 8001A3F0 DE68000C */  jal        func_8001A378
/* 2BF4 8001A3F4 00000000 */   nop
/* 2BF8 8001A3F8 0480013C */  lui        $at, %hi(D_80047E8C)
/* 2BFC 8001A3FC 8C7E22AC */  sw         $v0, %lo(D_80047E8C)($at)
/* 2C00 8001A400 0480013C */  lui        $at, %hi(D_80047D74)
/* 2C04 8001A404 747D30AC */  sw         $s0, %lo(D_80047D74)($at)
/* 2C08 8001A408 0480013C */  lui        $at, %hi(D_80047D78)
/* 2C0C 8001A40C 787D20AC */  sw         $zero, %lo(D_80047D78)($at)
/* 2C10 8001A410 0480013C */  lui        $at, %hi(D_80047D7C)
/* 2C14 8001A414 7C7D30AC */  sw         $s0, %lo(D_80047D7C)($at)
/* 2C18 8001A418 0480013C */  lui        $at, %hi(D_80047DB4)
/* 2C1C 8001A41C B47D20AC */  sw         $zero, %lo(D_80047DB4)($at)
/* 2C20 8001A420 0480013C */  lui        $at, %hi(D_80047DBC)
/* 2C24 8001A424 BC7D20AC */  sw         $zero, %lo(D_80047DBC)($at)
/* 2C28 8001A428 0480013C */  lui        $at, %hi(D_80047DB8)
/* 2C2C 8001A42C B87D20AC */  sw         $zero, %lo(D_80047DB8)($at)
/* 2C30 8001A430 0480013C */  lui        $at, %hi(D_80047DC0)
/* 2C34 8001A434 C07D20AC */  sw         $zero, %lo(D_80047DC0)($at)
/* 2C38 8001A438 0480013C */  lui        $at, %hi(D_80047F1C)
/* 2C3C 8001A43C 1C7F20AC */  sw         $zero, %lo(D_80047F1C)($at)
/* 2C40 8001A440 0480013C */  lui        $at, %hi(D_80047F24)
/* 2C44 8001A444 247F20AC */  sw         $zero, %lo(D_80047F24)($at)
/* 2C48 8001A448 0580013C */  lui        $at, %hi(D_800548EC)
/* 2C4C 8001A44C EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 2C50 8001A450 0480013C */  lui        $at, %hi(D_80047ED4)
/* 2C54 8001A454 D47E20AC */  sw         $zero, %lo(D_80047ED4)($at)
/* 2C58 8001A458 0480013C */  lui        $at, %hi(D_80047EE4)
/* 2C5C 8001A45C E47E20AC */  sw         $zero, %lo(D_80047EE4)($at)
/* 2C60 8001A460 0480013C */  lui        $at, %hi(D_80047DB0)
/* 2C64 8001A464 B07D30AC */  sw         $s0, %lo(D_80047DB0)($at)
/* 2C68 8001A468 0480013C */  lui        $at, %hi(D_80047EF4)
/* 2C6C 8001A46C F47E20AC */  sw         $zero, %lo(D_80047EF4)($at)
/* 2C70 8001A470 0480013C */  lui        $at, %hi(D_80047DEC)
/* 2C74 8001A474 EC7D20AC */  sw         $zero, %lo(D_80047DEC)($at)
/* 2C78 8001A478 0575000C */  jal        func_8001D414
/* 2C7C 8001A47C 00000000 */   nop
/* 2C80 8001A480 5F77000C */  jal        func_8001DD7C
/* 2C84 8001A484 00000000 */   nop
/* 2C88 8001A488 C0030234 */  ori        $v0, $zero, 0x3C0
/* 2C8C 8001A48C 1000A2AF */  sw         $v0, 0x10($sp)
/* 2C90 8001A490 2800B0AF */  sw         $s0, 0x28($sp)
/* 2C94 8001A494 2400A0AF */  sw         $zero, 0x24($sp)
/* 2C98 8001A498 00280234 */  ori        $v0, $zero, 0x2800
/* 2C9C 8001A49C 2000A2A7 */  sh         $v0, 0x20($sp)
/* 2CA0 8001A4A0 2200A2A7 */  sh         $v0, 0x22($sp)
/* 2CA4 8001A4A4 0480013C */  lui        $at, %hi(D_80047E9C)
/* 2CA8 8001A4A8 9C7E22A4 */  sh         $v0, %lo(D_80047E9C)($at)
/* 2CAC 8001A4AC 0480013C */  lui        $at, %hi(D_80047E9E)
/* 2CB0 8001A4B0 9E7E22A4 */  sh         $v0, %lo(D_80047E9E)($at)
/* 2CB4 8001A4B4 0480013C */  lui        $at, %hi(D_80047EA4)
/* 2CB8 8001A4B8 A47E20AC */  sw         $zero, %lo(D_80047EA4)($at)
/* 2CBC 8001A4BC C0C2000C */  jal        func_80030B00
/* 2CC0 8001A4C0 1000A427 */   addiu     $a0, $sp, 0x10
/* 2CC4 8001A4C4 E068000C */  jal        func_8001A380
/* 2CC8 8001A4C8 00000000 */   nop
/* 2CCC 8001A4CC B66B000C */  jal        func_8001AED8
/* 2CD0 8001A4D0 00000000 */   nop
/* 2CD4 8001A4D4 E770000C */  jal        func_8001C39C
/* 2CD8 8001A4D8 21200000 */   addu      $a0, $zero, $zero
/* 2CDC 8001A4DC 0280043C */  lui        $a0, %hi(func_8001D13C)
/* 2CE0 8001A4E0 3CD18424 */  addiu      $a0, $a0, %lo(func_8001D13C)
/* 2CE4 8001A4E4 4266000C */  jal        func_80019908
/* 2CE8 8001A4E8 00010534 */   ori       $a1, $zero, 0x100
/* 2CEC 8001A4EC 0280043C */  lui        $a0, %hi(func_8001B020)
/* 2CF0 8001A4F0 20B08424 */  addiu      $a0, $a0, %lo(func_8001B020)
/* 2CF4 8001A4F4 4266000C */  jal        func_80019908
/* 2CF8 8001A4F8 01010534 */   ori       $a1, $zero, 0x101
/* 2CFC 8001A4FC 0280043C */  lui        $a0, %hi(func_8001B0A0)
/* 2D00 8001A500 A0B08424 */  addiu      $a0, $a0, %lo(func_8001B0A0)
/* 2D04 8001A504 4266000C */  jal        func_80019908
/* 2D08 8001A508 02010534 */   ori       $a1, $zero, 0x102
/* 2D0C 8001A50C 0280043C */  lui        $a0, %hi(func_8001B8DC)
/* 2D10 8001A510 DCB88424 */  addiu      $a0, $a0, %lo(func_8001B8DC)
/* 2D14 8001A514 4266000C */  jal        func_80019908
/* 2D18 8001A518 03010534 */   ori       $a1, $zero, 0x103
/* 2D1C 8001A51C 0280043C */  lui        $a0, %hi(func_8001C734)
/* 2D20 8001A520 34C78424 */  addiu      $a0, $a0, %lo(func_8001C734)
/* 2D24 8001A524 4266000C */  jal        func_80019908
/* 2D28 8001A528 04010534 */   ori       $a1, $zero, 0x104
/* 2D2C 8001A52C 0280043C */  lui        $a0, %hi(func_8001C670)
/* 2D30 8001A530 70C68424 */  addiu      $a0, $a0, %lo(func_8001C670)
/* 2D34 8001A534 4266000C */  jal        func_80019908
/* 2D38 8001A538 10010534 */   ori       $a1, $zero, 0x110
/* 2D3C 8001A53C 0280043C */  lui        $a0, %hi(func_8001C780)
/* 2D40 8001A540 80C78424 */  addiu      $a0, $a0, %lo(func_8001C780)
/* 2D44 8001A544 4266000C */  jal        func_80019908
/* 2D48 8001A548 11010534 */   ori       $a1, $zero, 0x111
/* 2D4C 8001A54C 0280043C */  lui        $a0, %hi(func_8001C564)
/* 2D50 8001A550 64C58424 */  addiu      $a0, $a0, %lo(func_8001C564)
/* 2D54 8001A554 4266000C */  jal        func_80019908
/* 2D58 8001A558 12010534 */   ori       $a1, $zero, 0x112
/* 2D5C 8001A55C 0280043C */  lui        $a0, %hi(func_8001CCC0)
/* 2D60 8001A560 C0CC8424 */  addiu      $a0, $a0, %lo(func_8001CCC0)
/* 2D64 8001A564 4266000C */  jal        func_80019908
/* 2D68 8001A568 13010534 */   ori       $a1, $zero, 0x113
/* 2D6C 8001A56C 0280043C */  lui        $a0, %hi(func_8001C5BC)
/* 2D70 8001A570 BCC58424 */  addiu      $a0, $a0, %lo(func_8001C5BC)
/* 2D74 8001A574 4266000C */  jal        func_80019908
/* 2D78 8001A578 14010534 */   ori       $a1, $zero, 0x114
/* 2D7C 8001A57C 0280043C */  lui        $a0, %hi(func_8001C7B4)
/* 2D80 8001A580 B4C78424 */  addiu      $a0, $a0, %lo(func_8001C7B4)
/* 2D84 8001A584 4266000C */  jal        func_80019908
/* 2D88 8001A588 15010534 */   ori       $a1, $zero, 0x115
/* 2D8C 8001A58C 0280043C */  lui        $a0, %hi(func_8001C5F4)
/* 2D90 8001A590 F4C58424 */  addiu      $a0, $a0, %lo(func_8001C5F4)
/* 2D94 8001A594 4266000C */  jal        func_80019908
/* 2D98 8001A598 16010534 */   ori       $a1, $zero, 0x116
/* 2D9C 8001A59C 0280043C */  lui        $a0, %hi(func_8001DB04)
/* 2DA0 8001A5A0 04DB8424 */  addiu      $a0, $a0, %lo(func_8001DB04)
/* 2DA4 8001A5A4 4266000C */  jal        func_80019908
/* 2DA8 8001A5A8 17010534 */   ori       $a1, $zero, 0x117
/* 2DAC 8001A5AC 0280043C */  lui        $a0, %hi(func_8001C03C)
/* 2DB0 8001A5B0 3CC08424 */  addiu      $a0, $a0, %lo(func_8001C03C)
/* 2DB4 8001A5B4 4266000C */  jal        func_80019908
/* 2DB8 8001A5B8 20010534 */   ori       $a1, $zero, 0x120
/* 2DBC 8001A5BC 0280043C */  lui        $a0, %hi(func_8001C20C)
/* 2DC0 8001A5C0 0CC28424 */  addiu      $a0, $a0, %lo(func_8001C20C)
/* 2DC4 8001A5C4 4266000C */  jal        func_80019908
/* 2DC8 8001A5C8 21010534 */   ori       $a1, $zero, 0x121
/* 2DCC 8001A5CC 0280043C */  lui        $a0, %hi(func_8001C2F4)
/* 2DD0 8001A5D0 F4C28424 */  addiu      $a0, $a0, %lo(func_8001C2F4)
/* 2DD4 8001A5D4 4266000C */  jal        func_80019908
/* 2DD8 8001A5D8 22010534 */   ori       $a1, $zero, 0x122
/* 2DDC 8001A5DC 0280043C */  lui        $a0, %hi(func_8001C31C)
/* 2DE0 8001A5E0 1CC38424 */  addiu      $a0, $a0, %lo(func_8001C31C)
/* 2DE4 8001A5E4 4266000C */  jal        func_80019908
/* 2DE8 8001A5E8 23010534 */   ori       $a1, $zero, 0x123
/* 2DEC 8001A5EC 0280043C */  lui        $a0, %hi(func_8001C34C)
/* 2DF0 8001A5F0 4CC38424 */  addiu      $a0, $a0, %lo(func_8001C34C)
/* 2DF4 8001A5F4 4266000C */  jal        func_80019908
/* 2DF8 8001A5F8 24010534 */   ori       $a1, $zero, 0x124
/* 2DFC 8001A5FC 0280043C */  lui        $a0, %hi(func_8001C374)
/* 2E00 8001A600 74C38424 */  addiu      $a0, $a0, %lo(func_8001C374)
/* 2E04 8001A604 4266000C */  jal        func_80019908
/* 2E08 8001A608 25010534 */   ori       $a1, $zero, 0x125
/* 2E0C 8001A60C 0280043C */  lui        $a0, %hi(func_8001C39C)
/* 2E10 8001A610 9CC38424 */  addiu      $a0, $a0, %lo(func_8001C39C)
/* 2E14 8001A614 4266000C */  jal        func_80019908
/* 2E18 8001A618 26010534 */   ori       $a1, $zero, 0x126
/* 2E1C 8001A61C 0280043C */  lui        $a0, %hi(func_8001AB88)
/* 2E20 8001A620 88AB8424 */  addiu      $a0, $a0, %lo(func_8001AB88)
/* 2E24 8001A624 4266000C */  jal        func_80019908
/* 2E28 8001A628 27010534 */   ori       $a1, $zero, 0x127
/* 2E2C 8001A62C 0280043C */  lui        $a0, %hi(func_8001AD0C)
/* 2E30 8001A630 0CAD8424 */  addiu      $a0, $a0, %lo(func_8001AD0C)
/* 2E34 8001A634 4266000C */  jal        func_80019908
/* 2E38 8001A638 28010534 */   ori       $a1, $zero, 0x128
/* 2E3C 8001A63C 0280043C */  lui        $a0, %hi(func_8001A934)
/* 2E40 8001A640 34A98424 */  addiu      $a0, $a0, %lo(func_8001A934)
/* 2E44 8001A644 4266000C */  jal        func_80019908
/* 2E48 8001A648 29010534 */   ori       $a1, $zero, 0x129
/* 2E4C 8001A64C 0280043C */  lui        $a0, %hi(func_8001CD0C)
/* 2E50 8001A650 0CCD8424 */  addiu      $a0, $a0, %lo(func_8001CD0C)
/* 2E54 8001A654 4266000C */  jal        func_80019908
/* 2E58 8001A658 2A010534 */   ori       $a1, $zero, 0x12A
/* 2E5C 8001A65C 0280043C */  lui        $a0, %hi(func_8001CD30)
/* 2E60 8001A660 30CD8424 */  addiu      $a0, $a0, %lo(func_8001CD30)
/* 2E64 8001A664 4266000C */  jal        func_80019908
/* 2E68 8001A668 2B010534 */   ori       $a1, $zero, 0x12B
/* 2E6C 8001A66C 0280043C */  lui        $a0, %hi(func_8001CD68)
/* 2E70 8001A670 68CD8424 */  addiu      $a0, $a0, %lo(func_8001CD68)
/* 2E74 8001A674 4266000C */  jal        func_80019908
/* 2E78 8001A678 2C010534 */   ori       $a1, $zero, 0x12C
/* 2E7C 8001A67C 0280043C */  lui        $a0, %hi(func_8001CDF0)
/* 2E80 8001A680 F0CD8424 */  addiu      $a0, $a0, %lo(func_8001CDF0)
/* 2E84 8001A684 4266000C */  jal        func_80019908
/* 2E88 8001A688 2D010534 */   ori       $a1, $zero, 0x12D
/* 2E8C 8001A68C 0280043C */  lui        $a0, %hi(func_8001D288)
/* 2E90 8001A690 88D28424 */  addiu      $a0, $a0, %lo(func_8001D288)
/* 2E94 8001A694 4266000C */  jal        func_80019908
/* 2E98 8001A698 2E010534 */   ori       $a1, $zero, 0x12E
/* 2E9C 8001A69C 0280043C */  lui        $a0, %hi(func_8001D29C)
/* 2EA0 8001A6A0 9CD28424 */  addiu      $a0, $a0, %lo(func_8001D29C)
/* 2EA4 8001A6A4 4266000C */  jal        func_80019908
/* 2EA8 8001A6A8 2F010534 */   ori       $a1, $zero, 0x12F
/* 2EAC 8001A6AC 0280043C */  lui        $a0, %hi(func_8001BD00)
/* 2EB0 8001A6B0 00BD8424 */  addiu      $a0, $a0, %lo(func_8001BD00)
/* 2EB4 8001A6B4 4266000C */  jal        func_80019908
/* 2EB8 8001A6B8 30010534 */   ori       $a1, $zero, 0x130
/* 2EBC 8001A6BC 0280043C */  lui        $a0, %hi(func_8001AE90)
/* 2EC0 8001A6C0 90AE8424 */  addiu      $a0, $a0, %lo(func_8001AE90)
/* 2EC4 8001A6C4 4266000C */  jal        func_80019908
/* 2EC8 8001A6C8 38010534 */   ori       $a1, $zero, 0x138
/* 2ECC 8001A6CC 0280043C */  lui        $a0, %hi(func_8001D248)
/* 2ED0 8001A6D0 48D28424 */  addiu      $a0, $a0, %lo(func_8001D248)
/* 2ED4 8001A6D4 4266000C */  jal        func_80019908
/* 2ED8 8001A6D8 39010534 */   ori       $a1, $zero, 0x139
/* 2EDC 8001A6DC 0280043C */  lui        $a0, %hi(func_8001CE28)
/* 2EE0 8001A6E0 28CE8424 */  addiu      $a0, $a0, %lo(func_8001CE28)
/* 2EE4 8001A6E4 4266000C */  jal        func_80019908
/* 2EE8 8001A6E8 3A010534 */   ori       $a1, $zero, 0x13A
/* 2EEC 8001A6EC 0280043C */  lui        $a0, %hi(func_8001CE58)
/* 2EF0 8001A6F0 58CE8424 */  addiu      $a0, $a0, %lo(func_8001CE58)
/* 2EF4 8001A6F4 4266000C */  jal        func_80019908
/* 2EF8 8001A6F8 3B010534 */   ori       $a1, $zero, 0x13B
/* 2EFC 8001A6FC 0280043C */  lui        $a0, %hi(func_8001CEA0)
/* 2F00 8001A700 A0CE8424 */  addiu      $a0, $a0, %lo(func_8001CEA0)
/* 2F04 8001A704 4266000C */  jal        func_80019908
/* 2F08 8001A708 3C010534 */   ori       $a1, $zero, 0x13C
/* 2F0C 8001A70C 0280043C */  lui        $a0, %hi(func_8001D2AC)
/* 2F10 8001A710 ACD28424 */  addiu      $a0, $a0, %lo(func_8001D2AC)
/* 2F14 8001A714 4266000C */  jal        func_80019908
/* 2F18 8001A718 40010534 */   ori       $a1, $zero, 0x140
/* 2F1C 8001A71C 0280043C */  lui        $a0, %hi(func_8001BB50)
/* 2F20 8001A720 50BB8424 */  addiu      $a0, $a0, %lo(func_8001BB50)
/* 2F24 8001A724 4266000C */  jal        func_80019908
/* 2F28 8001A728 50010534 */   ori       $a1, $zero, 0x150
/* 2F2C 8001A72C 0280043C */  lui        $a0, %hi(func_8001CF38)
/* 2F30 8001A730 38CF8424 */  addiu      $a0, $a0, %lo(func_8001CF38)
/* 2F34 8001A734 4266000C */  jal        func_80019908
/* 2F38 8001A738 51010534 */   ori       $a1, $zero, 0x151
.L8001A73C:
/* 2F3C 8001A73C 5400BF8F */  lw         $ra, 0x54($sp)
/* 2F40 8001A740 5000B08F */  lw         $s0, 0x50($sp)
/* 2F44 8001A744 0800E003 */  jr         $ra
/* 2F48 8001A748 5800BD27 */   addiu     $sp, $sp, 0x58
