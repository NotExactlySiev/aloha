.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1928
/* 2128 800E1928 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 212C 800E192C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2130 800E1930 7F85030C */  jal        func_800E15FC
/* 2134 800E1934 00000000 */   nop
/* 2138 800E1938 1A80053C */  lui        $a1, %hi(D_801A0FD8)
/* 213C 800E193C D80FA58C */  lw         $a1, %lo(D_801A0FD8)($a1)
/* 2140 800E1940 00000000 */  nop
/* 2144 800E1944 1205A490 */  lbu        $a0, 0x512($a1)
/* 2148 800E1948 00000000 */  nop
/* 214C 800E194C 05008010 */  beqz       $a0, .L800E1964
/* 2150 800E1950 2138A000 */   addu      $a3, $a1, $zero
/* 2154 800E1954 0D05A390 */  lbu        $v1, 0x50D($a1)
/* 2158 800E1958 03000234 */  ori        $v0, $zero, 0x3
/* 215C 800E195C 42006214 */  bne        $v1, $v0, .L800E1A68
/* 2160 800E1960 00000000 */   nop
.L800E1964:
/* 2164 800E1964 0D05A290 */  lbu        $v0, 0x50D($a1)
/* 2168 800E1968 00000000 */  nop
/* 216C 800E196C 00120200 */  sll        $v0, $v0, 8
/* 2170 800E1970 21104700 */  addu       $v0, $v0, $a3
/* 2174 800E1974 00014624 */  addiu      $a2, $v0, 0x100
/* 2178 800E1978 00024824 */  addiu      $t0, $v0, 0x200
.L800E197C:
/* 217C 800E197C 0000C28C */  lw         $v0, 0x0($a2)
/* 2180 800E1980 0400C38C */  lw         $v1, 0x4($a2)
/* 2184 800E1984 0800C48C */  lw         $a0, 0x8($a2)
/* 2188 800E1988 0C00C58C */  lw         $a1, 0xC($a2)
/* 218C 800E198C 0000E2AC */  sw         $v0, 0x0($a3)
/* 2190 800E1990 0400E3AC */  sw         $v1, 0x4($a3)
/* 2194 800E1994 0800E4AC */  sw         $a0, 0x8($a3)
/* 2198 800E1998 0C00E5AC */  sw         $a1, 0xC($a3)
/* 219C 800E199C 1000C624 */  addiu      $a2, $a2, 0x10
/* 21A0 800E19A0 F6FFC814 */  bne        $a2, $t0, .L800E197C
/* 21A4 800E19A4 1000E724 */   addiu     $a3, $a3, 0x10
/* 21A8 800E19A8 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 21AC 800E19AC D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 21B0 800E19B0 00000000 */  nop
/* 21B4 800E19B4 0D058390 */  lbu        $v1, 0x50D($a0)
/* 21B8 800E19B8 03000234 */  ori        $v0, $zero, 0x3
/* 21BC 800E19BC 0E006214 */  bne        $v1, $v0, .L800E19F8
/* 21C0 800E19C0 00000000 */   nop
/* 21C4 800E19C4 E20080A0 */  sb         $zero, 0xE2($a0)
/* 21C8 800E19C8 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 21CC 800E19CC D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 21D0 800E19D0 00000000 */  nop
/* 21D4 800E19D4 140540A0 */  sb         $zero, 0x514($v0)
/* 21D8 800E19D8 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 21DC 800E19DC D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 21E0 800E19E0 00000000 */  nop
/* 21E4 800E19E4 150540A0 */  sb         $zero, 0x515($v0)
/* 21E8 800E19E8 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 21EC 800E19EC D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 21F0 800E19F0 00000000 */  nop
/* 21F4 800E19F4 E40040A0 */  sb         $zero, 0xE4($v0)
.L800E19F8:
/* 21F8 800E19F8 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 21FC 800E19FC D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 2200 800E1A00 00000000 */  nop
/* 2204 800E1A04 E4006290 */  lbu        $v0, 0xE4($v1)
/* 2208 800E1A08 2786030C */  jal        func_800E189C
/* 220C 800E1A0C 140562A0 */   sb        $v0, 0x514($v1)
/* 2210 800E1A10 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 2214 800E1A14 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 2218 800E1A18 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 221C 800E1A1C D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 2220 800E1A20 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 2224 800E1A24 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 2228 800E1A28 E7004490 */  lbu        $a0, 0xE7($v0)
/* 222C 800E1A2C 080C628C */  lw         $v0, 0xC08($v1)
/* 2230 800E1A30 00000000 */  nop
/* 2234 800E1A34 09F84000 */  jalr       $v0
/* 2238 800E1A38 2B200400 */   sltu      $a0, $zero, $a0
/* 223C 800E1A3C 1A80023C */  lui        $v0, %hi(D_801A0FD8)
/* 2240 800E1A40 D80F428C */  lw         $v0, %lo(D_801A0FD8)($v0)
/* 2244 800E1A44 0E80033C */  lui        $v1, %hi(D_800E7FA0)
/* 2248 800E1A48 A07F638C */  lw         $v1, %lo(D_800E7FA0)($v1)
/* 224C 800E1A4C EA004490 */  lbu        $a0, 0xEA($v0)
/* 2250 800E1A50 2800628C */  lw         $v0, 0x28($v1)
/* 2254 800E1A54 00000000 */  nop
/* 2258 800E1A58 09F84000 */  jalr       $v0
/* 225C 800E1A5C 00000000 */   nop
/* 2260 800E1A60 9E860308 */  j          .L800E1A78
/* 2264 800E1A64 00000000 */   nop
.L800E1A68:
/* 2268 800E1A68 2985030C */  jal        func_800E14A4
/* 226C 800E1A6C 00000000 */   nop
/* 2270 800E1A70 D582030C */  jal        func_800E0B54
/* 2274 800E1A74 00290434 */   ori       $a0, $zero, 0x2900
.L800E1A78:
/* 2278 800E1A78 1000BF8F */  lw         $ra, 0x10($sp)
/* 227C 800E1A7C 00000000 */  nop
/* 2280 800E1A80 0800E003 */  jr         $ra
/* 2284 800E1A84 1800BD27 */   addiu     $sp, $sp, 0x18
