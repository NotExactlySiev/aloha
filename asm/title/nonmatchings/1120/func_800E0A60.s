.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0A60
/* 1260 800E0A60 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1264 800E0A64 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1268 800E0A68 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 126C 800E0A6C 1000BFAF */  sw         $ra, 0x10($sp)
/* 1270 800E0A70 3006428C */  lw         $v0, 0x630($v0)
/* 1274 800E0A74 00000000 */  nop
/* 1278 800E0A78 09F84000 */  jalr       $v0
/* 127C 800E0A7C 21200000 */   addu      $a0, $zero, $zero
/* 1280 800E0A80 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1284 800E0A84 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1288 800E0A88 00000000 */  nop
/* 128C 800E0A8C 4406428C */  lw         $v0, 0x644($v0)
/* 1290 800E0A90 00000000 */  nop
/* 1294 800E0A94 09F84000 */  jalr       $v0
/* 1298 800E0A98 21200000 */   addu      $a0, $zero, $zero
/* 129C 800E0A9C 0F80033C */  lui        $v1, %hi(D_800F4CF8)
/* 12A0 800E0AA0 F84C638C */  lw         $v1, %lo(D_800F4CF8)($v1)
/* 12A4 800E0AA4 02000234 */  ori        $v0, $zero, 0x2
/* 12A8 800E0AA8 0A006214 */  bne        $v1, $v0, .L800E0AD4
/* 12AC 800E0AAC 01006224 */   addiu     $v0, $v1, 0x1
/* 12B0 800E0AB0 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 12B4 800E0AB4 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 12B8 800E0AB8 00000000 */  nop
/* 12BC 800E0ABC 0C06428C */  lw         $v0, 0x60C($v0)
/* 12C0 800E0AC0 00000000 */  nop
/* 12C4 800E0AC4 09F84000 */  jalr       $v0
/* 12C8 800E0AC8 01000434 */   ori       $a0, $zero, 0x1
/* 12CC 800E0ACC B7820308 */  j          .L800E0ADC
/* 12D0 800E0AD0 00000000 */   nop
.L800E0AD4:
/* 12D4 800E0AD4 0F80013C */  lui        $at, %hi(D_800F4CF8)
/* 12D8 800E0AD8 F84C22AC */  sw         $v0, %lo(D_800F4CF8)($at)
.L800E0ADC:
/* 12DC 800E0ADC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 12E0 800E0AE0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 12E4 800E0AE4 0F80043C */  lui        $a0, %hi(D_800F4E10)
/* 12E8 800E0AE8 104E848C */  lw         $a0, %lo(D_800F4E10)($a0)
/* 12EC 800E0AEC 1406428C */  lw         $v0, 0x614($v0)
/* 12F0 800E0AF0 00000000 */  nop
/* 12F4 800E0AF4 09F84000 */  jalr       $v0
/* 12F8 800E0AF8 00000000 */   nop
/* 12FC 800E0AFC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1300 800E0B00 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1304 800E0B04 0F80043C */  lui        $a0, %hi(D_800F4E10)
/* 1308 800E0B08 104E848C */  lw         $a0, %lo(D_800F4E10)($a0)
/* 130C 800E0B0C 1806428C */  lw         $v0, 0x618($v0)
/* 1310 800E0B10 00000000 */  nop
/* 1314 800E0B14 09F84000 */  jalr       $v0
/* 1318 800E0B18 14008424 */   addiu     $a0, $a0, 0x14
/* 131C 800E0B1C 9A99030C */  jal        func_800E6668
/* 1320 800E0B20 00000000 */   nop
/* 1324 800E0B24 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1328 800E0B28 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 132C 800E0B2C 0F80043C */  lui        $a0, %hi(D_800F4E10)
/* 1330 800E0B30 104E848C */  lw         $a0, %lo(D_800F4E10)($a0)
/* 1334 800E0B34 2406428C */  lw         $v0, 0x624($v0)
/* 1338 800E0B38 00000000 */  nop
/* 133C 800E0B3C 09F84000 */  jalr       $v0
/* 1340 800E0B40 70008424 */   addiu     $a0, $a0, 0x70
/* 1344 800E0B44 1000BF8F */  lw         $ra, 0x10($sp)
/* 1348 800E0B48 00000000 */  nop
/* 134C 800E0B4C 0800E003 */  jr         $ra
/* 1350 800E0B50 1800BD27 */   addiu     $sp, $sp, 0x18
