.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_8002F440
/* 17C40 8002F440 2140C000 */  addu       $t0, $a2, $zero
/* 17C44 8002F444 0480063C */  lui        $a2, %hi(D_80047D08)
/* 17C48 8002F448 087DC68C */  lw         $a2, %lo(D_80047D08)($a2)
/* 17C4C 8002F44C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 17C50 8002F450 1000BFAF */  sw         $ra, 0x10($sp)
/* 17C54 8002F454 AE01C294 */  lhu        $v0, 0x1AE($a2)
/* 17C58 8002F458 00000000 */  nop
/* 17C5C 8002F45C AC01C294 */  lhu        $v0, 0x1AC($a2)
/* 17C60 8002F460 00000000 */  nop
/* 17C64 8002F464 0E004230 */  andi       $v0, $v0, 0xE
/* 17C68 8002F468 42380200 */  srl        $a3, $v0, 1
/* 17C6C 8002F46C 52000234 */  ori        $v0, $zero, 0x52
/* 17C70 8002F470 4D01A210 */  beq        $a1, $v0, .L8002F9A8
/* 17C74 8002F474 5300A22C */   sltiu     $v0, $a1, 0x53
/* 17C78 8002F478 3F004010 */  beqz       $v0, .L8002F578
/* 17C7C 8002F47C 2B000234 */   ori       $v0, $zero, 0x2B
/* 17C80 8002F480 F600A210 */  beq        $a1, $v0, .L8002F85C
/* 17C84 8002F484 2C00A22C */   sltiu     $v0, $a1, 0x2C
/* 17C88 8002F488 1D004010 */  beqz       $v0, .L8002F500
/* 17C8C 8002F48C 13000234 */   ori       $v0, $zero, 0x13
/* 17C90 8002F490 D300A210 */  beq        $a1, $v0, .L8002F7E0
/* 17C94 8002F494 1400A22C */   sltiu     $v0, $a1, 0x14
/* 17C98 8002F498 0E004010 */  beqz       $v0, .L8002F4D4
/* 17C9C 8002F49C 02000234 */   ori       $v0, $zero, 0x2
/* 17CA0 8002F4A0 8800A210 */  beq        $a1, $v0, .L8002F6C4
/* 17CA4 8002F4A4 0300A22C */   sltiu     $v0, $a1, 0x3
/* 17CA8 8002F4A8 05004010 */  beqz       $v0, .L8002F4C0
/* 17CAC 8002F4AC 01000234 */   ori       $v0, $zero, 0x1
/* 17CB0 8002F4B0 7300A210 */  beq        $a1, $v0, .L8002F680
/* 17CB4 8002F4B4 21100000 */   addu      $v0, $zero, $zero
/* 17CB8 8002F4B8 85BF0008 */  j          .L8002FE14
/* 17CBC 8002F4BC 00000000 */   nop
.L8002F4C0:
/* 17CC0 8002F4C0 10000234 */  ori        $v0, $zero, 0x10
/* 17CC4 8002F4C4 8600A210 */  beq        $a1, $v0, .L8002F6E0
/* 17CC8 8002F4C8 21100000 */   addu      $v0, $zero, $zero
/* 17CCC 8002F4CC 85BF0008 */  j          .L8002FE14
/* 17CD0 8002F4D0 00000000 */   nop
.L8002F4D4:
/* 17CD4 8002F4D4 15000234 */  ori        $v0, $zero, 0x15
/* 17CD8 8002F4D8 DC00A210 */  beq        $a1, $v0, .L8002F84C
/* 17CDC 8002F4DC 1500A22C */   sltiu     $v0, $a1, 0x15
/* 17CE0 8002F4E0 D7004014 */  bnez       $v0, .L8002F840
/* 17CE4 8002F4E4 16000234 */   ori       $v0, $zero, 0x16
/* 17CE8 8002F4E8 B600A210 */  beq        $a1, $v0, .L8002F7C4
/* 17CEC 8002F4EC 21000234 */   ori       $v0, $zero, 0x21
/* 17CF0 8002F4F0 F700A210 */  beq        $a1, $v0, .L8002F8D0
/* 17CF4 8002F4F4 21100000 */   addu      $v0, $zero, $zero
/* 17CF8 8002F4F8 85BF0008 */  j          .L8002FE14
/* 17CFC 8002F4FC 00000000 */   nop
.L8002F500:
/* 17D00 8002F500 40000234 */  ori        $v0, $zero, 0x40
/* 17D04 8002F504 FC00A210 */  beq        $a1, $v0, .L8002F8F8
/* 17D08 8002F508 4100A22C */   sltiu     $v0, $a1, 0x41
/* 17D0C 8002F50C 0E004010 */  beqz       $v0, .L8002F548
/* 17D10 8002F510 2E000234 */   ori       $v0, $zero, 0x2E
/* 17D14 8002F514 EE00A210 */  beq        $a1, $v0, .L8002F8D0
/* 17D18 8002F518 2F00A22C */   sltiu     $v0, $a1, 0x2F
/* 17D1C 8002F51C 05004010 */  beqz       $v0, .L8002F534
/* 17D20 8002F520 2D000234 */   ori       $v0, $zero, 0x2D
/* 17D24 8002F524 E400A210 */  beq        $a1, $v0, .L8002F8B8
/* 17D28 8002F528 0100E324 */   addiu     $v1, $a3, 0x1
/* 17D2C 8002F52C 85BF0008 */  j          .L8002FE14
/* 17D30 8002F530 21100000 */   addu      $v0, $zero, $zero
.L8002F534:
/* 17D34 8002F534 2F000234 */  ori        $v0, $zero, 0x2F
/* 17D38 8002F538 EB00A210 */  beq        $a1, $v0, .L8002F8E8
/* 17D3C 8002F53C 21100000 */   addu      $v0, $zero, $zero
/* 17D40 8002F540 85BF0008 */  j          .L8002FE14
/* 17D44 8002F544 00000000 */   nop
.L8002F548:
/* 17D48 8002F548 42000234 */  ori        $v0, $zero, 0x42
/* 17D4C 8002F54C FB00A210 */  beq        $a1, $v0, .L8002F93C
/* 17D50 8002F550 4200A22C */   sltiu     $v0, $a1, 0x42
/* 17D54 8002F554 F5004014 */  bnez       $v0, .L8002F92C
/* 17D58 8002F558 50000234 */   ori       $v0, $zero, 0x50
/* 17D5C 8002F55C 0301A210 */  beq        $a1, $v0, .L8002F96C
/* 17D60 8002F560 00000000 */   nop
/* 17D64 8002F564 51000234 */  ori        $v0, $zero, 0x51
/* 17D68 8002F568 0601A210 */  beq        $a1, $v0, .L8002F984
/* 17D6C 8002F56C 21100000 */   addu      $v0, $zero, $zero
/* 17D70 8002F570 85BF0008 */  j          .L8002FE14
/* 17D74 8002F574 00000000 */   nop
.L8002F578:
/* 17D78 8002F578 68000234 */  ori        $v0, $zero, 0x68
/* 17D7C 8002F57C 3B01A210 */  beq        $a1, $v0, .L8002FA6C
/* 17D80 8002F580 6900A22C */   sltiu     $v0, $a1, 0x69
/* 17D84 8002F584 1D004010 */  beqz       $v0, .L8002F5FC
/* 17D88 8002F588 61000234 */   ori       $v0, $zero, 0x61
/* 17D8C 8002F58C 3201A210 */  beq        $a1, $v0, .L8002FA58
/* 17D90 8002F590 6200A22C */   sltiu     $v0, $a1, 0x62
/* 17D94 8002F594 09004010 */  beqz       $v0, .L8002F5BC
/* 17D98 8002F598 54000234 */   ori       $v0, $zero, 0x54
/* 17D9C 8002F59C 1201A210 */  beq        $a1, $v0, .L8002F9E8
/* 17DA0 8002F5A0 5400A22C */   sltiu     $v0, $a1, 0x54
/* 17DA4 8002F5A4 0C014014 */  bnez       $v0, .L8002F9D8
/* 17DA8 8002F5A8 60000234 */   ori       $v0, $zero, 0x60
/* 17DAC 8002F5AC 1A01A210 */  beq        $a1, $v0, .L8002FA18
/* 17DB0 8002F5B0 21100000 */   addu      $v0, $zero, $zero
/* 17DB4 8002F5B4 85BF0008 */  j          .L8002FE14
/* 17DB8 8002F5B8 00000000 */   nop
.L8002F5BC:
/* 17DBC 8002F5BC 65000234 */  ori        $v0, $zero, 0x65
/* 17DC0 8002F5C0 4B01A210 */  beq        $a1, $v0, .L8002FAF0
/* 17DC4 8002F5C4 6600A22C */   sltiu     $v0, $a1, 0x66
/* 17DC8 8002F5C8 05004010 */  beqz       $v0, .L8002F5E0
/* 17DCC 8002F5CC 63000234 */   ori       $v0, $zero, 0x63
/* 17DD0 8002F5D0 4301A210 */  beq        $a1, $v0, .L8002FAE0
/* 17DD4 8002F5D4 21100000 */   addu      $v0, $zero, $zero
/* 17DD8 8002F5D8 85BF0008 */  j          .L8002FE14
/* 17DDC 8002F5DC 00000000 */   nop
.L8002F5E0:
/* 17DE0 8002F5E0 66000234 */  ori        $v0, $zero, 0x66
/* 17DE4 8002F5E4 4F01A210 */  beq        $a1, $v0, .L8002FB24
/* 17DE8 8002F5E8 67000234 */   ori       $v0, $zero, 0x67
/* 17DEC 8002F5EC 5401A210 */  beq        $a1, $v0, .L8002FB40
/* 17DF0 8002F5F0 21100000 */   addu      $v0, $zero, $zero
/* 17DF4 8002F5F4 85BF0008 */  j          .L8002FE14
/* 17DF8 8002F5F8 00000000 */   nop
.L8002F5FC:
/* 17DFC 8002F5FC 03020234 */  ori        $v0, $zero, 0x203
/* 17E00 8002F600 6D01A210 */  beq        $a1, $v0, .L8002FBB8
/* 17E04 8002F604 0402A22C */   sltiu     $v0, $a1, 0x204
/* 17E08 8002F608 0B004010 */  beqz       $v0, .L8002F638
/* 17E0C 8002F60C 6A000234 */   ori       $v0, $zero, 0x6A
/* 17E10 8002F610 0A01A210 */  beq        $a1, $v0, .L8002FA3C
/* 17E14 8002F614 6A00A22C */   sltiu     $v0, $a1, 0x6A
/* 17E18 8002F618 2C014014 */  bnez       $v0, .L8002FACC
/* 17E1C 8002F61C 00010234 */   ori       $v0, $zero, 0x100
/* 17E20 8002F620 5501A210 */  beq        $a1, $v0, .L8002FB78
/* 17E24 8002F624 01010234 */   ori       $v0, $zero, 0x101
/* 17E28 8002F628 5701A210 */  beq        $a1, $v0, .L8002FB88
/* 17E2C 8002F62C 21100000 */   addu      $v0, $zero, $zero
/* 17E30 8002F630 85BF0008 */  j          .L8002FE14
/* 17E34 8002F634 00000000 */   nop
.L8002F638:
/* 17E38 8002F638 10020234 */  ori        $v0, $zero, 0x210
/* 17E3C 8002F63C 6601A210 */  beq        $a1, $v0, .L8002FBD8
/* 17E40 8002F640 FFF0033C */   lui       $v1, (0xF0FFFFFF >> 16)
/* 17E44 8002F644 1102A22C */  sltiu      $v0, $a1, 0x211
/* 17E48 8002F648 05004010 */  beqz       $v0, .L8002F660
/* 17E4C 8002F64C 04020234 */   ori       $v0, $zero, 0x204
/* 17E50 8002F650 5101A210 */  beq        $a1, $v0, .L8002FB98
/* 17E54 8002F654 21100000 */   addu      $v0, $zero, $zero
/* 17E58 8002F658 85BF0008 */  j          .L8002FE14
/* 17E5C 8002F65C 00000000 */   nop
.L8002F660:
/* 17E60 8002F660 12020234 */  ori        $v0, $zero, 0x212
/* 17E64 8002F664 8601A210 */  beq        $a1, $v0, .L8002FC80
/* 17E68 8002F668 FFF0033C */   lui       $v1, (0xF0FFFFFF >> 16)
/* 17E6C 8002F66C 13020234 */  ori        $v0, $zero, 0x213
/* 17E70 8002F670 AD01A210 */  beq        $a1, $v0, .L8002FD28
/* 17E74 8002F674 FFF0053C */   lui       $a1, (0xF0FFFFFF >> 16)
/* 17E78 8002F678 85BF0008 */  j          .L8002FE14
/* 17E7C 8002F67C 21100000 */   addu      $v0, $zero, $zero
.L8002F680:
/* 17E80 8002F680 07000015 */  bnez       $t0, .L8002F6A0
/* 17E84 8002F684 00000000 */   nop
/* 17E88 8002F688 AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 17E8C 8002F68C 00000000 */  nop
/* 17E90 8002F690 00404234 */  ori        $v0, $v0, 0x4000
/* 17E94 8002F694 AA01C2A4 */  sh         $v0, 0x1AA($a2)
/* 17E98 8002F698 85BF0008 */  j          .L8002FE14
/* 17E9C 8002F69C 21100000 */   addu      $v0, $zero, $zero
.L8002F6A0:
/* 17EA0 8002F6A0 0480033C */  lui        $v1, %hi(D_80047D08)
/* 17EA4 8002F6A4 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 17EA8 8002F6A8 00000000 */  nop
/* 17EAC 8002F6AC AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17EB0 8002F6B0 00000000 */  nop
/* 17EB4 8002F6B4 FFBF4230 */  andi       $v0, $v0, 0xBFFF
/* 17EB8 8002F6B8 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* 17EBC 8002F6BC 85BF0008 */  j          .L8002FE14
/* 17EC0 8002F6C0 21100000 */   addu      $v0, $zero, $zero
.L8002F6C4:
/* 17EC4 8002F6C4 AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 17EC8 8002F6C8 00000000 */  nop
/* 17ECC 8002F6CC 00404230 */  andi       $v0, $v0, 0x4000
/* 17ED0 8002F6D0 DF004010 */  beqz       $v0, .L8002FA50
/* 17ED4 8002F6D4 01000234 */   ori       $v0, $zero, 0x1
.L8002F6D8:
/* 17ED8 8002F6D8 84BF0008 */  j          .L8002FE10
/* 17EDC 8002F6DC 000000AD */   sw        $zero, 0x0($t0)
.L8002F6E0:
/* 17EE0 8002F6E0 1B000015 */  bnez       $t0, .L8002F750
/* 17EE4 8002F6E4 00000000 */   nop
/* 17EE8 8002F6E8 AA01C494 */  lhu        $a0, 0x1AA($a2)
/* 17EEC 8002F6EC 00000000 */  nop
/* 17EF0 8002F6F0 BFFF8430 */  andi       $a0, $a0, 0xFFBF
/* 17EF4 8002F6F4 AA01C4A4 */  sh         $a0, 0x1AA($a2)
/* 17EF8 8002F6F8 AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 17EFC 8002F6FC 0580013C */  lui        $at, %hi(D_800546DC)
/* 17F00 8002F700 DC4620AC */  sw         $zero, %lo(D_800546DC)($at)
/* 17F04 8002F704 40004230 */  andi       $v0, $v0, 0x40
/* 17F08 8002F708 C1014010 */  beqz       $v0, .L8002FE10
/* 17F0C 8002F70C 2118C000 */   addu      $v1, $a2, $zero
.L8002F710:
/* 17F10 8002F710 0580023C */  lui        $v0, %hi(D_800546DC)
/* 17F14 8002F714 DC46428C */  lw         $v0, %lo(D_800546DC)($v0)
/* 17F18 8002F718 00000000 */  nop
/* 17F1C 8002F71C 01004224 */  addiu      $v0, $v0, 0x1
/* 17F20 8002F720 0580013C */  lui        $at, %hi(D_800546DC)
/* 17F24 8002F724 DC4622AC */  sw         $v0, %lo(D_800546DC)($at)
/* 17F28 8002F728 89134228 */  slti       $v0, $v0, 0x1389
/* 17F2C 8002F72C B2014010 */  beqz       $v0, .L8002FDF8
/* 17F30 8002F730 00000000 */   nop
/* 17F34 8002F734 AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17F38 8002F738 00000000 */  nop
/* 17F3C 8002F73C 40004230 */  andi       $v0, $v0, 0x40
/* 17F40 8002F740 F3FF4014 */  bnez       $v0, .L8002F710
/* 17F44 8002F744 21100000 */   addu      $v0, $zero, $zero
/* 17F48 8002F748 85BF0008 */  j          .L8002FE14
/* 17F4C 8002F74C 00000000 */   nop
.L8002F750:
/* 17F50 8002F750 0480033C */  lui        $v1, %hi(D_80047D08)
/* 17F54 8002F754 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 17F58 8002F758 00000000 */  nop
/* 17F5C 8002F75C AA016494 */  lhu        $a0, 0x1AA($v1)
/* 17F60 8002F760 00000000 */  nop
/* 17F64 8002F764 40008434 */  ori        $a0, $a0, 0x40
/* 17F68 8002F768 AA0164A4 */  sh         $a0, 0x1AA($v1)
/* 17F6C 8002F76C AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17F70 8002F770 0580013C */  lui        $at, %hi(D_800546DC)
/* 17F74 8002F774 DC4620AC */  sw         $zero, %lo(D_800546DC)($at)
/* 17F78 8002F778 40004230 */  andi       $v0, $v0, 0x40
/* 17F7C 8002F77C A5014014 */  bnez       $v0, .L8002FE14
/* 17F80 8002F780 21100000 */   addu      $v0, $zero, $zero
.L8002F784:
/* 17F84 8002F784 0580023C */  lui        $v0, %hi(D_800546DC)
/* 17F88 8002F788 DC46428C */  lw         $v0, %lo(D_800546DC)($v0)
/* 17F8C 8002F78C 00000000 */  nop
/* 17F90 8002F790 01004224 */  addiu      $v0, $v0, 0x1
/* 17F94 8002F794 0580013C */  lui        $at, %hi(D_800546DC)
/* 17F98 8002F798 DC4622AC */  sw         $v0, %lo(D_800546DC)($at)
/* 17F9C 8002F79C 89134228 */  slti       $v0, $v0, 0x1389
/* 17FA0 8002F7A0 95014010 */  beqz       $v0, .L8002FDF8
/* 17FA4 8002F7A4 00000000 */   nop
/* 17FA8 8002F7A8 AA016294 */  lhu        $v0, 0x1AA($v1)
/* 17FAC 8002F7AC 00000000 */  nop
/* 17FB0 8002F7B0 40004230 */  andi       $v0, $v0, 0x40
/* 17FB4 8002F7B4 F3FF4010 */  beqz       $v0, .L8002F784
/* 17FB8 8002F7B8 21100000 */   addu      $v0, $zero, $zero
/* 17FBC 8002F7BC 85BF0008 */  j          .L8002FE14
/* 17FC0 8002F7C0 00000000 */   nop
.L8002F7C4:
/* 17FC4 8002F7C4 AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 17FC8 8002F7C8 00000000 */  nop
/* 17FCC 8002F7CC 40004230 */  andi       $v0, $v0, 0x40
/* 17FD0 8002F7D0 9F004014 */  bnez       $v0, .L8002FA50
/* 17FD4 8002F7D4 01000234 */   ori       $v0, $zero, 0x1
/* 17FD8 8002F7D8 84BF0008 */  j          .L8002FE10
/* 17FDC 8002F7DC 000000AD */   sw        $zero, 0x0($t0)
.L8002F7E0:
/* 17FE0 8002F7E0 0000048D */  lw         $a0, 0x0($t0)
/* 17FE4 8002F7E4 1000E010 */  beqz       $a3, .L8002F828
/* 17FE8 8002F7E8 0100E224 */   addiu     $v0, $a3, 0x1
/* 17FEC 8002F7EC 1A008700 */  div        $zero, $a0, $a3
/* 17FF0 8002F7F0 0200E014 */  bnez       $a3, .L8002F7FC
/* 17FF4 8002F7F4 00000000 */   nop
/* 17FF8 8002F7F8 0D000700 */  break      7
.L8002F7FC:
/* 17FFC 8002F7FC FFFF0124 */  addiu      $at, $zero, -0x1
/* 18000 8002F800 0400E114 */  bne        $a3, $at, .L8002F814
/* 18004 8002F804 0080013C */   lui       $at, (0x80000000 >> 16)
/* 18008 8002F808 02008114 */  bne        $a0, $at, .L8002F814
/* 1800C 8002F80C 00000000 */   nop
/* 18010 8002F810 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L8002F814:
/* 18014 8002F814 10100000 */  mfhi       $v0
/* 18018 8002F818 00000000 */  nop
/* 1801C 8002F81C 02004010 */  beqz       $v0, .L8002F828
/* 18020 8002F820 0100E224 */   addiu     $v0, $a3, 0x1
/* 18024 8002F824 21208700 */  addu       $a0, $a0, $a3
.L8002F828:
/* 18028 8002F828 0480033C */  lui        $v1, %hi(D_80047D08)
/* 1802C 8002F82C 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 18030 8002F830 07204400 */  srav       $a0, $a0, $v0
/* 18034 8002F834 A40164A4 */  sh         $a0, 0x1A4($v1)
/* 18038 8002F838 85BF0008 */  j          .L8002FE14
/* 1803C 8002F83C 21100000 */   addu      $v0, $zero, $zero
.L8002F840:
/* 18040 8002F840 A401C494 */  lhu        $a0, 0x1A4($a2)
/* 18044 8002F844 B5BE0008 */  j          .L8002FAD4
/* 18048 8002F848 0100E224 */   addiu     $v0, $a3, 0x1
.L8002F84C:
/* 1804C 8002F84C 67C2000C */  jal        func_8003099C
/* 18050 8002F850 21200001 */   addu      $a0, $t0, $zero
/* 18054 8002F854 85BF0008 */  j          .L8002FE14
/* 18058 8002F858 21100000 */   addu      $v0, $zero, $zero
.L8002F85C:
/* 1805C 8002F85C 0000048D */  lw         $a0, 0x0($t0)
/* 18060 8002F860 1000E010 */  beqz       $a3, .L8002F8A4
/* 18064 8002F864 0100E224 */   addiu     $v0, $a3, 0x1
/* 18068 8002F868 1A008700 */  div        $zero, $a0, $a3
/* 1806C 8002F86C 0200E014 */  bnez       $a3, .L8002F878
/* 18070 8002F870 00000000 */   nop
/* 18074 8002F874 0D000700 */  break      7
.L8002F878:
/* 18078 8002F878 FFFF0124 */  addiu      $at, $zero, -0x1
/* 1807C 8002F87C 0400E114 */  bne        $a3, $at, .L8002F890
/* 18080 8002F880 0080013C */   lui       $at, (0x80000000 >> 16)
/* 18084 8002F884 02008114 */  bne        $a0, $at, .L8002F890
/* 18088 8002F888 00000000 */   nop
/* 1808C 8002F88C 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L8002F890:
/* 18090 8002F890 10100000 */  mfhi       $v0
/* 18094 8002F894 00000000 */  nop
/* 18098 8002F898 02004010 */  beqz       $v0, .L8002F8A4
/* 1809C 8002F89C 0100E224 */   addiu     $v0, $a3, 0x1
/* 180A0 8002F8A0 21208700 */  addu       $a0, $a0, $a3
.L8002F8A4:
/* 180A4 8002F8A4 07204400 */  srav       $a0, $a0, $v0
/* 180A8 8002F8A8 0580013C */  lui        $at, %hi(D_800546E0)
/* 180AC 8002F8AC E04624A4 */  sh         $a0, %lo(D_800546E0)($at)
/* 180B0 8002F8B0 85BF0008 */  j          .L8002FE14
/* 180B4 8002F8B4 21100000 */   addu      $v0, $zero, $zero
.L8002F8B8:
/* 180B8 8002F8B8 0580023C */  lui        $v0, %hi(D_800546E0)
/* 180BC 8002F8BC E0464294 */  lhu        $v0, %lo(D_800546E0)($v0)
/* 180C0 8002F8C0 00000000 */  nop
/* 180C4 8002F8C4 04106200 */  sllv       $v0, $v0, $v1
/* 180C8 8002F8C8 84BF0008 */  j          .L8002FE10
/* 180CC 8002F8CC 000002AD */   sw        $v0, 0x0($t0)
.L8002F8D0:
/* 180D0 8002F8D0 0000028D */  lw         $v0, 0x0($t0)
/* 180D4 8002F8D4 00000000 */  nop
/* 180D8 8002F8D8 0580013C */  lui        $at, %hi(D_800546E4)
/* 180DC 8002F8DC E44622AC */  sw         $v0, %lo(D_800546E4)($at)
/* 180E0 8002F8E0 85BF0008 */  j          .L8002FE14
/* 180E4 8002F8E4 21100000 */   addu      $v0, $zero, $zero
.L8002F8E8:
/* 180E8 8002F8E8 0580023C */  lui        $v0, %hi(D_800546E4)
/* 180EC 8002F8EC E446428C */  lw         $v0, %lo(D_800546E4)($v0)
/* 180F0 8002F8F0 84BF0008 */  j          .L8002FE10
/* 180F4 8002F8F4 000002AD */   sw        $v0, 0x0($t0)
.L8002F8F8:
/* 180F8 8002F8F8 9001C494 */  lhu        $a0, 0x190($a2)
/* 180FC 8002F8FC 00000295 */  lhu        $v0, 0x0($t0)
/* 18100 8002F900 00000000 */  nop
/* 18104 8002F904 25108200 */  or         $v0, $a0, $v0
/* 18108 8002F908 21204000 */  addu       $a0, $v0, $zero
/* 1810C 8002F90C 9001C4A4 */  sh         $a0, 0x190($a2)
/* 18110 8002F910 9201C494 */  lhu        $a0, 0x192($a2)
/* 18114 8002F914 02000291 */  lbu        $v0, 0x2($t0)
/* 18118 8002F918 00000000 */  nop
/* 1811C 8002F91C 25208200 */  or         $a0, $a0, $v0
/* 18120 8002F920 9201C4A4 */  sh         $a0, 0x192($a2)
/* 18124 8002F924 85BF0008 */  j          .L8002FE14
/* 18128 8002F928 21100000 */   addu      $v0, $zero, $zero
.L8002F92C:
/* 1812C 8002F92C 9201C294 */  lhu        $v0, 0x192($a2)
/* 18130 8002F930 9001C394 */  lhu        $v1, 0x190($a2)
/* 18134 8002F934 CCBE0008 */  j          .L8002FB30
/* 18138 8002F938 FF004230 */   andi      $v0, $v0, 0xFF
.L8002F93C:
/* 1813C 8002F93C 00000295 */  lhu        $v0, 0x0($t0)
/* 18140 8002F940 9001C494 */  lhu        $a0, 0x190($a2)
/* 18144 8002F944 27100200 */  nor        $v0, $zero, $v0
/* 18148 8002F948 24208200 */  and        $a0, $a0, $v0
/* 1814C 8002F94C 9001C4A4 */  sh         $a0, 0x190($a2)
/* 18150 8002F950 02000291 */  lbu        $v0, 0x2($t0)
/* 18154 8002F954 9201C494 */  lhu        $a0, 0x192($a2)
/* 18158 8002F958 27100200 */  nor        $v0, $zero, $v0
/* 1815C 8002F95C 24208200 */  and        $a0, $a0, $v0
/* 18160 8002F960 9201C4A4 */  sh         $a0, 0x192($a2)
/* 18164 8002F964 85BF0008 */  j          .L8002FE14
/* 18168 8002F968 21100000 */   addu      $v0, $zero, $zero
.L8002F96C:
/* 1816C 8002F96C AA01C494 */  lhu        $a0, 0x1AA($a2)
/* 18170 8002F970 00000295 */  lhu        $v0, 0x0($t0)
/* 18174 8002F974 FFC08330 */  andi       $v1, $a0, 0xC0FF
/* 18178 8002F978 3F004230 */  andi       $v0, $v0, 0x3F
/* 1817C 8002F97C 8BBE0008 */  j          .L8002FA2C
/* 18180 8002F980 00120200 */   sll       $v0, $v0, 8
.L8002F984:
/* 18184 8002F984 0480023C */  lui        $v0, %hi(D_80047D08)
/* 18188 8002F988 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 1818C 8002F98C 00000000 */  nop
/* 18190 8002F990 AA014294 */  lhu        $v0, 0x1AA($v0)
/* 18194 8002F994 00000000 */  nop
/* 18198 8002F998 003F4230 */  andi       $v0, $v0, 0x3F00
/* 1819C 8002F99C 02120200 */  srl        $v0, $v0, 8
/* 181A0 8002F9A0 84BF0008 */  j          .L8002FE10
/* 181A4 8002F9A4 000002A5 */   sh        $v0, 0x0($t0)
.L8002F9A8:
/* 181A8 8002F9A8 9401C294 */  lhu        $v0, 0x194($a2)
/* 181AC 8002F9AC 00000395 */  lhu        $v1, 0x0($t0)
/* 181B0 8002F9B0 00000000 */  nop
/* 181B4 8002F9B4 25104300 */  or         $v0, $v0, $v1
/* 181B8 8002F9B8 9401C2A4 */  sh         $v0, 0x194($a2)
/* 181BC 8002F9BC 02000391 */  lbu        $v1, 0x2($t0)
/* 181C0 8002F9C0 9601C294 */  lhu        $v0, 0x196($a2)
/* 181C4 8002F9C4 00000000 */  nop
/* 181C8 8002F9C8 25104300 */  or         $v0, $v0, $v1
/* 181CC 8002F9CC 9601C2A4 */  sh         $v0, 0x196($a2)
/* 181D0 8002F9D0 85BF0008 */  j          .L8002FE14
/* 181D4 8002F9D4 21100000 */   addu      $v0, $zero, $zero
.L8002F9D8:
/* 181D8 8002F9D8 9601C294 */  lhu        $v0, 0x196($a2)
/* 181DC 8002F9DC 9401C394 */  lhu        $v1, 0x194($a2)
/* 181E0 8002F9E0 CCBE0008 */  j          .L8002FB30
/* 181E4 8002F9E4 FF004230 */   andi      $v0, $v0, 0xFF
.L8002F9E8:
/* 181E8 8002F9E8 00000295 */  lhu        $v0, 0x0($t0)
/* 181EC 8002F9EC 9401C394 */  lhu        $v1, 0x194($a2)
/* 181F0 8002F9F0 27100200 */  nor        $v0, $zero, $v0
/* 181F4 8002F9F4 24186200 */  and        $v1, $v1, $v0
/* 181F8 8002F9F8 9401C3A4 */  sh         $v1, 0x194($a2)
/* 181FC 8002F9FC 02000291 */  lbu        $v0, 0x2($t0)
/* 18200 8002FA00 9601C394 */  lhu        $v1, 0x196($a2)
/* 18204 8002FA04 27100200 */  nor        $v0, $zero, $v0
/* 18208 8002FA08 24186200 */  and        $v1, $v1, $v0
/* 1820C 8002FA0C 9601C3A4 */  sh         $v1, 0x196($a2)
/* 18210 8002FA10 85BF0008 */  j          .L8002FE14
/* 18214 8002FA14 21100000 */   addu      $v0, $zero, $zero
.L8002FA18:
/* 18218 8002FA18 AA01C494 */  lhu        $a0, 0x1AA($a2)
/* 1821C 8002FA1C 00000295 */  lhu        $v0, 0x0($t0)
/* 18220 8002FA20 7FFF8330 */  andi       $v1, $a0, 0xFF7F
/* 18224 8002FA24 01004230 */  andi       $v0, $v0, 0x1
/* 18228 8002FA28 C0110200 */  sll        $v0, $v0, 7
.L8002FA2C:
/* 1822C 8002FA2C 25206200 */  or         $a0, $v1, $v0
/* 18230 8002FA30 AA01C4A4 */  sh         $a0, 0x1AA($a2)
/* 18234 8002FA34 85BF0008 */  j          .L8002FE14
/* 18238 8002FA38 21100000 */   addu      $v0, $zero, $zero
.L8002FA3C:
/* 1823C 8002FA3C AA01C494 */  lhu        $a0, 0x1AA($a2)
/* 18240 8002FA40 00000000 */  nop
/* 18244 8002FA44 80008230 */  andi       $v0, $a0, 0x80
/* 18248 8002FA48 23FF4010 */  beqz       $v0, .L8002F6D8
/* 1824C 8002FA4C 01000234 */   ori       $v0, $zero, 0x1
.L8002FA50:
/* 18250 8002FA50 84BF0008 */  j          .L8002FE10
/* 18254 8002FA54 000002AD */   sw        $v0, 0x0($t0)
.L8002FA58:
/* 18258 8002FA58 00000295 */  lhu        $v0, 0x0($t0)
/* 1825C 8002FA5C 00000000 */  nop
/* 18260 8002FA60 A201C2A4 */  sh         $v0, 0x1A2($a2)
/* 18264 8002FA64 85BF0008 */  j          .L8002FE14
/* 18268 8002FA68 21100000 */   addu      $v0, $zero, $zero
.L8002FA6C:
/* 1826C 8002FA6C 0000048D */  lw         $a0, 0x0($t0)
/* 18270 8002FA70 1000E010 */  beqz       $a3, .L8002FAB4
/* 18274 8002FA74 0100E224 */   addiu     $v0, $a3, 0x1
/* 18278 8002FA78 1A008700 */  div        $zero, $a0, $a3
/* 1827C 8002FA7C 0200E014 */  bnez       $a3, .L8002FA88
/* 18280 8002FA80 00000000 */   nop
/* 18284 8002FA84 0D000700 */  break      7
.L8002FA88:
/* 18288 8002FA88 FFFF0124 */  addiu      $at, $zero, -0x1
/* 1828C 8002FA8C 0400E114 */  bne        $a3, $at, .L8002FAA0
/* 18290 8002FA90 0080013C */   lui       $at, (0x80000000 >> 16)
/* 18294 8002FA94 02008114 */  bne        $a0, $at, .L8002FAA0
/* 18298 8002FA98 00000000 */   nop
/* 1829C 8002FA9C 70170000 */  tge        $zero, $zero, 93 # handwritten instruction
.L8002FAA0:
/* 182A0 8002FAA0 10100000 */  mfhi       $v0
/* 182A4 8002FAA4 00000000 */  nop
/* 182A8 8002FAA8 02004010 */  beqz       $v0, .L8002FAB4
/* 182AC 8002FAAC 0100E224 */   addiu     $v0, $a3, 0x1
/* 182B0 8002FAB0 21208700 */  addu       $a0, $a0, $a3
.L8002FAB4:
/* 182B4 8002FAB4 0480033C */  lui        $v1, %hi(D_80047D08)
/* 182B8 8002FAB8 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 182BC 8002FABC 07204400 */  srav       $a0, $a0, $v0
/* 182C0 8002FAC0 A20164A4 */  sh         $a0, 0x1A2($v1)
/* 182C4 8002FAC4 85BF0008 */  j          .L8002FE14
/* 182C8 8002FAC8 21100000 */   addu      $v0, $zero, $zero
.L8002FACC:
/* 182CC 8002FACC A201C494 */  lhu        $a0, 0x1A2($a2)
/* 182D0 8002FAD0 0100E224 */  addiu      $v0, $a3, 0x1
.L8002FAD4:
/* 182D4 8002FAD4 04204400 */  sllv       $a0, $a0, $v0
/* 182D8 8002FAD8 84BF0008 */  j          .L8002FE10
/* 182DC 8002FADC 000004AD */   sw        $a0, 0x0($t0)
.L8002FAE0:
/* 182E0 8002FAE0 EABF000C */  jal        func_8002FFA8
/* 182E4 8002FAE4 21200001 */   addu      $a0, $t0, $zero
/* 182E8 8002FAE8 85BF0008 */  j          .L8002FE14
/* 182EC 8002FAEC 21100000 */   addu      $v0, $zero, $zero
.L8002FAF0:
/* 182F0 8002FAF0 9801C494 */  lhu        $a0, 0x198($a2)
/* 182F4 8002FAF4 00000295 */  lhu        $v0, 0x0($t0)
/* 182F8 8002FAF8 00000000 */  nop
/* 182FC 8002FAFC 25108200 */  or         $v0, $a0, $v0
/* 18300 8002FB00 21204000 */  addu       $a0, $v0, $zero
/* 18304 8002FB04 9801C4A4 */  sh         $a0, 0x198($a2)
/* 18308 8002FB08 9A01C494 */  lhu        $a0, 0x19A($a2)
/* 1830C 8002FB0C 02000291 */  lbu        $v0, 0x2($t0)
/* 18310 8002FB10 00000000 */  nop
/* 18314 8002FB14 25208200 */  or         $a0, $a0, $v0
/* 18318 8002FB18 9A01C4A4 */  sh         $a0, 0x19A($a2)
/* 1831C 8002FB1C 85BF0008 */  j          .L8002FE14
/* 18320 8002FB20 21100000 */   addu      $v0, $zero, $zero
.L8002FB24:
/* 18324 8002FB24 9A01C294 */  lhu        $v0, 0x19A($a2)
/* 18328 8002FB28 9801C394 */  lhu        $v1, 0x198($a2)
/* 1832C 8002FB2C FF004230 */  andi       $v0, $v0, 0xFF
.L8002FB30:
/* 18330 8002FB30 00140200 */  sll        $v0, $v0, 16
/* 18334 8002FB34 25186200 */  or         $v1, $v1, $v0
/* 18338 8002FB38 84BF0008 */  j          .L8002FE10
/* 1833C 8002FB3C 000003AD */   sw        $v1, 0x0($t0)
.L8002FB40:
/* 18340 8002FB40 0480023C */  lui        $v0, %hi(D_80047D08)
/* 18344 8002FB44 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 18348 8002FB48 00000395 */  lhu        $v1, 0x0($t0)
/* 1834C 8002FB4C 98014494 */  lhu        $a0, 0x198($v0)
/* 18350 8002FB50 27180300 */  nor        $v1, $zero, $v1
/* 18354 8002FB54 24208300 */  and        $a0, $a0, $v1
/* 18358 8002FB58 980144A4 */  sh         $a0, 0x198($v0)
/* 1835C 8002FB5C 02000391 */  lbu        $v1, 0x2($t0)
/* 18360 8002FB60 9A014494 */  lhu        $a0, 0x19A($v0)
/* 18364 8002FB64 27180300 */  nor        $v1, $zero, $v1
/* 18368 8002FB68 24208300 */  and        $a0, $a0, $v1
/* 1836C 8002FB6C 9A0144A4 */  sh         $a0, 0x19A($v0)
/* 18370 8002FB70 85BF0008 */  j          .L8002FE14
/* 18374 8002FB74 21100000 */   addu      $v0, $zero, $zero
.L8002FB78:
/* 18378 8002FB78 1EC1000C */  jal        func_80030478
/* 1837C 8002FB7C 21200001 */   addu      $a0, $t0, $zero
/* 18380 8002FB80 85BF0008 */  j          .L8002FE14
/* 18384 8002FB84 21100000 */   addu      $v0, $zero, $zero
.L8002FB88:
/* 18388 8002FB88 04C2000C */  jal        func_80030810
/* 1838C 8002FB8C 21200001 */   addu      $a0, $t0, $zero
/* 18390 8002FB90 85BF0008 */  j          .L8002FE14
/* 18394 8002FB94 21100000 */   addu      $v0, $zero, $zero
.L8002FB98:
/* 18398 8002FB98 00000295 */  lhu        $v0, 0x0($t0)
/* 1839C 8002FB9C 00000000 */  nop
/* 183A0 8002FBA0 8801C2A4 */  sh         $v0, 0x188($a2)
/* 183A4 8002FBA4 02000291 */  lbu        $v0, 0x2($t0)
/* 183A8 8002FBA8 00000000 */  nop
/* 183AC 8002FBAC 8A01C2A4 */  sh         $v0, 0x18A($a2)
/* 183B0 8002FBB0 85BF0008 */  j          .L8002FE14
/* 183B4 8002FBB4 21100000 */   addu      $v0, $zero, $zero
.L8002FBB8:
/* 183B8 8002FBB8 00000295 */  lhu        $v0, 0x0($t0)
/* 183BC 8002FBBC 00000000 */  nop
/* 183C0 8002FBC0 8C01C2A4 */  sh         $v0, 0x18C($a2)
/* 183C4 8002FBC4 02000291 */  lbu        $v0, 0x2($t0)
/* 183C8 8002FBC8 00000000 */  nop
/* 183CC 8002FBCC 8E01C2A4 */  sh         $v0, 0x18E($a2)
/* 183D0 8002FBD0 85BF0008 */  j          .L8002FE14
/* 183D4 8002FBD4 21100000 */   addu      $v0, $zero, $zero
.L8002FBD8:
/* 183D8 8002FBD8 A601C0A4 */  sh         $zero, 0x1A6($a2)
/* 183DC 8002FBDC AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 183E0 8002FBE0 0480043C */  lui        $a0, %hi(D_80047D20)
/* 183E4 8002FBE4 207D848C */  lw         $a0, %lo(D_80047D20)($a0)
/* 183E8 8002FBE8 30004234 */  ori        $v0, $v0, 0x30
/* 183EC 8002FBEC AA01C2A4 */  sh         $v0, 0x1AA($a2)
/* 183F0 8002FBF0 0000828C */  lw         $v0, 0x0($a0)
/* 183F4 8002FBF4 FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
/* 183F8 8002FBF8 24104300 */  and        $v0, $v0, $v1
/* 183FC 8002FBFC 0022033C */  lui        $v1, (0x22000000 >> 16)
/* 18400 8002FC00 25104300 */  or         $v0, $v0, $v1
/* 18404 8002FC04 000082AC */  sw         $v0, 0x0($a0)
/* 18408 8002FC08 0480043C */  lui        $a0, %hi(D_80047D1C)
/* 1840C 8002FC0C 1C7D848C */  lw         $a0, %lo(D_80047D1C)($a0)
/* 18410 8002FC10 4000053C */  lui        $a1, (0x400010 >> 16)
/* 18414 8002FC14 0000828C */  lw         $v0, 0x0($a0)
/* 18418 8002FC18 9000033C */  lui        $v1, (0x900000 >> 16)
/* 1841C 8002FC1C 25104300 */  or         $v0, $v0, $v1
/* 18420 8002FC20 000082AC */  sw         $v0, 0x0($a0)
/* 18424 8002FC24 0480043C */  lui        $a0, %hi(D_80047D18)
/* 18428 8002FC28 187D848C */  lw         $a0, %lo(D_80047D18)($a0)
/* 1842C 8002FC2C 1000A534 */  ori        $a1, $a1, (0x400010 & 0xFFFF)
/* 18430 8002FC30 0000828C */  lw         $v0, 0x0($a0)
/* 18434 8002FC34 0800033C */  lui        $v1, (0x80000 >> 16)
/* 18438 8002FC38 25104300 */  or         $v0, $v0, $v1
/* 1843C 8002FC3C 000082AC */  sw         $v0, 0x0($a0)
/* 18440 8002FC40 0480023C */  lui        $v0, %hi(D_80047D0C)
/* 18444 8002FC44 0C7D428C */  lw         $v0, %lo(D_80047D0C)($v0)
/* 18448 8002FC48 0001043C */  lui        $a0, (0x1000200 >> 16)
/* 1844C 8002FC4C 000048AC */  sw         $t0, 0x0($v0)
/* 18450 8002FC50 0480023C */  lui        $v0, %hi(D_80047D10)
/* 18454 8002FC54 107D428C */  lw         $v0, %lo(D_80047D10)($v0)
/* 18458 8002FC58 00028434 */  ori        $a0, $a0, (0x1000200 & 0xFFFF)
/* 1845C 8002FC5C 000045AC */  sw         $a1, 0x0($v0)
/* 18460 8002FC60 0480033C */  lui        $v1, %hi(D_80047D14)
/* 18464 8002FC64 147D638C */  lw         $v1, %lo(D_80047D14)($v1)
/* 18468 8002FC68 01000234 */  ori        $v0, $zero, 0x1
/* 1846C 8002FC6C 0580013C */  lui        $at, %hi(D_800546EC)
/* 18470 8002FC70 EC4622AC */  sw         $v0, %lo(D_800546EC)($at)
/* 18474 8002FC74 000064AC */  sw         $a0, 0x0($v1)
/* 18478 8002FC78 76BF0008 */  j          .L8002FDD8
/* 1847C 8002FC7C 00000000 */   nop
.L8002FC80:
/* 18480 8002FC80 A601C0A4 */  sh         $zero, 0x1A6($a2)
/* 18484 8002FC84 AA01C294 */  lhu        $v0, 0x1AA($a2)
/* 18488 8002FC88 0480043C */  lui        $a0, %hi(D_80047D20)
/* 1848C 8002FC8C 207D848C */  lw         $a0, %lo(D_80047D20)($a0)
/* 18490 8002FC90 30004234 */  ori        $v0, $v0, 0x30
/* 18494 8002FC94 AA01C2A4 */  sh         $v0, 0x1AA($a2)
/* 18498 8002FC98 0000828C */  lw         $v0, 0x0($a0)
/* 1849C 8002FC9C FFFF6334 */  ori        $v1, $v1, (0xF0FFFFFF & 0xFFFF)
/* 184A0 8002FCA0 24104300 */  and        $v0, $v0, $v1
/* 184A4 8002FCA4 0022033C */  lui        $v1, (0x22000000 >> 16)
/* 184A8 8002FCA8 25104300 */  or         $v0, $v0, $v1
/* 184AC 8002FCAC 000082AC */  sw         $v0, 0x0($a0)
/* 184B0 8002FCB0 0480043C */  lui        $a0, %hi(D_80047D1C)
/* 184B4 8002FCB4 1C7D848C */  lw         $a0, %lo(D_80047D1C)($a0)
/* 184B8 8002FCB8 2000053C */  lui        $a1, (0x200010 >> 16)
/* 184BC 8002FCBC 0000828C */  lw         $v0, 0x0($a0)
/* 184C0 8002FCC0 9000033C */  lui        $v1, (0x900000 >> 16)
/* 184C4 8002FCC4 25104300 */  or         $v0, $v0, $v1
/* 184C8 8002FCC8 000082AC */  sw         $v0, 0x0($a0)
/* 184CC 8002FCCC 0480043C */  lui        $a0, %hi(D_80047D18)
/* 184D0 8002FCD0 187D848C */  lw         $a0, %lo(D_80047D18)($a0)
/* 184D4 8002FCD4 1000A534 */  ori        $a1, $a1, (0x200010 & 0xFFFF)
/* 184D8 8002FCD8 0000828C */  lw         $v0, 0x0($a0)
/* 184DC 8002FCDC 0800033C */  lui        $v1, (0x80000 >> 16)
/* 184E0 8002FCE0 25104300 */  or         $v0, $v0, $v1
/* 184E4 8002FCE4 000082AC */  sw         $v0, 0x0($a0)
/* 184E8 8002FCE8 0480023C */  lui        $v0, %hi(D_80047D0C)
/* 184EC 8002FCEC 0C7D428C */  lw         $v0, %lo(D_80047D0C)($v0)
/* 184F0 8002FCF0 0001043C */  lui        $a0, (0x1000200 >> 16)
/* 184F4 8002FCF4 000048AC */  sw         $t0, 0x0($v0)
/* 184F8 8002FCF8 0480023C */  lui        $v0, %hi(D_80047D10)
/* 184FC 8002FCFC 107D428C */  lw         $v0, %lo(D_80047D10)($v0)
/* 18500 8002FD00 00028434 */  ori        $a0, $a0, (0x1000200 & 0xFFFF)
/* 18504 8002FD04 000045AC */  sw         $a1, 0x0($v0)
/* 18508 8002FD08 0480033C */  lui        $v1, %hi(D_80047D14)
/* 1850C 8002FD0C 147D638C */  lw         $v1, %lo(D_80047D14)($v1)
/* 18510 8002FD10 01000234 */  ori        $v0, $zero, 0x1
/* 18514 8002FD14 0580013C */  lui        $at, %hi(D_800546EC)
/* 18518 8002FD18 EC4622AC */  sw         $v0, %lo(D_800546EC)($at)
/* 1851C 8002FD1C 000064AC */  sw         $a0, 0x0($v1)
/* 18520 8002FD20 76BF0008 */  j          .L8002FDD8
/* 18524 8002FD24 00000000 */   nop
.L8002FD28:
/* 18528 8002FD28 FFFFA534 */  ori        $a1, $a1, (0xF0FFFFFF & 0xFFFF)
/* 1852C 8002FD2C 00010234 */  ori        $v0, $zero, 0x100
/* 18530 8002FD30 0480033C */  lui        $v1, %hi(D_80047D08)
/* 18534 8002FD34 087D638C */  lw         $v1, %lo(D_80047D08)($v1)
/* 18538 8002FD38 2000063C */  lui        $a2, (0x200010 >> 16)
/* 1853C 8002FD3C A60162A4 */  sh         $v0, 0x1A6($v1)
/* 18540 8002FD40 AA016294 */  lhu        $v0, 0x1AA($v1)
/* 18544 8002FD44 0480043C */  lui        $a0, %hi(D_80047D20)
/* 18548 8002FD48 207D848C */  lw         $a0, %lo(D_80047D20)($a0)
/* 1854C 8002FD4C 30004234 */  ori        $v0, $v0, 0x30
/* 18550 8002FD50 AA0162A4 */  sh         $v0, 0x1AA($v1)
/* 18554 8002FD54 0000828C */  lw         $v0, 0x0($a0)
/* 18558 8002FD58 0022033C */  lui        $v1, (0x22000000 >> 16)
/* 1855C 8002FD5C 24104500 */  and        $v0, $v0, $a1
/* 18560 8002FD60 25104300 */  or         $v0, $v0, $v1
/* 18564 8002FD64 000082AC */  sw         $v0, 0x0($a0)
/* 18568 8002FD68 0480043C */  lui        $a0, %hi(D_80047D1C)
/* 1856C 8002FD6C 1C7D848C */  lw         $a0, %lo(D_80047D1C)($a0)
/* 18570 8002FD70 1000C634 */  ori        $a2, $a2, (0x200010 & 0xFFFF)
/* 18574 8002FD74 0000828C */  lw         $v0, 0x0($a0)
/* 18578 8002FD78 9000033C */  lui        $v1, (0x900000 >> 16)
/* 1857C 8002FD7C 25104300 */  or         $v0, $v0, $v1
/* 18580 8002FD80 000082AC */  sw         $v0, 0x0($a0)
/* 18584 8002FD84 0480043C */  lui        $a0, %hi(D_80047D18)
/* 18588 8002FD88 187D848C */  lw         $a0, %lo(D_80047D18)($a0)
/* 1858C 8002FD8C 0001053C */  lui        $a1, (0x1000200 >> 16)
/* 18590 8002FD90 0000828C */  lw         $v0, 0x0($a0)
/* 18594 8002FD94 0800033C */  lui        $v1, (0x80000 >> 16)
/* 18598 8002FD98 25104300 */  or         $v0, $v0, $v1
/* 1859C 8002FD9C 000082AC */  sw         $v0, 0x0($a0)
/* 185A0 8002FDA0 0480033C */  lui        $v1, %hi(D_80047D0C)
/* 185A4 8002FDA4 0C7D638C */  lw         $v1, %lo(D_80047D0C)($v1)
/* 185A8 8002FDA8 00080225 */  addiu      $v0, $t0, 0x800
/* 185AC 8002FDAC 000062AC */  sw         $v0, 0x0($v1)
/* 185B0 8002FDB0 0480023C */  lui        $v0, %hi(D_80047D10)
/* 185B4 8002FDB4 107D428C */  lw         $v0, %lo(D_80047D10)($v0)
/* 185B8 8002FDB8 0002A534 */  ori        $a1, $a1, (0x1000200 & 0xFFFF)
/* 185BC 8002FDBC 000046AC */  sw         $a2, 0x0($v0)
/* 185C0 8002FDC0 0480033C */  lui        $v1, %hi(D_80047D14)
/* 185C4 8002FDC4 147D638C */  lw         $v1, %lo(D_80047D14)($v1)
/* 185C8 8002FDC8 01000234 */  ori        $v0, $zero, 0x1
/* 185CC 8002FDCC 0580013C */  lui        $at, %hi(D_800546EC)
/* 185D0 8002FDD0 EC4622AC */  sw         $v0, %lo(D_800546EC)($at)
/* 185D4 8002FDD4 000065AC */  sw         $a1, 0x0($v1)
.L8002FDD8:
/* 185D8 8002FDD8 0480023C */  lui        $v0, %hi(D_80047D08)
/* 185DC 8002FDDC 087D428C */  lw         $v0, %lo(D_80047D08)($v0)
/* 185E0 8002FDE0 00000000 */  nop
/* 185E4 8002FDE4 AE014294 */  lhu        $v0, 0x1AE($v0)
/* 185E8 8002FDE8 00000000 */  nop
/* 185EC 8002FDEC 00084230 */  andi       $v0, $v0, 0x800
/* 185F0 8002FDF0 85BF0008 */  j          .L8002FE14
/* 185F4 8002FDF4 0100422C */   sltiu     $v0, $v0, 0x1
.L8002FDF8:
/* 185F8 8002FDF8 0280043C */  lui        $a0, %hi(D_8001882C)
/* 185FC 8002FDFC 2C888424 */  addiu      $a0, $a0, %lo(D_8001882C)
/* 18600 8002FE00 0280053C */  lui        $a1, %hi(D_80018874)
/* 18604 8002FE04 7488A524 */  addiu      $a1, $a1, %lo(D_80018874)
/* 18608 8002FE08 1E8F000C */  jal        k_printf
/* 1860C 8002FE0C 00000000 */   nop
.L8002FE10:
/* 18610 8002FE10 21100000 */  addu       $v0, $zero, $zero
.L8002FE14:
/* 18614 8002FE14 1000BF8F */  lw         $ra, 0x10($sp)
/* 18618 8002FE18 1800BD27 */  addiu      $sp, $sp, 0x18
/* 1861C 8002FE1C 0800E003 */  jr         $ra
/* 18620 8002FE20 00000000 */   nop
