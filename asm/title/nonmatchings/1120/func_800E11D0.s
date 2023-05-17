.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E11D0
/* 19D0 800E11D0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 19D4 800E11D4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 19D8 800E11D8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19DC 800E11DC 1000BFAF */  sw         $ra, 0x10($sp)
/* 19E0 800E11E0 E2006290 */  lbu        $v0, 0xE2($v1)
/* 19E4 800E11E4 00000000 */  nop
/* 19E8 800E11E8 27004010 */  beqz       $v0, .L800E1288
/* 19EC 800E11EC 00000000 */   nop
/* 19F0 800E11F0 14056290 */  lbu        $v0, 0x514($v1)
/* 19F4 800E11F4 00000000 */  nop
/* 19F8 800E11F8 0200422C */  sltiu      $v0, $v0, 0x2
/* 19FC 800E11FC 23004014 */  bnez       $v0, .L800E128C
/* 1A00 800E1200 00000000 */   nop
/* 1A04 800E1204 E2006490 */  lbu        $a0, 0xE2($v1)
/* 1A08 800E1208 1184030C */  jal        func_800E1044
/* 1A0C 800E120C 00000000 */   nop
/* 1A10 800E1210 1A80043C */  lui        $a0, %hi(D_801A0FD8)
/* 1A14 800E1214 D80F848C */  lw         $a0, %lo(D_801A0FD8)($a0)
/* 1A18 800E1218 00000000 */  nop
/* 1A1C 800E121C 14058390 */  lbu        $v1, 0x514($a0)
/* 1A20 800E1220 00000000 */  nop
/* 1A24 800E1224 FF006324 */  addiu      $v1, $v1, 0xFF
/* 1A28 800E1228 140583A0 */  sb         $v1, 0x514($a0)
/* 1A2C 800E122C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1A30 800E1230 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1A34 800E1234 00000000 */  nop
/* 1A38 800E1238 14056390 */  lbu        $v1, 0x514($v1)
/* 1A3C 800E123C 00000000 */  nop
/* 1A40 800E1240 2A104300 */  slt        $v0, $v0, $v1
/* 1A44 800E1244 05004014 */  bnez       $v0, .L800E125C
/* 1A48 800E1248 01000334 */   ori       $v1, $zero, 0x1
/* 1A4C 800E124C 0F80013C */  lui        $at, %hi(D_800F4E58)
/* 1A50 800E1250 584E20AC */  sw         $zero, %lo(D_800F4E58)($at)
/* 1A54 800E1254 9C840308 */  j          .L800E1270
/* 1A58 800E1258 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800E125C:
/* 1A5C 800E125C 0F80023C */  lui        $v0, %hi(D_800F4E60)
/* 1A60 800E1260 604E428C */  lw         $v0, %lo(D_800F4E60)($v0)
/* 1A64 800E1264 0F80013C */  lui        $at, %hi(D_800F4E58)
/* 1A68 800E1268 584E23AC */  sw         $v1, %lo(D_800F4E58)($at)
/* 1A6C 800E126C FFFF4224 */  addiu      $v0, $v0, -0x1
.L800E1270:
/* 1A70 800E1270 0F80013C */  lui        $at, %hi(D_800F4E60)
/* 1A74 800E1274 604E22AC */  sw         $v0, %lo(D_800F4E60)($at)
/* 1A78 800E1278 D582030C */  jal        func_800E0B54
/* 1A7C 800E127C 002C0434 */   ori       $a0, $zero, 0x2C00
/* 1A80 800E1280 A3840308 */  j          .L800E128C
/* 1A84 800E1284 00000000 */   nop
.L800E1288:
/* 1A88 800E1288 140560A0 */  sb         $zero, 0x514($v1)
.L800E128C:
/* 1A8C 800E128C 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 1A90 800E1290 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 1A94 800E1294 00000000 */  nop
/* 1A98 800E1298 14056290 */  lbu        $v0, 0x514($v1)
/* 1A9C 800E129C 00000000 */  nop
/* 1AA0 800E12A0 E40062A0 */  sb         $v0, 0xE4($v1)
/* 1AA4 800E12A4 1000BF8F */  lw         $ra, 0x10($sp)
/* 1AA8 800E12A8 00000000 */  nop
/* 1AAC 800E12AC 0800E003 */  jr         $ra
/* 1AB0 800E12B0 1800BD27 */   addiu     $sp, $sp, 0x18
