.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel cd_run_block
/* 38A0 8001B0A0 B8F7BD27 */  addiu      $sp, $sp, -0x848
/* 38A4 8001B0A4 4408BFAF */  sw         $ra, 0x844($sp)
/* 38A8 8001B0A8 4008B2AF */  sw         $s2, 0x840($sp)
/* 38AC 8001B0AC 3C08B1AF */  sw         $s1, 0x83C($sp)
/* 38B0 8001B0B0 3808B0AF */  sw         $s0, 0x838($sp)
/* 38B4 8001B0B4 0480023C */  lui        $v0, %hi(sndqueue_is_running)
/* 38B8 8001B0B8 F47E428C */  lw         $v0, %lo(sndqueue_is_running)($v0)
/* 38BC 8001B0BC 01001034 */  ori        $s0, $zero, 0x1
/* 38C0 8001B0C0 03005014 */  bne        $v0, $s0, .L8001B0D0
/* 38C4 8001B0C4 21900000 */   addu      $s2, $zero, $zero
/* 38C8 8001B0C8 316E0008 */  j          .L8001B8C4
/* 38CC 8001B0CC 21100000 */   addu      $v0, $zero, $zero
.L8001B0D0:
/* 38D0 8001B0D0 0480023C */  lui        $v0, %hi(cd_busy)
/* 38D4 8001B0D4 A87D428C */  lw         $v0, %lo(cd_busy)($v0)
/* 38D8 8001B0D8 0480013C */  lui        $at, %hi(sndqueue_is_running)
/* 38DC 8001B0DC F47E30AC */  sw         $s0, %lo(sndqueue_is_running)($at)
/* 38E0 8001B0E0 11005014 */  bne        $v0, $s0, .L8001B128
/* 38E4 8001B0E4 00000000 */   nop
/* 38E8 8001B0E8 0480043C */  lui        $a0, %hi(sndqueue_com)
/* 38EC 8001B0EC 937D8490 */  lbu        $a0, %lo(sndqueue_com)($a0)
/* 38F0 8001B0F0 0480053C */  lui        $a1, %hi(cd_arg)
/* 38F4 8001B0F4 B47EA58C */  lw         $a1, %lo(cd_arg)($a1)
/* 38F8 8001B0F8 0480063C */  lui        $a2, %hi(cd_result)
/* 38FC 8001B0FC BC7EC68C */  lw         $a2, %lo(cd_result)($a2)
/* 3900 8001B100 C5A0000C */  jal        CdControl
/* 3904 8001B104 00000000 */   nop
/* 3908 8001B108 E9015014 */  bne        $v0, $s0, .L8001B8B0
/* 390C 8001B10C 00000000 */   nop
/* 3910 8001B110 0480013C */  lui        $at, %hi(cd_busy)
/* 3914 8001B114 A87D20AC */  sw         $zero, %lo(cd_busy)($at)
/* 3918 8001B118 0480013C */  lui        $at, %hi(D_80047DE0)
/* 391C 8001B11C E07D30AC */  sw         $s0, %lo(D_80047DE0)($at)
/* 3920 8001B120 656C0008 */  j          .L8001B194
/* 3924 8001B124 00000000 */   nop
.L8001B128:
/* 3928 8001B128 0480023C */  lui        $v0, %hi(D_80047DE0)
/* 392C 8001B12C E07D428C */  lw         $v0, %lo(D_80047DE0)($v0)
/* 3930 8001B130 00000000 */  nop
/* 3934 8001B134 3B005014 */  bne        $v0, $s0, .L8001B224
/* 3938 8001B138 01000434 */   ori       $a0, $zero, 0x1
/* 393C 8001B13C 0480013C */  lui        $at, %hi(fe_value)
/* 3940 8001B140 1C7F20AC */  sw         $zero, %lo(fe_value)($at)
/* 3944 8001B144 0580013C */  lui        $at, %hi(D_800548EC)
/* 3948 8001B148 EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
/* 394C 8001B14C 21200000 */  addu       $a0, $zero, $zero
/* 3950 8001B150 0480063C */  lui        $a2, %hi(cd_last_status)
/* 3954 8001B154 DC7EC624 */  addiu      $a2, $a2, %lo(cd_last_status)
/* 3958 8001B158 C5A0000C */  jal        CdControl
/* 395C 8001B15C 21280000 */   addu      $a1, $zero, $zero
/* 3960 8001B160 01001034 */  ori        $s0, $zero, 0x1
.L8001B164:
/* 3964 8001B164 0480043C */  lui        $a0, %hi(cd_last_status)
/* 3968 8001B168 DC7E8424 */  addiu      $a0, $a0, %lo(cd_last_status)
/* 396C 8001B16C D268000C */  jal        cd_get_status
/* 3970 8001B170 00000000 */   nop
/* 3974 8001B174 FBFF5014 */  bne        $v0, $s0, .L8001B164
/* 3978 8001B178 00000000 */   nop
/* 397C 8001B17C 0480023C */  lui        $v0, %hi(cd_last_status)
/* 3980 8001B180 DC7E4290 */  lbu        $v0, %lo(cd_last_status)($v0)
/* 3984 8001B184 00000000 */  nop
/* 3988 8001B188 10004230 */  andi       $v0, $v0, 0x10
/* 398C 8001B18C 07004010 */  beqz       $v0, .L8001B1AC
/* 3990 8001B190 00000000 */   nop
.L8001B194:
/* 3994 8001B194 0480013C */  lui        $at, %hi(pvd_is_cached)
/* 3998 8001B198 E47E20AC */  sw         $zero, %lo(pvd_is_cached)($at)
/* 399C 8001B19C 0575000C */  jal        sector_cache_clear
/* 39A0 8001B1A0 00000000 */   nop
/* 39A4 8001B1A4 2E6E0008 */  j          .L8001B8B8
/* 39A8 8001B1A8 00000000 */   nop
.L8001B1AC:
/* 39AC 8001B1AC 0480043C */  lui        $a0, %hi(D_80047D8C)
/* 39B0 8001B1B0 8C7D8424 */  addiu      $a0, $a0, %lo(D_80047D8C)
/* 39B4 8001B1B4 286A000C */  jal        set_vol_scaled
/* 39B8 8001B1B8 00040534 */   ori       $a1, $zero, 0x400
/* 39BC 8001B1BC 0480013C */  lui        $at, %hi(D_80047DE0)
/* 39C0 8001B1C0 E07D20AC */  sw         $zero, %lo(D_80047DE0)($at)
/* 39C4 8001B1C4 0480103C */  lui        $s0, %hi(D_80047F24)
/* 39C8 8001B1C8 247F108E */  lw         $s0, %lo(D_80047F24)($s0)
/* 39CC 8001B1CC 01001134 */  ori        $s1, $zero, 0x1
/* 39D0 8001B1D0 0B001116 */  bne        $s0, $s1, .L8001B200
/* 39D4 8001B1D4 02000234 */   ori       $v0, $zero, 0x2
/* 39D8 8001B1D8 0480043C */  lui        $a0, %hi(D_80047D84)
/* 39DC 8001B1DC 847D848C */  lw         $a0, %lo(D_80047D84)($a0)
/* 39E0 8001B1E0 0480053C */  lui        $a1, %hi(D_80047D78)
/* 39E4 8001B1E4 787DA58C */  lw         $a1, %lo(D_80047D78)($a1)
/* 39E8 8001B1E8 0F70000C */  jal        music_play_cdda
/* 39EC 8001B1EC 00000000 */   nop
/* 39F0 8001B1F0 0480013C */  lui        $at, %hi(D_80047F24)
/* 39F4 8001B1F4 247F31AC */  sw         $s1, %lo(D_80047F24)($at)
/* 39F8 8001B1F8 866C0008 */  j          .L8001B218
/* 39FC 8001B1FC 00000000 */   nop
.L8001B200:
/* 3A00 8001B200 08000216 */  bne        $s0, $v0, .L8001B224
/* 3A04 8001B204 01000434 */   ori       $a0, $zero, 0x1
/* 3A08 8001B208 946E000C */  jal        func_8001BA50
/* 3A0C 8001B20C 00000000 */   nop
/* 3A10 8001B210 0480013C */  lui        $at, %hi(D_80047F24)
/* 3A14 8001B214 247F30AC */  sw         $s0, %lo(D_80047F24)($at)
.L8001B218:
/* 3A18 8001B218 0580013C */  lui        $at, %hi(D_800548EC)
/* 3A1C 8001B21C EC4831AC */  sw         $s1, %lo(D_800548EC)($at)
/* 3A20 8001B220 01000434 */  ori        $a0, $zero, 0x1
.L8001B224:
/* 3A24 8001B224 81A0000C */  jal        CdSync
/* 3A28 8001B228 21280000 */   addu      $a1, $zero, $zero
/* 3A2C 8001B22C 21204000 */  addu       $a0, $v0, $zero
/* 3A30 8001B230 D367000C */  jal        func_80019F4C
/* 3A34 8001B234 21280000 */   addu      $a1, $zero, $zero
/* 3A38 8001B238 0480033C */  lui        $v1, %hi(fe_value)
/* 3A3C 8001B23C 1C7F638C */  lw         $v1, %lo(fe_value)($v1)
/* 3A40 8001B240 02000234 */  ori        $v0, $zero, 0x2
/* 3A44 8001B244 42006214 */  bne        $v1, $v0, .L8001B350
/* 3A48 8001B248 00000000 */   nop
/* 3A4C 8001B24C 8673000C */  jal        func_8001CE18
/* 3A50 8001B250 00000000 */   nop
/* 3A54 8001B254 21804000 */  addu       $s0, $v0, $zero
/* 3A58 8001B258 01000234 */  ori        $v0, $zero, 0x1
/* 3A5C 8001B25C 3C000216 */  bne        $s0, $v0, .L8001B350
/* 3A60 8001B260 00000000 */   nop
/* 3A64 8001B264 0480013C */  lui        $at, %hi(fe_value)
/* 3A68 8001B268 1C7F20AC */  sw         $zero, %lo(fe_value)($at)
/* 3A6C 8001B26C 0480043C */  lui        $a0, %hi(D_80047D8C)
/* 3A70 8001B270 8C7D8424 */  addiu      $a0, $a0, %lo(D_80047D8C)
/* 3A74 8001B274 286A000C */  jal        set_vol_scaled
/* 3A78 8001B278 00040534 */   ori       $a1, $zero, 0x400
/* 3A7C 8001B27C 0480023C */  lui        $v0, %hi(D_80047D78)
/* 3A80 8001B280 787D428C */  lw         $v0, %lo(D_80047D78)($v0)
/* 3A84 8001B284 00000000 */  nop
/* 3A88 8001B288 2C005014 */  bne        $v0, $s0, .L8001B33C
/* 3A8C 8001B28C 09000434 */   ori       $a0, $zero, 0x9
/* 3A90 8001B290 21280000 */  addu       $a1, $zero, $zero
/* 3A94 8001B294 CA6B000C */  jal        sndqueue_add
/* 3A98 8001B298 21300000 */   addu      $a2, $zero, $zero
/* 3A9C 8001B29C 0E000434 */  ori        $a0, $zero, 0xE
/* 3AA0 8001B2A0 0480053C */  lui        $a1, %hi(D_80047EC4)
/* 3AA4 8001B2A4 C47EA524 */  addiu      $a1, $a1, %lo(D_80047EC4)
/* 3AA8 8001B2A8 CA6B000C */  jal        sndqueue_add
/* 3AAC 8001B2AC 21300000 */   addu      $a2, $zero, $zero
/* 3AB0 8001B2B0 0D000434 */  ori        $a0, $zero, 0xD
/* 3AB4 8001B2B4 0480053C */  lui        $a1, %hi(D_80047ECC)
/* 3AB8 8001B2B8 CC7EA524 */  addiu      $a1, $a1, %lo(D_80047ECC)
/* 3ABC 8001B2BC CA6B000C */  jal        sndqueue_add
/* 3AC0 8001B2C0 21300000 */   addu      $a2, $zero, $zero
/* 3AC4 8001B2C4 15000434 */  ori        $a0, $zero, 0x15
/* 3AC8 8001B2C8 0580053C */  lui        $a1, %hi(D_8004D0E0)
/* 3ACC 8001B2CC E0D0A524 */  addiu      $a1, $a1, %lo(D_8004D0E0)
/* 3AD0 8001B2D0 CA6B000C */  jal        sndqueue_add
/* 3AD4 8001B2D4 21300000 */   addu      $a2, $zero, $zero
/* 3AD8 8001B2D8 09000434 */  ori        $a0, $zero, 0x9
/* 3ADC 8001B2DC 21280000 */  addu       $a1, $zero, $zero
/* 3AE0 8001B2E0 CA6B000C */  jal        sndqueue_add
/* 3AE4 8001B2E4 21300000 */   addu      $a2, $zero, $zero
/* 3AE8 8001B2E8 1B000434 */  ori        $a0, $zero, 0x1B
/* 3AEC 8001B2EC 0580053C */  lui        $a1, %hi(D_8004D0E0)
/* 3AF0 8001B2F0 E0D0A524 */  addiu      $a1, $a1, %lo(D_8004D0E0)
/* 3AF4 8001B2F4 CA6B000C */  jal        sndqueue_add
/* 3AF8 8001B2F8 21300000 */   addu      $a2, $zero, $zero
/* 3AFC 8001B2FC FC000434 */  ori        $a0, $zero, 0xFC
/* 3B00 8001B300 0480053C */  lui        $a1, %hi(vol_full)
/* 3B04 8001B304 9C7EA524 */  addiu      $a1, $a1, %lo(vol_full)
/* 3B08 8001B308 CA6B000C */  jal        sndqueue_add
/* 3B0C 8001B30C 21300000 */   addu      $a2, $zero, $zero
/* 3B10 8001B310 F7000434 */  ori        $a0, $zero, 0xF7
/* 3B14 8001B314 0480053C */  lui        $a1, %hi(D_80047EEC)
/* 3B18 8001B318 EC7EA58C */  lw         $a1, %lo(D_80047EEC)($a1)
/* 3B1C 8001B31C CA6B000C */  jal        sndqueue_add
/* 3B20 8001B320 21300000 */   addu      $a2, $zero, $zero
/* 3B24 8001B324 FE000434 */  ori        $a0, $zero, 0xFE
/* 3B28 8001B328 02000534 */  ori        $a1, $zero, 0x2
/* 3B2C 8001B32C CA6B000C */  jal        sndqueue_add
/* 3B30 8001B330 21300000 */   addu      $a2, $zero, $zero
/* 3B34 8001B334 D46C0008 */  j          .L8001B350
/* 3B38 8001B338 00000000 */   nop
.L8001B33C:
/* 3B3C 8001B33C 21280000 */  addu       $a1, $zero, $zero
/* 3B40 8001B340 CA6B000C */  jal        sndqueue_add
/* 3B44 8001B344 21300000 */   addu      $a2, $zero, $zero
/* 3B48 8001B348 0580013C */  lui        $at, %hi(D_800548EC)
/* 3B4C 8001B34C EC4820AC */  sw         $zero, %lo(D_800548EC)($at)
.L8001B350:
/* 3B50 8001B350 0480033C */  lui        $v1, %hi(D_80047DD8)
/* 3B54 8001B354 D87D638C */  lw         $v1, %lo(D_80047DD8)($v1)
/* 3B58 8001B358 01001034 */  ori        $s0, $zero, 0x1
/* 3B5C 8001B35C 07007010 */  beq        $v1, $s0, .L8001B37C
/* 3B60 8001B360 02006228 */   slti      $v0, $v1, 0x2
/* 3B64 8001B364 54014014 */  bnez       $v0, .L8001B8B8
/* 3B68 8001B368 02000234 */   ori       $v0, $zero, 0x2
/* 3B6C 8001B36C 50016210 */  beq        $v1, $v0, .L8001B8B0
/* 3B70 8001B370 00000000 */   nop
/* 3B74 8001B374 2E6E0008 */  j          .L8001B8B8
/* 3B78 8001B378 00000000 */   nop
.L8001B37C:
/* 3B7C 8001B37C 21200000 */  addu       $a0, $zero, $zero
/* 3B80 8001B380 81A0000C */  jal        CdSync
/* 3B84 8001B384 21280000 */   addu      $a1, $zero, $zero
/* 3B88 8001B388 0480043C */  lui        $a0, %hi(cd_last_status)
/* 3B8C 8001B38C DC7E8424 */  addiu      $a0, $a0, %lo(cd_last_status)
/* 3B90 8001B390 D268000C */  jal        cd_get_status
/* 3B94 8001B394 00000000 */   nop
/* 3B98 8001B398 0D005014 */  bne        $v0, $s0, .L8001B3D0
/* 3B9C 8001B39C 00000000 */   nop
/* 3BA0 8001B3A0 0480033C */  lui        $v1, %hi(cd_last_status)
/* 3BA4 8001B3A4 DC7E6390 */  lbu        $v1, %lo(cd_last_status)($v1)
/* 3BA8 8001B3A8 00000000 */  nop
/* 3BAC 8001B3AC 10006230 */  andi       $v0, $v1, 0x10
/* 3BB0 8001B3B0 05004010 */  beqz       $v0, .L8001B3C8
/* 3BB4 8001B3B4 40006230 */   andi      $v0, $v1, 0x40
/* 3BB8 8001B3B8 0480013C */  lui        $at, %hi(D_80047DE0)
/* 3BBC 8001B3BC E07D30AC */  sw         $s0, %lo(D_80047DE0)($at)
/* 3BC0 8001B3C0 656C0008 */  j          .L8001B194
/* 3BC4 8001B3C4 00000000 */   nop
.L8001B3C8:
/* 3BC8 8001B3C8 3B014014 */  bnez       $v0, .L8001B8B8
/* 3BCC 8001B3CC 00000000 */   nop
.L8001B3D0:
/* 3BD0 8001B3D0 0480033C */  lui        $v1, %hi(D_80047F34)
/* 3BD4 8001B3D4 347F6394 */  lhu        $v1, %lo(D_80047F34)($v1)
/* 3BD8 8001B3D8 00000000 */  nop
/* 3BDC 8001B3DC 40100300 */  sll        $v0, $v1, 1
/* 3BE0 8001B3E0 21104300 */  addu       $v0, $v0, $v1
/* 3BE4 8001B3E4 80200200 */  sll        $a0, $v0, 2
/* 3BE8 8001B3E8 0580013C */  lui        $at, %hi(_sndqueue)
/* 3BEC 8001B3EC F8D02124 */  addiu      $at, $at, %lo(_sndqueue)
/* 3BF0 8001B3F0 21082400 */  addu       $at, $at, $a0
/* 3BF4 8001B3F4 00002390 */  lbu        $v1, 0x0($at)
/* 3BF8 8001B3F8 FF000234 */  ori        $v0, $zero, 0xFF
/* 3BFC 8001B3FC 12016210 */  beq        $v1, $v0, .L8001B848
/* 3C00 8001B400 00000000 */   nop
/* 3C04 8001B404 0580023C */  lui        $v0, %hi(_sndqueue)
/* 3C08 8001B408 F8D04224 */  addiu      $v0, $v0, %lo(_sndqueue)
/* 3C0C 8001B40C 21808200 */  addu       $s0, $a0, $v0
/* 3C10 8001B410 00000492 */  lbu        $a0, 0x0($s0)
/* 3C14 8001B414 FE000234 */  ori        $v0, $zero, 0xFE
/* 3C18 8001B418 0480013C */  lui        $at, %hi(sndqueue_com)
/* 3C1C 8001B41C 937D24A0 */  sb         $a0, %lo(sndqueue_com)($at)
/* 3C20 8001B420 0480013C */  lui        $at, %hi(D_80047D94)
/* 3C24 8001B424 947D24A0 */  sb         $a0, %lo(D_80047D94)($at)
/* 3C28 8001B428 FF008330 */  andi       $v1, $a0, 0xFF
/* 3C2C 8001B42C 19006214 */  bne        $v1, $v0, .L8001B494
/* 3C30 8001B430 FD000234 */   ori       $v0, $zero, 0xFD
/* 3C34 8001B434 0480033C */  lui        $v1, %hi(fe_value)
/* 3C38 8001B438 1C7F638C */  lw         $v1, %lo(fe_value)($v1)
/* 3C3C 8001B43C 05000234 */  ori        $v0, $zero, 0x5
/* 3C40 8001B440 07006214 */  bne        $v1, $v0, .L8001B460
/* 3C44 8001B444 00000000 */   nop
/* 3C48 8001B448 0400028E */  lw         $v0, 0x4($s0)
/* 3C4C 8001B44C 00000000 */  nop
/* 3C50 8001B450 03004310 */  beq        $v0, $v1, .L8001B460
/* 3C54 8001B454 00000000 */   nop
/* 3C58 8001B458 E068000C */  jal        func_8001A380
/* 3C5C 8001B45C 00000000 */   nop
.L8001B460:
/* 3C60 8001B460 0400038E */  lw         $v1, 0x4($s0)
/* 3C64 8001B464 02000234 */  ori        $v0, $zero, 0x2
/* 3C68 8001B468 04006210 */  beq        $v1, $v0, .L8001B47C
/* 3C6C 8001B46C 00000000 */   nop
/* 3C70 8001B470 4174000C */  jal        func_8001D104
/* 3C74 8001B474 00000000 */   nop
/* 3C78 8001B478 0400038E */  lw         $v1, 0x4($s0)
.L8001B47C:
/* 3C7C 8001B47C 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3C80 8001B480 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3C84 8001B484 0480013C */  lui        $at, %hi(fe_value)
/* 3C88 8001B488 1C7F23AC */  sw         $v1, %lo(fe_value)($at)
/* 3C8C 8001B48C DE6D0008 */  j          .L8001B778
/* 3C90 8001B490 01004224 */   addiu     $v0, $v0, 0x1
.L8001B494:
/* 3C94 8001B494 08006214 */  bne        $v1, $v0, .L8001B4B8
/* 3C98 8001B498 FC000234 */   ori       $v0, $zero, 0xFC
/* 3C9C 8001B49C 0400048E */  lw         $a0, 0x4($s0)
/* 3CA0 8001B4A0 4D6A000C */  jal        cd_set_vol
/* 3CA4 8001B4A4 00000000 */   nop
/* 3CA8 8001B4A8 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3CAC 8001B4AC 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3CB0 8001B4B0 DE6D0008 */  j          .L8001B778
/* 3CB4 8001B4B4 01004224 */   addiu     $v0, $v0, 0x1
.L8001B4B8:
/* 3CB8 8001B4B8 0A006214 */  bne        $v1, $v0, .L8001B4E4
/* 3CBC 8001B4BC FB000234 */   ori       $v0, $zero, 0xFB
/* 3CC0 8001B4C0 0400048E */  lw         $a0, 0x4($s0)
/* 3CC4 8001B4C4 0480053C */  lui        $a1, %hi(vol_scale)
/* 3CC8 8001B4C8 D47DA58C */  lw         $a1, %lo(vol_scale)($a1)
/* 3CCC 8001B4CC 286A000C */  jal        set_vol_scaled
/* 3CD0 8001B4D0 00000000 */   nop
/* 3CD4 8001B4D4 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3CD8 8001B4D8 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3CDC 8001B4DC DE6D0008 */  j          .L8001B778
/* 3CE0 8001B4E0 01004224 */   addiu     $v0, $v0, 0x1
.L8001B4E4:
/* 3CE4 8001B4E4 38006214 */  bne        $v1, $v0, .L8001B5C8
/* 3CE8 8001B4E8 FA000234 */   ori       $v0, $zero, 0xFA
/* 3CEC 8001B4EC 0400028E */  lw         $v0, 0x4($s0)
/* 3CF0 8001B4F0 00000000 */  nop
/* 3CF4 8001B4F4 0480013C */  lui        $at, %hi(fading_out)
/* 3CF8 8001B4F8 B87D22AC */  sw         $v0, %lo(fading_out)($at)
/* 3CFC 8001B4FC 0480023C */  lui        $v0, %hi(fading_out)
/* 3D00 8001B500 B87D428C */  lw         $v0, %lo(fading_out)($v0)
/* 3D04 8001B504 00000000 */  nop
/* 3D08 8001B508 0480013C */  lui        $at, %hi(fade_out_active)
/* 3D0C 8001B50C B47D22AC */  sw         $v0, %lo(fade_out_active)($at)
/* 3D10 8001B510 0480033C */  lui        $v1, %hi(fade_out_active)
/* 3D14 8001B514 B47D638C */  lw         $v1, %lo(fade_out_active)($v1)
/* 3D18 8001B518 01000234 */  ori        $v0, $zero, 0x1
/* 3D1C 8001B51C 18006214 */  bne        $v1, $v0, .L8001B580
/* 3D20 8001B520 00000000 */   nop
/* 3D24 8001B524 0480023C */  lui        $v0, %hi(fade_in_active)
/* 3D28 8001B528 BC7D428C */  lw         $v0, %lo(fade_in_active)($v0)
/* 3D2C 8001B52C 00000000 */  nop
/* 3D30 8001B530 21004314 */  bne        $v0, $v1, .L8001B5B8
/* 3D34 8001B534 00000000 */   nop
/* 3D38 8001B538 0480043C */  lui        $a0, %hi(fade_in_task)
/* 3D3C 8001B53C 047F848C */  lw         $a0, %lo(fade_in_task)($a0)
/* 3D40 8001B540 988C000C */  jal        tasks_remove_reserved
/* 3D44 8001B544 00000000 */   nop
/* 3D48 8001B548 0480023C */  lui        $v0, %hi(fade_in_callback)
/* 3D4C 8001B54C 147F428C */  lw         $v0, %lo(fade_in_callback)($v0)
/* 3D50 8001B550 0480013C */  lui        $at, %hi(fade_in_active)
/* 3D54 8001B554 BC7D20AC */  sw         $zero, %lo(fade_in_active)($at)
/* 3D58 8001B558 0480013C */  lui        $at, %hi(fading_in)
/* 3D5C 8001B55C C07D20AC */  sw         $zero, %lo(fading_in)($at)
/* 3D60 8001B560 03004010 */  beqz       $v0, .L8001B570
/* 3D64 8001B564 00000000 */   nop
/* 3D68 8001B568 09F84000 */  jalr       $v0
/* 3D6C 8001B56C 00000000 */   nop
.L8001B570:
/* 3D70 8001B570 0480013C */  lui        $at, %hi(fade_in_callback)
/* 3D74 8001B574 147F20AC */  sw         $zero, %lo(fade_in_callback)($at)
/* 3D78 8001B578 6E6D0008 */  j          .L8001B5B8
/* 3D7C 8001B57C 00000000 */   nop
.L8001B580:
/* 3D80 8001B580 0480023C */  lui        $v0, %hi(fade_out_task)
/* 3D84 8001B584 FC7E428C */  lw         $v0, %lo(fade_out_task)($v0)
/* 3D88 8001B588 00000000 */  nop
/* 3D8C 8001B58C 06004004 */  bltz       $v0, .L8001B5A8
/* 3D90 8001B590 00040234 */   ori       $v0, $zero, 0x400
/* 3D94 8001B594 0480043C */  lui        $a0, %hi(fade_out_task)
/* 3D98 8001B598 FC7E848C */  lw         $a0, %lo(fade_out_task)($a0)
/* 3D9C 8001B59C 988C000C */  jal        tasks_remove_reserved
/* 3DA0 8001B5A0 00000000 */   nop
/* 3DA4 8001B5A4 00040234 */  ori        $v0, $zero, 0x400
.L8001B5A8:
/* 3DA8 8001B5A8 0480013C */  lui        $at, %hi(vol_scale)
/* 3DAC 8001B5AC D47D22AC */  sw         $v0, %lo(vol_scale)($at)
/* 3DB0 8001B5B0 0480013C */  lui        $at, %hi(fade_paused)
/* 3DB4 8001B5B4 D47E20AC */  sw         $zero, %lo(fade_paused)($at)
.L8001B5B8:
/* 3DB8 8001B5B8 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3DBC 8001B5BC 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3DC0 8001B5C0 DE6D0008 */  j          .L8001B778
/* 3DC4 8001B5C4 01004224 */   addiu     $v0, $v0, 0x1
.L8001B5C8:
/* 3DC8 8001B5C8 38006214 */  bne        $v1, $v0, .L8001B6AC
/* 3DCC 8001B5CC F9000234 */   ori       $v0, $zero, 0xF9
/* 3DD0 8001B5D0 0400028E */  lw         $v0, 0x4($s0)
/* 3DD4 8001B5D4 00000000 */  nop
/* 3DD8 8001B5D8 0480013C */  lui        $at, %hi(fading_in)
/* 3DDC 8001B5DC C07D22AC */  sw         $v0, %lo(fading_in)($at)
/* 3DE0 8001B5E0 0480023C */  lui        $v0, %hi(fading_in)
/* 3DE4 8001B5E4 C07D428C */  lw         $v0, %lo(fading_in)($v0)
/* 3DE8 8001B5E8 00000000 */  nop
/* 3DEC 8001B5EC 0480013C */  lui        $at, %hi(fade_in_active)
/* 3DF0 8001B5F0 BC7D22AC */  sw         $v0, %lo(fade_in_active)($at)
/* 3DF4 8001B5F4 0480033C */  lui        $v1, %hi(fading_in)
/* 3DF8 8001B5F8 C07D638C */  lw         $v1, %lo(fading_in)($v1)
/* 3DFC 8001B5FC 01000234 */  ori        $v0, $zero, 0x1
/* 3E00 8001B600 18006214 */  bne        $v1, $v0, .L8001B664
/* 3E04 8001B604 00000000 */   nop
/* 3E08 8001B608 0480023C */  lui        $v0, %hi(fade_out_active)
/* 3E0C 8001B60C B47D428C */  lw         $v0, %lo(fade_out_active)($v0)
/* 3E10 8001B610 00000000 */  nop
/* 3E14 8001B614 21004314 */  bne        $v0, $v1, .L8001B69C
/* 3E18 8001B618 00000000 */   nop
/* 3E1C 8001B61C 0480043C */  lui        $a0, %hi(fade_out_task)
/* 3E20 8001B620 FC7E848C */  lw         $a0, %lo(fade_out_task)($a0)
/* 3E24 8001B624 988C000C */  jal        tasks_remove_reserved
/* 3E28 8001B628 00000000 */   nop
/* 3E2C 8001B62C 0480023C */  lui        $v0, %hi(fade_out_callback)
/* 3E30 8001B630 0C7F428C */  lw         $v0, %lo(fade_out_callback)($v0)
/* 3E34 8001B634 0480013C */  lui        $at, %hi(fade_out_active)
/* 3E38 8001B638 B47D20AC */  sw         $zero, %lo(fade_out_active)($at)
/* 3E3C 8001B63C 0480013C */  lui        $at, %hi(fading_out)
/* 3E40 8001B640 B87D20AC */  sw         $zero, %lo(fading_out)($at)
/* 3E44 8001B644 03004010 */  beqz       $v0, .L8001B654
/* 3E48 8001B648 00000000 */   nop
/* 3E4C 8001B64C 09F84000 */  jalr       $v0
/* 3E50 8001B650 00000000 */   nop
.L8001B654:
/* 3E54 8001B654 0480013C */  lui        $at, %hi(fade_out_callback)
/* 3E58 8001B658 0C7F20AC */  sw         $zero, %lo(fade_out_callback)($at)
/* 3E5C 8001B65C A76D0008 */  j          .L8001B69C
/* 3E60 8001B660 00000000 */   nop
.L8001B664:
/* 3E64 8001B664 0480023C */  lui        $v0, %hi(fade_in_task)
/* 3E68 8001B668 047F428C */  lw         $v0, %lo(fade_in_task)($v0)
/* 3E6C 8001B66C 00000000 */  nop
/* 3E70 8001B670 06004004 */  bltz       $v0, .L8001B68C
/* 3E74 8001B674 00040234 */   ori       $v0, $zero, 0x400
/* 3E78 8001B678 0480043C */  lui        $a0, %hi(fade_in_task)
/* 3E7C 8001B67C 047F848C */  lw         $a0, %lo(fade_in_task)($a0)
/* 3E80 8001B680 988C000C */  jal        tasks_remove_reserved
/* 3E84 8001B684 00000000 */   nop
/* 3E88 8001B688 00040234 */  ori        $v0, $zero, 0x400
.L8001B68C:
/* 3E8C 8001B68C 0480013C */  lui        $at, %hi(vol_scale)
/* 3E90 8001B690 D47D22AC */  sw         $v0, %lo(vol_scale)($at)
/* 3E94 8001B694 0480013C */  lui        $at, %hi(fade_paused)
/* 3E98 8001B698 D47E20AC */  sw         $zero, %lo(fade_paused)($at)
.L8001B69C:
/* 3E9C 8001B69C 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3EA0 8001B6A0 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3EA4 8001B6A4 DE6D0008 */  j          .L8001B778
/* 3EA8 8001B6A8 01004224 */   addiu     $v0, $v0, 0x1
.L8001B6AC:
/* 3EAC 8001B6AC 11006214 */  bne        $v1, $v0, .L8001B6F4
/* 3EB0 8001B6B0 F8000234 */   ori       $v0, $zero, 0xF8
/* 3EB4 8001B6B4 00010234 */  ori        $v0, $zero, 0x100
/* 3EB8 8001B6B8 1008A2AF */  sw         $v0, 0x810($sp)
/* 3EBC 8001B6BC 0400028E */  lw         $v0, 0x4($s0)
/* 3EC0 8001B6C0 1008A427 */  addiu      $a0, $sp, 0x810
/* 3EC4 8001B6C4 C0C2000C */  jal        SpuSetCommonAttr
/* 3EC8 8001B6C8 2408A2AF */   sw        $v0, 0x824($sp)
/* 3ECC 8001B6CC 0400028E */  lw         $v0, 0x4($s0)
/* 3ED0 8001B6D0 00000000 */  nop
/* 3ED4 8001B6D4 0480013C */  lui        $at, %hi(D_80047EA4)
/* 3ED8 8001B6D8 A47E22AC */  sw         $v0, %lo(D_80047EA4)($at)
/* 3EDC 8001B6DC F97E000C */  jal        func_8001FBE4
/* 3EE0 8001B6E0 00000000 */   nop
/* 3EE4 8001B6E4 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3EE8 8001B6E8 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3EEC 8001B6EC DE6D0008 */  j          .L8001B778
/* 3EF0 8001B6F0 01004224 */   addiu     $v0, $v0, 0x1
.L8001B6F4:
/* 3EF4 8001B6F4 0F006214 */  bne        $v1, $v0, .L8001B734
/* 3EF8 8001B6F8 F7000234 */   ori       $v0, $zero, 0xF7
/* 3EFC 8001B6FC 0480023C */  lui        $v0, %hi(fade_out_active)
/* 3F00 8001B700 B47D428C */  lw         $v0, %lo(fade_out_active)($v0)
/* 3F04 8001B704 01000334 */  ori        $v1, $zero, 0x1
/* 3F08 8001B708 6B004310 */  beq        $v0, $v1, .L8001B8B8
/* 3F0C 8001B70C 00000000 */   nop
/* 3F10 8001B710 0480023C */  lui        $v0, %hi(fade_in_active)
/* 3F14 8001B714 BC7D428C */  lw         $v0, %lo(fade_in_active)($v0)
/* 3F18 8001B718 00000000 */  nop
/* 3F1C 8001B71C 66004310 */  beq        $v0, $v1, .L8001B8B8
/* 3F20 8001B720 00000000 */   nop
/* 3F24 8001B724 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3F28 8001B728 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3F2C 8001B72C DE6D0008 */  j          .L8001B778
/* 3F30 8001B730 01004224 */   addiu     $v0, $v0, 0x1
.L8001B734:
/* 3F34 8001B734 08006214 */  bne        $v1, $v0, .L8001B758
/* 3F38 8001B738 F6000234 */   ori       $v0, $zero, 0xF6
/* 3F3C 8001B73C 0400048E */  lw         $a0, 0x4($s0)
/* 3F40 8001B740 2B74000C */  jal        func_8001D0AC
/* 3F44 8001B744 00000000 */   nop
/* 3F48 8001B748 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3F4C 8001B74C 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3F50 8001B750 DE6D0008 */  j          .L8001B778
/* 3F54 8001B754 01004224 */   addiu     $v0, $v0, 0x1
.L8001B758:
/* 3F58 8001B758 14006214 */  bne        $v1, $v0, .L8001B7AC
/* 3F5C 8001B75C 00000000 */   nop
/* 3F60 8001B760 0400038E */  lw         $v1, 0x4($s0)
/* 3F64 8001B764 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3F68 8001B768 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3F6C 8001B76C 0480013C */  lui        $at, %hi(bgm_paused)
/* 3F70 8001B770 EC7D23AC */  sw         $v1, %lo(bgm_paused)($at)
/* 3F74 8001B774 01004224 */  addiu      $v0, $v0, 0x1
.L8001B778:
/* 3F78 8001B778 0480013C */  lui        $at, %hi(D_80047F34)
/* 3F7C 8001B77C 347F22A4 */  sh         $v0, %lo(D_80047F34)($at)
/* 3F80 8001B780 0480023C */  lui        $v0, %hi(_sndqueue_size)
/* 3F84 8001B784 3C7F4294 */  lhu        $v0, %lo(_sndqueue_size)($v0)
/* 3F88 8001B788 0480033C */  lui        $v1, %hi(D_80047F34)
/* 3F8C 8001B78C 347F6390 */  lbu        $v1, %lo(D_80047F34)($v1)
/* 3F90 8001B790 FFFF4224 */  addiu      $v0, $v0, -0x1
/* 3F94 8001B794 0480013C */  lui        $at, %hi(_sndqueue_size)
/* 3F98 8001B798 3C7F22A4 */  sh         $v0, %lo(_sndqueue_size)($at)
/* 3F9C 8001B79C 0480013C */  lui        $at, %hi(D_80047F34)
/* 3FA0 8001B7A0 347F23A4 */  sh         $v1, %lo(D_80047F34)($at)
/* 3FA4 8001B7A4 F46C0008 */  j          .L8001B3D0
/* 3FA8 8001B7A8 00000000 */   nop
.L8001B7AC:
/* 3FAC 8001B7AC 0480013C */  lui        $at, %hi(D_80047DD8)
/* 3FB0 8001B7B0 D87D20AC */  sw         $zero, %lo(D_80047DD8)($at)
/* 3FB4 8001B7B4 0400058E */  lw         $a1, 0x4($s0)
/* 3FB8 8001B7B8 0800068E */  lw         $a2, 0x8($s0)
/* 3FBC 8001B7BC 0400028E */  lw         $v0, 0x4($s0)
/* 3FC0 8001B7C0 0800038E */  lw         $v1, 0x8($s0)
/* 3FC4 8001B7C4 0480013C */  lui        $at, %hi(cd_arg)
/* 3FC8 8001B7C8 B47E22AC */  sw         $v0, %lo(cd_arg)($at)
/* 3FCC 8001B7CC 0480013C */  lui        $at, %hi(cd_result)
/* 3FD0 8001B7D0 BC7E23AC */  sw         $v1, %lo(cd_result)($at)
/* 3FD4 8001B7D4 C5A0000C */  jal        CdControl
/* 3FD8 8001B7D8 00000000 */   nop
/* 3FDC 8001B7DC 01000334 */  ori        $v1, $zero, 0x1
/* 3FE0 8001B7E0 15004314 */  bne        $v0, $v1, .L8001B838
/* 3FE4 8001B7E4 00000000 */   nop
/* 3FE8 8001B7E8 0480023C */  lui        $v0, %hi(D_80047F34)
/* 3FEC 8001B7EC 347F4294 */  lhu        $v0, %lo(D_80047F34)($v0)
/* 3FF0 8001B7F0 0480013C */  lui        $at, %hi(cd_busy)
/* 3FF4 8001B7F4 A87D20AC */  sw         $zero, %lo(cd_busy)($at)
/* 3FF8 8001B7F8 0480013C */  lui        $at, %hi(D_80047E94)
/* 3FFC 8001B7FC 947E20AC */  sw         $zero, %lo(D_80047E94)($at)
/* 4000 8001B800 01004224 */  addiu      $v0, $v0, 0x1
/* 4004 8001B804 0480013C */  lui        $at, %hi(D_80047F34)
/* 4008 8001B808 347F22A4 */  sh         $v0, %lo(D_80047F34)($at)
/* 400C 8001B80C 0480023C */  lui        $v0, %hi(_sndqueue_size)
/* 4010 8001B810 3C7F4294 */  lhu        $v0, %lo(_sndqueue_size)($v0)
/* 4014 8001B814 0480033C */  lui        $v1, %hi(D_80047F34)
/* 4018 8001B818 347F6390 */  lbu        $v1, %lo(D_80047F34)($v1)
/* 401C 8001B81C FFFF4224 */  addiu      $v0, $v0, -0x1
/* 4020 8001B820 0480013C */  lui        $at, %hi(_sndqueue_size)
/* 4024 8001B824 3C7F22A4 */  sh         $v0, %lo(_sndqueue_size)($at)
/* 4028 8001B828 0480013C */  lui        $at, %hi(D_80047F34)
/* 402C 8001B82C 347F23A4 */  sh         $v1, %lo(D_80047F34)($at)
/* 4030 8001B830 2E6E0008 */  j          .L8001B8B8
/* 4034 8001B834 00000000 */   nop
.L8001B838:
/* 4038 8001B838 0480013C */  lui        $at, %hi(cd_busy)
/* 403C 8001B83C A87D23AC */  sw         $v1, %lo(cd_busy)($at)
/* 4040 8001B840 2E6E0008 */  j          .L8001B8B8
/* 4044 8001B844 00000000 */   nop
.L8001B848:
/* 4048 8001B848 0480013C */  lui        $at, %hi(D_80047DD8)
/* 404C 8001B84C D87D20AC */  sw         $zero, %lo(D_80047DD8)($at)
/* 4050 8001B850 01000234 */  ori        $v0, $zero, 0x1
/* 4054 8001B854 0480013C */  lui        $at, %hi(sndqueue_com)
/* 4058 8001B858 937D22A0 */  sb         $v0, %lo(sndqueue_com)($at)
/* 405C 8001B85C 0480013C */  lui        $at, %hi(cd_arg)
/* 4060 8001B860 B47E20AC */  sw         $zero, %lo(cd_arg)($at)
/* 4064 8001B864 0480043C */  lui        $a0, %hi(cd_last_status)
/* 4068 8001B868 DC7E8424 */  addiu      $a0, $a0, %lo(cd_last_status)
/* 406C 8001B86C 0480013C */  lui        $at, %hi(cd_result)
/* 4070 8001B870 BC7E24AC */  sw         $a0, %lo(cd_result)($at)
/* 4074 8001B874 D268000C */  jal        cd_get_status
/* 4078 8001B878 00000000 */   nop
/* 407C 8001B87C 01000334 */  ori        $v1, $zero, 0x1
/* 4080 8001B880 05004314 */  bne        $v0, $v1, .L8001B898
/* 4084 8001B884 01000234 */   ori       $v0, $zero, 0x1
/* 4088 8001B888 0480013C */  lui        $at, %hi(cd_busy)
/* 408C 8001B88C A87D20AC */  sw         $zero, %lo(cd_busy)($at)
/* 4090 8001B890 286E0008 */  j          .L8001B8A0
/* 4094 8001B894 00000000 */   nop
.L8001B898:
/* 4098 8001B898 0480013C */  lui        $at, %hi(cd_busy)
/* 409C 8001B89C A87D23AC */  sw         $v1, %lo(cd_busy)($at)
.L8001B8A0:
/* 40A0 8001B8A0 0480013C */  lui        $at, %hi(_sndqueue_empty)
/* 40A4 8001B8A4 DC7D22AC */  sw         $v0, %lo(_sndqueue_empty)($at)
/* 40A8 8001B8A8 2E6E0008 */  j          .L8001B8B8
/* 40AC 8001B8AC 00000000 */   nop
.L8001B8B0:
/* 40B0 8001B8B0 0480013C */  lui        $at, %hi(cd_busy)
/* 40B4 8001B8B4 A87D30AC */  sw         $s0, %lo(cd_busy)($at)
.L8001B8B8:
/* 40B8 8001B8B8 0480013C */  lui        $at, %hi(sndqueue_is_running)
/* 40BC 8001B8BC F47E20AC */  sw         $zero, %lo(sndqueue_is_running)($at)
/* 40C0 8001B8C0 21104002 */  addu       $v0, $s2, $zero
.L8001B8C4:
/* 40C4 8001B8C4 4408BF8F */  lw         $ra, 0x844($sp)
/* 40C8 8001B8C8 4008B28F */  lw         $s2, 0x840($sp)
/* 40CC 8001B8CC 3C08B18F */  lw         $s1, 0x83C($sp)
/* 40D0 8001B8D0 3808B08F */  lw         $s0, 0x838($sp)
/* 40D4 8001B8D4 0800E003 */  jr         $ra
/* 40D8 8001B8D8 4808BD27 */   addiu     $sp, $sp, 0x848
