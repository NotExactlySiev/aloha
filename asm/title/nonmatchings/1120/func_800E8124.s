.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8124
/* 8924 800E8124 D8FFBD27 */  addiu      $sp, $sp, -0x28
/* 8928 800E8128 2400BFAF */  sw         $ra, 0x24($sp)
/* 892C 800E812C 2000B2AF */  sw         $s2, 0x20($sp)
/* 8930 800E8130 1C00B1AF */  sw         $s1, 0x1C($sp)
/* 8934 800E8134 1800B0AF */  sw         $s0, 0x18($sp)
/* 8938 800E8138 21808000 */  addu       $s0, $a0, $zero
/* 893C 800E813C 2190A000 */  addu       $s2, $a1, $zero
/* 8940 800E8140 2188C000 */  addu       $s1, $a2, $zero
/* 8944 800E8144 00E0043C */  lui        $a0, (0xE0000E00 >> 16)
/* 8948 800E8148 000E8434 */  ori        $a0, $a0, (0xE0000E00 & 0xFFFF)
/* 894C 800E814C 0020053C */  lui        $a1, (0x20001E00 >> 16)
/* 8950 800E8150 001EA534 */  ori        $a1, $a1, (0x20001E00 & 0xFFFF)
/* 8954 800E8154 21300002 */  addu       $a2, $s0, $zero
/* 8958 800E8158 EFA0030C */  jal        func_800E83BC
/* 895C 800E815C 00080734 */   ori       $a3, $zero, 0x800
/* 8960 800E8160 60002226 */  addiu      $v0, $s1, 0x60
/* 8964 800E8164 1000A2AF */  sw         $v0, 0x10($sp)
/* 8968 800E8168 08000434 */  ori        $a0, $zero, 0x8
/* 896C 800E816C 02000534 */  ori        $a1, $zero, 0x2
/* 8970 800E8170 00080634 */  ori        $a2, $zero, 0x800
/* 8974 800E8174 A09B030C */  jal        func_800E6E80
/* 8978 800E8178 21384002 */   addu      $a3, $s2, $zero
/* 897C 800E817C 00F0043C */  lui        $a0, (0xF0000600 >> 16)
/* 8980 800E8180 00068434 */  ori        $a0, $a0, (0xF0000600 & 0xFFFF)
/* 8984 800E8184 0010053C */  lui        $a1, (0x10000E00 >> 16)
/* 8988 800E8188 000EA534 */  ori        $a1, $a1, (0x10000E00 & 0xFFFF)
/* 898C 800E818C 21300002 */  addu       $a2, $s0, $zero
/* 8990 800E8190 EFA0030C */  jal        func_800E83BC
/* 8994 800E8194 00020734 */   ori       $a3, $zero, 0x200
/* 8998 800E8198 40002226 */  addiu      $v0, $s1, 0x40
/* 899C 800E819C 1000A2AF */  sw         $v0, 0x10($sp)
/* 89A0 800E81A0 10000434 */  ori        $a0, $zero, 0x10
/* 89A4 800E81A4 04000534 */  ori        $a1, $zero, 0x4
/* 89A8 800E81A8 00020634 */  ori        $a2, $zero, 0x200
/* 89AC 800E81AC A09B030C */  jal        func_800E6E80
/* 89B0 800E81B0 21384002 */   addu      $a3, $s2, $zero
/* 89B4 800E81B4 00FA043C */  lui        $a0, (0xFA000400 >> 16)
/* 89B8 800E81B8 00048434 */  ori        $a0, $a0, (0xFA000400 & 0xFFFF)
/* 89BC 800E81BC 0006053C */  lui        $a1, (0x6000600 >> 16)
/* 89C0 800E81C0 0006A534 */  ori        $a1, $a1, (0x6000600 & 0xFFFF)
/* 89C4 800E81C4 21300002 */  addu       $a2, $s0, $zero
/* 89C8 800E81C8 EFA0030C */  jal        func_800E83BC
/* 89CC 800E81CC 80000734 */   ori       $a3, $zero, 0x80
/* 89D0 800E81D0 20002226 */  addiu      $v0, $s1, 0x20
/* 89D4 800E81D4 1000A2AF */  sw         $v0, 0x10($sp)
/* 89D8 800E81D8 18000434 */  ori        $a0, $zero, 0x18
/* 89DC 800E81DC 04000534 */  ori        $a1, $zero, 0x4
/* 89E0 800E81E0 80000634 */  ori        $a2, $zero, 0x80
/* 89E4 800E81E4 A09B030C */  jal        func_800E6E80
/* 89E8 800E81E8 20004726 */   addiu     $a3, $s2, 0x20
/* 89EC 800E81EC 00FC043C */  lui        $a0, (0xFC000200 >> 16)
/* 89F0 800E81F0 00028434 */  ori        $a0, $a0, (0xFC000200 & 0xFFFF)
/* 89F4 800E81F4 0004053C */  lui        $a1, (0x4000400 >> 16)
/* 89F8 800E81F8 0004A534 */  ori        $a1, $a1, (0x4000400 & 0xFFFF)
/* 89FC 800E81FC 21300002 */  addu       $a2, $s0, $zero
/* 8A00 800E8200 EFA0030C */  jal        func_800E83BC
/* 8A04 800E8204 80000734 */   ori       $a3, $zero, 0x80
/* 8A08 800E8208 1000B1AF */  sw         $s1, 0x10($sp)
/* 8A0C 800E820C 10000434 */  ori        $a0, $zero, 0x10
/* 8A10 800E8210 04000534 */  ori        $a1, $zero, 0x4
/* 8A14 800E8214 80000634 */  ori        $a2, $zero, 0x80
/* 8A18 800E8218 A09B030C */  jal        func_800E6E80
/* 8A1C 800E821C 40004726 */   addiu     $a3, $s2, 0x40
/* 8A20 800E8220 2400BF8F */  lw         $ra, 0x24($sp)
/* 8A24 800E8224 2000B28F */  lw         $s2, 0x20($sp)
/* 8A28 800E8228 1C00B18F */  lw         $s1, 0x1C($sp)
/* 8A2C 800E822C 1800B08F */  lw         $s0, 0x18($sp)
/* 8A30 800E8230 0800E003 */  jr         $ra
/* 8A34 800E8234 2800BD27 */   addiu     $sp, $sp, 0x28
