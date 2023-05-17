.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001C7E8
/* 4FE8 8001C7E8 B0F7BD27 */  addiu      $sp, $sp, -0x850
/* 4FEC 8001C7EC 4808BFAF */  sw         $ra, 0x848($sp)
/* 4FF0 8001C7F0 4408B5AF */  sw         $s5, 0x844($sp)
/* 4FF4 8001C7F4 4008B4AF */  sw         $s4, 0x840($sp)
/* 4FF8 8001C7F8 3C08B3AF */  sw         $s3, 0x83C($sp)
/* 4FFC 8001C7FC 3808B2AF */  sw         $s2, 0x838($sp)
/* 5000 8001C800 3408B1AF */  sw         $s1, 0x834($sp)
/* 5004 8001C804 3008B0AF */  sw         $s0, 0x830($sp)
/* 5008 8001C808 21A88000 */  addu       $s5, $a0, $zero
/* 500C 8001C80C 2180A000 */  addu       $s0, $a1, $zero
/* 5010 8001C810 2190C000 */  addu       $s2, $a2, $zero
/* 5014 8001C814 2188E000 */  addu       $s1, $a3, $zero
/* 5018 8001C818 DF69000C */  jal        func_8001A77C
/* 501C 8001C81C 1000B427 */   addiu     $s4, $sp, 0x10
/* 5020 8001C820 536E000C */  jal        func_8001B94C
/* 5024 8001C824 00000000 */   nop
/* 5028 8001C828 FFFF0324 */  addiu      $v1, $zero, -0x1
/* 502C 8001C82C 68004310 */  beq        $v0, $v1, .L8001C9D0
/* 5030 8001C830 1008A427 */   addiu     $a0, $sp, 0x810
/* 5034 8001C834 0671000C */  jal        func_8001C418
/* 5038 8001C838 21280002 */   addu      $a1, $s0, $zero
/* 503C 8001C83C 88004010 */  beqz       $v0, .L8001CA60
/* 5040 8001C840 FEFF0224 */   addiu     $v0, $zero, -0x2
/* 5044 8001C844 06002012 */  beqz       $s1, .L8001C860
/* 5048 8001C848 00000000 */   nop
/* 504C 8001C84C 1408A28F */  lw         $v0, 0x814($sp)
/* 5050 8001C850 00000000 */  nop
/* 5054 8001C854 2B105100 */  sltu       $v0, $v0, $s1
/* 5058 8001C858 02004010 */  beqz       $v0, .L8001C864
/* 505C 8001C85C 00000000 */   nop
.L8001C860:
/* 5060 8001C860 1408B18F */  lw         $s1, 0x814($sp)
.L8001C864:
/* 5064 8001C864 6F00A016 */  bnez       $s5, .L8001CA24
/* 5068 8001C868 21982002 */   addu      $s3, $s1, $zero
/* 506C 8001C86C 0008622A */  slti       $v0, $s3, 0x800
/* 5070 8001C870 2A004014 */  bnez       $v0, .L8001C91C
/* 5074 8001C874 FF072232 */   andi      $v0, $s1, 0x7FF
/* 5078 8001C878 02000434 */  ori        $a0, $zero, 0x2
/* 507C 8001C87C 1008B527 */  addiu      $s5, $sp, 0x810
/* 5080 8001C880 2128A002 */  addu       $a1, $s5, $zero
/* 5084 8001C884 5B68000C */  jal        func_8001A16C
/* 5088 8001C888 21300000 */   addu      $a2, $zero, $zero
/* 508C 8001C88C 02006106 */  bgez       $s3, .L8001C898
/* 5090 8001C890 21206002 */   addu      $a0, $s3, $zero
/* 5094 8001C894 FF076426 */  addiu      $a0, $s3, 0x7FF
.L8001C898:
/* 5098 8001C898 C3220400 */  sra        $a0, $a0, 11
/* 509C 8001C89C 21284002 */  addu       $a1, $s2, $zero
/* 50A0 8001C8A0 9C68000C */  jal        func_8001A270
/* 50A4 8001C8A4 80000634 */   ori       $a2, $zero, 0x80
/* 50A8 8001C8A8 21200000 */  addu       $a0, $zero, $zero
/* 50AC 8001C8AC B268000C */  jal        func_8001A2C8
/* 50B0 8001C8B0 21280000 */   addu      $a1, $zero, $zero
/* 50B4 8001C8B4 21804000 */  addu       $s0, $v0, $zero
/* 50B8 8001C8B8 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 50BC 8001C8BC 10000216 */  bne        $s0, $v0, .L8001C900
/* 50C0 8001C8C0 02000434 */   ori       $a0, $zero, 0x2
/* 50C4 8001C8C4 2128A002 */  addu       $a1, $s5, $zero
/* 50C8 8001C8C8 5B68000C */  jal        func_8001A16C
/* 50CC 8001C8CC 21300000 */   addu      $a2, $zero, $zero
/* 50D0 8001C8D0 02006106 */  bgez       $s3, .L8001C8DC
/* 50D4 8001C8D4 21206002 */   addu      $a0, $s3, $zero
/* 50D8 8001C8D8 FF076426 */  addiu      $a0, $s3, 0x7FF
.L8001C8DC:
/* 50DC 8001C8DC C3220400 */  sra        $a0, $a0, 11
/* 50E0 8001C8E0 21284002 */  addu       $a1, $s2, $zero
/* 50E4 8001C8E4 9C68000C */  jal        func_8001A270
/* 50E8 8001C8E8 80000634 */   ori       $a2, $zero, 0x80
/* 50EC 8001C8EC 21200000 */  addu       $a0, $zero, $zero
/* 50F0 8001C8F0 B268000C */  jal        func_8001A2C8
/* 50F4 8001C8F4 21280000 */   addu      $a1, $zero, $zero
/* 50F8 8001C8F8 35005010 */  beq        $v0, $s0, .L8001C9D0
/* 50FC 8001C8FC 00000000 */   nop
.L8001C900:
/* 5100 8001C900 02002106 */  bgez       $s1, .L8001C90C
/* 5104 8001C904 21102002 */   addu      $v0, $s1, $zero
/* 5108 8001C908 FF072226 */  addiu      $v0, $s1, 0x7FF
.L8001C90C:
/* 510C 8001C90C C3120200 */  sra        $v0, $v0, 11
/* 5110 8001C910 C0120200 */  sll        $v0, $v0, 11
/* 5114 8001C914 21904202 */  addu       $s2, $s2, $v0
/* 5118 8001C918 FF072232 */  andi       $v0, $s1, 0x7FF
.L8001C91C:
/* 511C 8001C91C 36004010 */  beqz       $v0, .L8001C9F8
/* 5120 8001C920 21802002 */   addu      $s0, $s1, $zero
/* 5124 8001C924 02000106 */  bgez       $s0, .L8001C930
/* 5128 8001C928 00000000 */   nop
/* 512C 8001C92C FF071026 */  addiu      $s0, $s0, 0x7FF
.L8001C930:
/* 5130 8001C930 C3821000 */  sra        $s0, $s0, 11
/* 5134 8001C934 C0121000 */  sll        $v0, $s0, 11
/* 5138 8001C938 23802202 */  subu       $s0, $s1, $v0
/* 513C 8001C93C C6A2000C */  jal        func_80028B18
/* 5140 8001C940 1008A427 */   addiu     $a0, $sp, 0x810
/* 5144 8001C944 21382002 */  addu       $a3, $s1, $zero
/* 5148 8001C948 0200E104 */  bgez       $a3, .L8001C954
/* 514C 8001C94C 2808B127 */   addiu     $s1, $sp, 0x828
/* 5150 8001C950 FF07E724 */  addiu      $a3, $a3, 0x7FF
.L8001C954:
/* 5154 8001C954 C3220700 */  sra        $a0, $a3, 11
/* 5158 8001C958 21204400 */  addu       $a0, $v0, $a0
/* 515C 8001C95C 85A2000C */  jal        func_80028A14
/* 5160 8001C960 21282002 */   addu      $a1, $s1, $zero
/* 5164 8001C964 02000434 */  ori        $a0, $zero, 0x2
/* 5168 8001C968 21282002 */  addu       $a1, $s1, $zero
/* 516C 8001C96C 5B68000C */  jal        func_8001A16C
/* 5170 8001C970 21300000 */   addu      $a2, $zero, $zero
/* 5174 8001C974 01000434 */  ori        $a0, $zero, 0x1
/* 5178 8001C978 21288002 */  addu       $a1, $s4, $zero
/* 517C 8001C97C 9C68000C */  jal        func_8001A270
/* 5180 8001C980 80000634 */   ori       $a2, $zero, 0x80
/* 5184 8001C984 21200000 */  addu       $a0, $zero, $zero
/* 5188 8001C988 B268000C */  jal        func_8001A2C8
/* 518C 8001C98C 21280000 */   addu      $a1, $zero, $zero
/* 5190 8001C990 21A84000 */  addu       $s5, $v0, $zero
/* 5194 8001C994 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 5198 8001C998 0F00A216 */  bne        $s5, $v0, .L8001C9D8
/* 519C 8001C99C 02000434 */   ori       $a0, $zero, 0x2
/* 51A0 8001C9A0 21282002 */  addu       $a1, $s1, $zero
/* 51A4 8001C9A4 5B68000C */  jal        func_8001A16C
/* 51A8 8001C9A8 21300000 */   addu      $a2, $zero, $zero
/* 51AC 8001C9AC 01000434 */  ori        $a0, $zero, 0x1
/* 51B0 8001C9B0 21288002 */  addu       $a1, $s4, $zero
/* 51B4 8001C9B4 9C68000C */  jal        func_8001A270
/* 51B8 8001C9B8 80000634 */   ori       $a2, $zero, 0x80
/* 51BC 8001C9BC 21200000 */  addu       $a0, $zero, $zero
/* 51C0 8001C9C0 B268000C */  jal        func_8001A2C8
/* 51C4 8001C9C4 21280000 */   addu      $a1, $zero, $zero
/* 51C8 8001C9C8 03005514 */  bne        $v0, $s5, .L8001C9D8
/* 51CC 8001C9CC 00000000 */   nop
.L8001C9D0:
/* 51D0 8001C9D0 98720008 */  j          .L8001CA60
/* 51D4 8001C9D4 FFFF0224 */   addiu     $v0, $zero, -0x1
.L8001C9D8:
/* 51D8 8001C9D8 0800001A */  blez       $s0, .L8001C9FC
/* 51DC 8001C9DC 09000434 */   ori       $a0, $zero, 0x9
.L8001C9E0:
/* 51E0 8001C9E0 00008292 */  lbu        $v0, 0x0($s4)
/* 51E4 8001C9E4 01009426 */  addiu      $s4, $s4, 0x1
/* 51E8 8001C9E8 FFFF1026 */  addiu      $s0, $s0, -0x1
/* 51EC 8001C9EC 000042A2 */  sb         $v0, 0x0($s2)
/* 51F0 8001C9F0 FBFF001E */  bgtz       $s0, .L8001C9E0
/* 51F4 8001C9F4 01005226 */   addiu     $s2, $s2, 0x1
.L8001C9F8:
/* 51F8 8001C9F8 09000434 */  ori        $a0, $zero, 0x9
.L8001C9FC:
/* 51FC 8001C9FC 21280000 */  addu       $a1, $zero, $zero
/* 5200 8001CA00 5B68000C */  jal        func_8001A16C
/* 5204 8001CA04 21300000 */   addu      $a2, $zero, $zero
/* 5208 8001CA08 21200000 */  addu       $a0, $zero, $zero
/* 520C 8001CA0C 81A0000C */  jal        func_80028204
/* 5210 8001CA10 21280000 */   addu      $a1, $zero, $zero
/* 5214 8001CA14 2166000C */  jal        func_80019884
/* 5218 8001CA18 00000000 */   nop
/* 521C 8001CA1C 98720008 */  j          .L8001CA60
/* 5220 8001CA20 21106002 */   addu      $v0, $s3, $zero
.L8001CA24:
/* 5224 8001CA24 01000234 */  ori        $v0, $zero, 0x1
/* 5228 8001CA28 0D00A216 */  bne        $s5, $v0, .L8001CA60
/* 522C 8001CA2C 21106002 */   addu      $v0, $s3, $zero
/* 5230 8001CA30 02000434 */  ori        $a0, $zero, 0x2
/* 5234 8001CA34 1008A527 */  addiu      $a1, $sp, 0x810
/* 5238 8001CA38 5B68000C */  jal        func_8001A16C
/* 523C 8001CA3C 21300000 */   addu      $a2, $zero, $zero
/* 5240 8001CA40 FF076426 */  addiu      $a0, $s3, 0x7FF
/* 5244 8001CA44 02008104 */  bgez       $a0, .L8001CA50
/* 5248 8001CA48 21284002 */   addu      $a1, $s2, $zero
/* 524C 8001CA4C FE0F6426 */  addiu      $a0, $s3, 0xFFE
.L8001CA50:
/* 5250 8001CA50 C3220400 */  sra        $a0, $a0, 11
/* 5254 8001CA54 9C68000C */  jal        func_8001A270
/* 5258 8001CA58 80000634 */   ori       $a2, $zero, 0x80
/* 525C 8001CA5C 21106002 */  addu       $v0, $s3, $zero
.L8001CA60:
/* 5260 8001CA60 4808BF8F */  lw         $ra, 0x848($sp)
/* 5264 8001CA64 4408B58F */  lw         $s5, 0x844($sp)
/* 5268 8001CA68 4008B48F */  lw         $s4, 0x840($sp)
/* 526C 8001CA6C 3C08B38F */  lw         $s3, 0x83C($sp)
/* 5270 8001CA70 3808B28F */  lw         $s2, 0x838($sp)
/* 5274 8001CA74 3408B18F */  lw         $s1, 0x834($sp)
/* 5278 8001CA78 3008B08F */  lw         $s0, 0x830($sp)
/* 527C 8001CA7C 0800E003 */  jr         $ra
/* 5280 8001CA80 5008BD27 */   addiu     $sp, $sp, 0x850
