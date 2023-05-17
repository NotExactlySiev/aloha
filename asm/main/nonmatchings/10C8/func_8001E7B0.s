.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001E7B0
/* 6FB0 8001E7B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 6FB4 8001E7B4 1000BFAF */  sw         $ra, 0x10($sp)
/* 6FB8 8001E7B8 0580023C */  lui        $v0, %hi(D_8004DD80)
/* 6FBC 8001E7BC 80DD4224 */  addiu      $v0, $v0, %lo(D_8004DD80)
/* 6FC0 8001E7C0 0480013C */  lui        $at, %hi(D_80047F6C)
/* 6FC4 8001E7C4 6C7F22AC */  sw         $v0, %lo(D_80047F6C)($at)
/* 6FC8 8001E7C8 0580023C */  lui        $v0, %hi(D_8004FD80)
/* 6FCC 8001E7CC 80FD4224 */  addiu      $v0, $v0, %lo(D_8004FD80)
/* 6FD0 8001E7D0 0480013C */  lui        $at, %hi(D_80047F74)
/* 6FD4 8001E7D4 747F22AC */  sw         $v0, %lo(D_80047F74)($at)
/* 6FD8 8001E7D8 0580023C */  lui        $v0, %hi(D_80051E60)
/* 6FDC 8001E7DC 601E4224 */  addiu      $v0, $v0, %lo(D_80051E60)
/* 6FE0 8001E7E0 0480013C */  lui        $at, %hi(D_80047F7C)
/* 6FE4 8001E7E4 7C7F22AC */  sw         $v0, %lo(D_80047F7C)($at)
/* 6FE8 8001E7E8 0480013C */  lui        $at, %hi(D_80047F8C)
/* 6FEC 8001E7EC 8C7F20AC */  sw         $zero, %lo(D_80047F8C)($at)
/* 6FF0 8001E7F0 0480013C */  lui        $at, %hi(D_80047F84)
/* 6FF4 8001E7F4 847F20AC */  sw         $zero, %lo(D_80047F84)($at)
/* 6FF8 8001E7F8 0480013C */  lui        $at, %hi(D_80047F94)
/* 6FFC 8001E7FC 947F20AC */  sw         $zero, %lo(D_80047F94)($at)
/* 7000 8001E800 0480013C */  lui        $at, %hi(D_80047FA4)
/* 7004 8001E804 A47F20AC */  sw         $zero, %lo(D_80047FA4)($at)
/* 7008 8001E808 21180000 */  addu       $v1, $zero, $zero
.L8001E80C:
/* 700C 8001E80C 0580013C */  lui        $at, %hi(D_80051DB6)
/* 7010 8001E810 B61D2124 */  addiu      $at, $at, %lo(D_80051DB6)
/* 7014 8001E814 21082300 */  addu       $at, $at, $v1
/* 7018 8001E818 000020A0 */  sb         $zero, 0x0($at)
/* 701C 8001E81C 0580013C */  lui        $at, %hi(D_80051DB7)
/* 7020 8001E820 B71D2124 */  addiu      $at, $at, %lo(D_80051DB7)
/* 7024 8001E824 21082300 */  addu       $at, $at, $v1
/* 7028 8001E828 000020A0 */  sb         $zero, 0x0($at)
/* 702C 8001E82C 38006324 */  addiu      $v1, $v1, 0x38
/* 7030 8001E830 E0006228 */  slti       $v0, $v1, 0xE0
/* 7034 8001E834 F5FF4014 */  bnez       $v0, .L8001E80C
/* 7038 8001E838 00000000 */   nop
/* 703C 8001E83C 21180000 */  addu       $v1, $zero, $zero
.L8001E840:
/* 7040 8001E840 0580013C */  lui        $at, %hi(D_8005206F)
/* 7044 8001E844 6F202124 */  addiu      $at, $at, %lo(D_8005206F)
/* 7048 8001E848 21082300 */  addu       $at, $at, $v1
/* 704C 8001E84C 000020A0 */  sb         $zero, 0x0($at)
/* 7050 8001E850 0580013C */  lui        $at, %hi(D_80052064)
/* 7054 8001E854 64202124 */  addiu      $at, $at, %lo(D_80052064)
/* 7058 8001E858 21082300 */  addu       $at, $at, $v1
/* 705C 8001E85C 000020A4 */  sh         $zero, 0x0($at)
/* 7060 8001E860 0580013C */  lui        $at, %hi(D_80052060)
/* 7064 8001E864 60202124 */  addiu      $at, $at, %lo(D_80052060)
/* 7068 8001E868 21082300 */  addu       $at, $at, $v1
/* 706C 8001E86C 000020AC */  sw         $zero, 0x0($at)
/* 7070 8001E870 10006324 */  addiu      $v1, $v1, 0x10
/* 7074 8001E874 80016228 */  slti       $v0, $v1, 0x180
/* 7078 8001E878 F1FF4014 */  bnez       $v0, .L8001E840
/* 707C 8001E87C 00000000 */   nop
/* 7080 8001E880 0280043C */  lui        $a0, %hi(func_8001FBC0)
/* 7084 8001E884 C0FB8424 */  addiu      $a0, $a0, %lo(func_8001FBC0)
/* 7088 8001E888 4266000C */  jal        func_80019908
/* 708C 8001E88C 06030534 */   ori       $a1, $zero, 0x306
/* 7090 8001E890 0280043C */  lui        $a0, %hi(func_8001F5DC)
/* 7094 8001E894 DCF58424 */  addiu      $a0, $a0, %lo(func_8001F5DC)
/* 7098 8001E898 4266000C */  jal        func_80019908
/* 709C 8001E89C 10030534 */   ori       $a1, $zero, 0x310
/* 70A0 8001E8A0 0280043C */  lui        $a0, %hi(func_8001F610)
/* 70A4 8001E8A4 10F68424 */  addiu      $a0, $a0, %lo(func_8001F610)
/* 70A8 8001E8A8 4266000C */  jal        func_80019908
/* 70AC 8001E8AC 11030534 */   ori       $a1, $zero, 0x311
/* 70B0 8001E8B0 0280043C */  lui        $a0, %hi(func_8001F64C)
/* 70B4 8001E8B4 4CF68424 */  addiu      $a0, $a0, %lo(func_8001F64C)
/* 70B8 8001E8B8 4266000C */  jal        func_80019908
/* 70BC 8001E8BC 12030534 */   ori       $a1, $zero, 0x312
/* 70C0 8001E8C0 0280043C */  lui        $a0, %hi(func_8001F8D4)
/* 70C4 8001E8C4 D4F88424 */  addiu      $a0, $a0, %lo(func_8001F8D4)
/* 70C8 8001E8C8 4266000C */  jal        func_80019908
/* 70CC 8001E8CC 13030534 */   ori       $a1, $zero, 0x313
/* 70D0 8001E8D0 0280043C */  lui        $a0, %hi(func_8001F95C)
/* 70D4 8001E8D4 5CF98424 */  addiu      $a0, $a0, %lo(func_8001F95C)
/* 70D8 8001E8D8 4266000C */  jal        func_80019908
/* 70DC 8001E8DC 14030534 */   ori       $a1, $zero, 0x314
/* 70E0 8001E8E0 0280043C */  lui        $a0, %hi(func_8001F9A4)
/* 70E4 8001E8E4 A4F98424 */  addiu      $a0, $a0, %lo(func_8001F9A4)
/* 70E8 8001E8E8 4266000C */  jal        func_80019908
/* 70EC 8001E8EC 15030534 */   ori       $a1, $zero, 0x315
/* 70F0 8001E8F0 0280043C */  lui        $a0, %hi(func_8001F9EC)
/* 70F4 8001E8F4 ECF98424 */  addiu      $a0, $a0, %lo(func_8001F9EC)
/* 70F8 8001E8F8 4266000C */  jal        func_80019908
/* 70FC 8001E8FC 16030534 */   ori       $a1, $zero, 0x316
/* 7100 8001E900 0280043C */  lui        $a0, %hi(func_8001FB38)
/* 7104 8001E904 38FB8424 */  addiu      $a0, $a0, %lo(func_8001FB38)
/* 7108 8001E908 4266000C */  jal        func_80019908
/* 710C 8001E90C 17030534 */   ori       $a1, $zero, 0x317
/* 7110 8001E910 0280043C */  lui        $a0, %hi(func_8001FB58)
/* 7114 8001E914 58FB8424 */  addiu      $a0, $a0, %lo(func_8001FB58)
/* 7118 8001E918 4266000C */  jal        func_80019908
/* 711C 8001E91C 18030534 */   ori       $a1, $zero, 0x318
/* 7120 8001E920 0280043C */  lui        $a0, %hi(func_8001FB78)
/* 7124 8001E924 78FB8424 */  addiu      $a0, $a0, %lo(func_8001FB78)
/* 7128 8001E928 4266000C */  jal        func_80019908
/* 712C 8001E92C 19030534 */   ori       $a1, $zero, 0x319
/* 7130 8001E930 0280043C */  lui        $a0, %hi(func_8001F918)
/* 7134 8001E934 18F98424 */  addiu      $a0, $a0, %lo(func_8001F918)
/* 7138 8001E938 4266000C */  jal        func_80019908
/* 713C 8001E93C 1A030534 */   ori       $a1, $zero, 0x31A
/* 7140 8001E940 0280043C */  lui        $a0, %hi(func_8001F17C)
/* 7144 8001E944 7CF18424 */  addiu      $a0, $a0, %lo(func_8001F17C)
/* 7148 8001E948 4266000C */  jal        func_80019908
/* 714C 8001E94C 1B030534 */   ori       $a1, $zero, 0x31B
/* 7150 8001E950 0280043C */  lui        $a0, %hi(func_8001E744)
/* 7154 8001E954 44E78424 */  addiu      $a0, $a0, %lo(func_8001E744)
/* 7158 8001E958 4266000C */  jal        func_80019908
/* 715C 8001E95C 1C030534 */   ori       $a1, $zero, 0x31C
/* 7160 8001E960 0280043C */  lui        $a0, %hi(func_8001E790)
/* 7164 8001E964 90E78424 */  addiu      $a0, $a0, %lo(func_8001E790)
/* 7168 8001E968 4266000C */  jal        func_80019908
/* 716C 8001E96C 1D030534 */   ori       $a1, $zero, 0x31D
/* 7170 8001E970 0280043C */  lui        $a0, %hi(func_8001E654)
/* 7174 8001E974 54E68424 */  addiu      $a0, $a0, %lo(func_8001E654)
/* 7178 8001E978 628C000C */  jal        func_80023188
/* 717C 8001E97C 01000534 */   ori       $a1, $zero, 0x1
/* 7180 8001E980 0480013C */  lui        $at, %hi(D_80047FAC)
/* 7184 8001E984 AC7F22AC */  sw         $v0, %lo(D_80047FAC)($at)
/* 7188 8001E988 1000BF8F */  lw         $ra, 0x10($sp)
/* 718C 8001E98C 00000000 */  nop
/* 7190 8001E990 0800E003 */  jr         $ra
/* 7194 8001E994 1800BD27 */   addiu     $sp, $sp, 0x18
