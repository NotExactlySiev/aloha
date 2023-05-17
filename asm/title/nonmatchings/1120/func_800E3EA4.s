.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3EA4
/* 46A4 800E3EA4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 46A8 800E3EA8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 46AC 800E3EAC D887030C */  jal        func_800E1F60
/* 46B0 800E3EB0 1800B0AF */   sw        $s0, 0x18($sp)
/* 46B4 800E3EB4 00010234 */  ori        $v0, $zero, 0x100
/* 46B8 800E3EB8 0F80013C */  lui        $at, %hi(D_800F4E30)
/* 46BC 800E3EBC 304E22AC */  sw         $v0, %lo(D_800F4E30)($at)
/* 46C0 800E3EC0 01001034 */  ori        $s0, $zero, 0x1
/* 46C4 800E3EC4 0F80013C */  lui        $at, %hi(D_800F4E38)
/* 46C8 800E3EC8 384E30AC */  sw         $s0, %lo(D_800F4E38)($at)
/* 46CC 800E3ECC 1E9D030C */  jal        func_800E7478
/* 46D0 800E3ED0 00000000 */   nop
/* 46D4 800E3ED4 1A80013C */  lui        $at, %hi(D_801A0FA8)
/* 46D8 800E3ED8 A80F20AC */  sw         $zero, %lo(D_801A0FA8)($at)
/* 46DC 800E3EDC 0F80013C */  lui        $at, %hi(D_800F4E70)
/* 46E0 800E3EE0 704E30AC */  sw         $s0, %lo(D_800F4E70)($at)
/* 46E4 800E3EE4 0F80013C */  lui        $at, %hi(D_800F4CBC)
/* 46E8 800E3EE8 BC4C20AC */  sw         $zero, %lo(D_800F4CBC)($at)
/* 46EC 800E3EEC 0F80013C */  lui        $at, %hi(D_800F4CC0)
/* 46F0 800E3EF0 C04C20AC */  sw         $zero, %lo(D_800F4CC0)($at)
/* 46F4 800E3EF4 BA93030C */  jal        func_800E4EE8
/* 46F8 800E3EF8 00000000 */   nop
/* 46FC 800E3EFC 80030234 */  ori        $v0, $zero, 0x380
/* 4700 800E3F00 1000A2A7 */  sh         $v0, 0x10($sp)
/* 4704 800E3F04 1200A0A7 */  sh         $zero, 0x12($sp)
/* 4708 800E3F08 80000234 */  ori        $v0, $zero, 0x80
/* 470C 800E3F0C 1400A2A7 */  sh         $v0, 0x14($sp)
/* 4710 800E3F10 00010234 */  ori        $v0, $zero, 0x100
/* 4714 800E3F14 1600A2A7 */  sh         $v0, 0x16($sp)
/* 4718 800E3F18 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 471C 800E3F1C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4720 800E3F20 1000A427 */  addiu      $a0, $sp, 0x10
/* 4724 800E3F24 21280000 */  addu       $a1, $zero, $zero
/* 4728 800E3F28 2C06428C */  lw         $v0, 0x62C($v0)
/* 472C 800E3F2C 21300000 */  addu       $a2, $zero, $zero
/* 4730 800E3F30 09F84000 */  jalr       $v0
/* 4734 800E3F34 21380000 */   addu      $a3, $zero, $zero
/* 4738 800E3F38 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 473C 800E3F3C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4740 800E3F40 00000000 */  nop
/* 4744 800E3F44 3006428C */  lw         $v0, 0x630($v0)
/* 4748 800E3F48 00000000 */  nop
/* 474C 800E3F4C 09F84000 */  jalr       $v0
/* 4750 800E3F50 21200000 */   addu      $a0, $zero, $zero
/* 4754 800E3F54 20000234 */  ori        $v0, $zero, 0x20
/* 4758 800E3F58 1200A2A7 */  sh         $v0, 0x12($sp)
/* 475C 800E3F5C 0F80043C */  lui        $a0, %hi(D_800EB2B8)
/* 4760 800E3F60 B8B28424 */  addiu      $a0, $a0, %lo(D_800EB2B8)
/* 4764 800E3F64 7E8F030C */  jal        func_800E3DF8
/* 4768 800E3F68 1000A527 */   addiu     $a1, $sp, 0x10
/* 476C 800E3F6C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4770 800E3F70 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4774 800E3F74 00000000 */  nop
/* 4778 800E3F78 3006428C */  lw         $v0, 0x630($v0)
/* 477C 800E3F7C 00000000 */  nop
/* 4780 800E3F80 09F84000 */  jalr       $v0
/* 4784 800E3F84 21200000 */   addu      $a0, $zero, $zero
/* 4788 800E3F88 30000234 */  ori        $v0, $zero, 0x30
/* 478C 800E3F8C 1200A2A7 */  sh         $v0, 0x12($sp)
/* 4790 800E3F90 0F80043C */  lui        $a0, %hi(D_800EB2FC)
/* 4794 800E3F94 FCB28424 */  addiu      $a0, $a0, %lo(D_800EB2FC)
/* 4798 800E3F98 7E8F030C */  jal        func_800E3DF8
/* 479C 800E3F9C 1000A527 */   addiu     $a1, $sp, 0x10
/* 47A0 800E3FA0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 47A4 800E3FA4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 47A8 800E3FA8 00000000 */  nop
/* 47AC 800E3FAC 3006428C */  lw         $v0, 0x630($v0)
/* 47B0 800E3FB0 00000000 */  nop
/* 47B4 800E3FB4 09F84000 */  jalr       $v0
/* 47B8 800E3FB8 21200000 */   addu      $a0, $zero, $zero
/* 47BC 800E3FBC 40000234 */  ori        $v0, $zero, 0x40
/* 47C0 800E3FC0 1200A2A7 */  sh         $v0, 0x12($sp)
/* 47C4 800E3FC4 0F80043C */  lui        $a0, %hi(D_800EB2D8)
/* 47C8 800E3FC8 D8B28424 */  addiu      $a0, $a0, %lo(D_800EB2D8)
/* 47CC 800E3FCC 7E8F030C */  jal        func_800E3DF8
/* 47D0 800E3FD0 1000A527 */   addiu     $a1, $sp, 0x10
/* 47D4 800E3FD4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 47D8 800E3FD8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 47DC 800E3FDC 00000000 */  nop
/* 47E0 800E3FE0 3006428C */  lw         $v0, 0x630($v0)
/* 47E4 800E3FE4 00000000 */  nop
/* 47E8 800E3FE8 09F84000 */  jalr       $v0
/* 47EC 800E3FEC 21200000 */   addu      $a0, $zero, $zero
/* 47F0 800E3FF0 50000234 */  ori        $v0, $zero, 0x50
/* 47F4 800E3FF4 1200A2A7 */  sh         $v0, 0x12($sp)
/* 47F8 800E3FF8 0F80043C */  lui        $a0, %hi(D_800EB31C)
/* 47FC 800E3FFC 1CB38424 */  addiu      $a0, $a0, %lo(D_800EB31C)
/* 4800 800E4000 7E8F030C */  jal        func_800E3DF8
/* 4804 800E4004 1000A527 */   addiu     $a1, $sp, 0x10
/* 4808 800E4008 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 480C 800E400C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4810 800E4010 00000000 */  nop
/* 4814 800E4014 3006428C */  lw         $v0, 0x630($v0)
/* 4818 800E4018 00000000 */  nop
/* 481C 800E401C 09F84000 */  jalr       $v0
/* 4820 800E4020 21200000 */   addu      $a0, $zero, $zero
/* 4824 800E4024 1200A0A7 */  sh         $zero, 0x12($sp)
/* 4828 800E4028 0F80043C */  lui        $a0, %hi(D_800EB338)
/* 482C 800E402C 38B38424 */  addiu      $a0, $a0, %lo(D_800EB338)
/* 4830 800E4030 7E8F030C */  jal        func_800E3DF8
/* 4834 800E4034 1000A527 */   addiu     $a1, $sp, 0x10
/* 4838 800E4038 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 483C 800E403C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4840 800E4040 00000000 */  nop
/* 4844 800E4044 3006428C */  lw         $v0, 0x630($v0)
/* 4848 800E4048 00000000 */  nop
/* 484C 800E404C 09F84000 */  jalr       $v0
/* 4850 800E4050 21200000 */   addu      $a0, $zero, $zero
/* 4854 800E4054 10000234 */  ori        $v0, $zero, 0x10
/* 4858 800E4058 1200A2A7 */  sh         $v0, 0x12($sp)
/* 485C 800E405C 0F80043C */  lui        $a0, %hi(D_800EB358)
/* 4860 800E4060 58B38424 */  addiu      $a0, $a0, %lo(D_800EB358)
/* 4864 800E4064 7E8F030C */  jal        func_800E3DF8
/* 4868 800E4068 1000A527 */   addiu     $a1, $sp, 0x10
/* 486C 800E406C 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4870 800E4070 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4874 800E4074 00000000 */  nop
/* 4878 800E4078 3006428C */  lw         $v0, 0x630($v0)
/* 487C 800E407C 00000000 */  nop
/* 4880 800E4080 09F84000 */  jalr       $v0
/* 4884 800E4084 21200000 */   addu      $a0, $zero, $zero
/* 4888 800E4088 21200000 */  addu       $a0, $zero, $zero
/* 488C 800E408C 8795030C */  jal        func_800E561C
/* 4890 800E4090 02000534 */   ori       $a1, $zero, 0x2
/* 4894 800E4094 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4898 800E4098 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 489C 800E409C 00000000 */  nop
/* 48A0 800E40A0 3C0C428C */  lw         $v0, 0xC3C($v0)
/* 48A4 800E40A4 00000000 */  nop
/* 48A8 800E40A8 09F84000 */  jalr       $v0
/* 48AC 800E40AC 00000000 */   nop
/* 48B0 800E40B0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 48B4 800E40B4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 48B8 800E40B8 00000000 */  nop
/* 48BC 800E40BC A404428C */  lw         $v0, 0x4A4($v0)
/* 48C0 800E40C0 0F80043C */  lui        $a0, %hi(D_800F4CB8)
/* 48C4 800E40C4 B84C8424 */  addiu      $a0, $a0, %lo(D_800F4CB8)
/* 48C8 800E40C8 09F84000 */  jalr       $v0
/* 48CC 800E40CC 00000000 */   nop
/* 48D0 800E40D0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 48D4 800E40D4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 48D8 800E40D8 00000000 */  nop
/* 48DC 800E40DC 140C428C */  lw         $v0, 0xC14($v0)
/* 48E0 800E40E0 00000000 */  nop
/* 48E4 800E40E4 09F84000 */  jalr       $v0
/* 48E8 800E40E8 00300434 */   ori       $a0, $zero, 0x3000
/* 48EC 800E40EC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 48F0 800E40F0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 48F4 800E40F4 00000000 */  nop
/* 48F8 800E40F8 180C428C */  lw         $v0, 0xC18($v0)
/* 48FC 800E40FC 00000000 */  nop
/* 4900 800E4100 09F84000 */  jalr       $v0
/* 4904 800E4104 21200000 */   addu      $a0, $zero, $zero
/* 4908 800E4108 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 490C 800E410C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4910 800E4110 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 4914 800E4114 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 4918 800E4118 E7004490 */  lbu        $a0, 0xE7($v0)
/* 491C 800E411C 080C628C */  lw         $v0, 0xC08($v1)
/* 4920 800E4120 00000000 */  nop
/* 4924 800E4124 09F84000 */  jalr       $v0
/* 4928 800E4128 2B200400 */   sltu      $a0, $zero, $a0
/* 492C 800E412C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 4930 800E4130 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 4934 800E4134 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 4938 800E4138 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 493C 800E413C EA004490 */  lbu        $a0, 0xEA($v0)
/* 4940 800E4140 2800628C */  lw         $v0, 0x28($v1)
/* 4944 800E4144 00000000 */  nop
/* 4948 800E4148 09F84000 */  jalr       $v0
/* 494C 800E414C 00000000 */   nop
/* 4950 800E4150 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4954 800E4154 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4958 800E4158 00000000 */  nop
/* 495C 800E415C 1C00428C */  lw         $v0, 0x1C($v0)
/* 4960 800E4160 0F80013C */  lui        $at, %hi(D_800F4E40)
/* 4964 800E4164 404E20AC */  sw         $zero, %lo(D_800F4E40)($at)
/* 4968 800E4168 09F84000 */  jalr       $v0
/* 496C 800E416C 00000000 */   nop
/* 4970 800E4170 0E005014 */  bne        $v0, $s0, .L800E41AC
/* 4974 800E4174 99090234 */   ori       $v0, $zero, 0x999
/* 4978 800E4178 0F80013C */  lui        $at, %hi(D_800F4D0C)
/* 497C 800E417C 0C4D22AC */  sw         $v0, %lo(D_800F4D0C)($at)
/* 4980 800E4180 CC4C0234 */  ori        $v0, $zero, 0x4CCC
/* 4984 800E4184 0F80013C */  lui        $at, %hi(D_800F4D10)
/* 4988 800E4188 104D22AC */  sw         $v0, %lo(D_800F4D10)($at)
/* 498C 800E418C A0050234 */  ori        $v0, $zero, 0x5A0
/* 4990 800E4190 0F80013C */  lui        $at, %hi(D_800F4E08)
/* 4994 800E4194 084E22AC */  sw         $v0, %lo(D_800F4E08)($at)
/* 4998 800E4198 09000234 */  ori        $v0, $zero, 0x9
/* 499C 800E419C 0F80013C */  lui        $at, %hi(D_800F4E18)
/* 49A0 800E41A0 184E22AC */  sw         $v0, %lo(D_800F4E18)($at)
/* 49A4 800E41A4 78900308 */  j          .L800E41E0
/* 49A8 800E41A8 08000234 */   ori       $v0, $zero, 0x8
.L800E41AC:
/* 49AC 800E41AC 00080234 */  ori        $v0, $zero, 0x800
/* 49B0 800E41B0 0F80013C */  lui        $at, %hi(D_800F4D0C)
/* 49B4 800E41B4 0C4D22AC */  sw         $v0, %lo(D_800F4D0C)($at)
/* 49B8 800E41B8 00400234 */  ori        $v0, $zero, 0x4000
/* 49BC 800E41BC 0F80013C */  lui        $at, %hi(D_800F4D10)
/* 49C0 800E41C0 104D22AC */  sw         $v0, %lo(D_800F4D10)($at)
/* 49C4 800E41C4 B0040234 */  ori        $v0, $zero, 0x4B0
/* 49C8 800E41C8 0F80013C */  lui        $at, %hi(D_800F4E08)
/* 49CC 800E41CC 084E22AC */  sw         $v0, %lo(D_800F4E08)($at)
/* 49D0 800E41D0 08000234 */  ori        $v0, $zero, 0x8
/* 49D4 800E41D4 0F80013C */  lui        $at, %hi(D_800F4E18)
/* 49D8 800E41D8 184E22AC */  sw         $v0, %lo(D_800F4E18)($at)
/* 49DC 800E41DC 0A000234 */  ori        $v0, $zero, 0xA
.L800E41E0:
/* 49E0 800E41E0 0F80013C */  lui        $at, %hi(D_800F4EC8)
/* 49E4 800E41E4 C84E22AC */  sw         $v0, %lo(D_800F4EC8)($at)
/* 49E8 800E41E8 7B82030C */  jal        func_800E09EC
/* 49EC 800E41EC 00000000 */   nop
/* 49F0 800E41F0 9882030C */  jal        func_800E0A60
/* 49F4 800E41F4 00000000 */   nop
/* 49F8 800E41F8 7B82030C */  jal        func_800E09EC
/* 49FC 800E41FC 00000000 */   nop
/* 4A00 800E4200 9882030C */  jal        func_800E0A60
/* 4A04 800E4204 00000000 */   nop
/* 4A08 800E4208 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4A0C 800E420C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4A10 800E4210 00000000 */  nop
/* 4A14 800E4214 0406428C */  lw         $v0, 0x604($v0)
/* 4A18 800E4218 00000000 */  nop
/* 4A1C 800E421C 09F84000 */  jalr       $v0
/* 4A20 800E4220 21200000 */   addu      $a0, $zero, $zero
/* 4A24 800E4224 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 4A28 800E4228 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 4A2C 800E422C 00000000 */  nop
/* 4A30 800E4230 0C06428C */  lw         $v0, 0x60C($v0)
/* 4A34 800E4234 00000000 */  nop
/* 4A38 800E4238 09F84000 */  jalr       $v0
/* 4A3C 800E423C 01000434 */   ori       $a0, $zero, 0x1
/* 4A40 800E4240 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 4A44 800E4244 1800B08F */  lw         $s0, 0x18($sp)
/* 4A48 800E4248 0800E003 */  jr         $ra
/* 4A4C 800E424C 2000BD27 */   addiu     $sp, $sp, 0x20
