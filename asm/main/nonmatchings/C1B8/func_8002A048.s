.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A048
/* 12848 8002A048 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1284C 8002A04C 1400B1AF */  sw         $s1, 0x14($sp)
/* 12850 8002A050 21888000 */  addu       $s1, $a0, $zero
/* 12854 8002A054 1800B2AF */  sw         $s2, 0x18($sp)
/* 12858 8002A058 2190A000 */  addu       $s2, $a1, $zero
/* 1285C 8002A05C 1000B0AF */  sw         $s0, 0x10($sp)
/* 12860 8002A060 0480103C */  lui        $s0, %hi(D_8004728C)
/* 12864 8002A064 8C721026 */  addiu      $s0, $s0, %lo(D_8004728C)
/* 12868 8002A068 1C00BFAF */  sw         $ra, 0x1C($sp)
.L8002A06C:
/* 1286C 8002A06C 21204002 */  addu       $a0, $s2, $zero
/* 12870 8002A070 0580053C */  lui        $a1, %hi(D_8005368C)
/* 12874 8002A074 8C36A524 */  addiu      $a1, $a1, %lo(D_8005368C)
/* 12878 8002A078 08008010 */  beqz       $a0, .L8002A09C
/* 1287C 8002A07C 07000334 */   ori       $v1, $zero, 0x7
/* 12880 8002A080 FFFF0624 */  addiu      $a2, $zero, -0x1
.L8002A084:
/* 12884 8002A084 0000A290 */  lbu        $v0, 0x0($a1)
/* 12888 8002A088 0100A524 */  addiu      $a1, $a1, 0x1
/* 1288C 8002A08C FFFF6324 */  addiu      $v1, $v1, -0x1
/* 12890 8002A090 000082A0 */  sb         $v0, 0x0($a0)
/* 12894 8002A094 FBFF6614 */  bne        $v1, $a2, .L8002A084
/* 12898 8002A098 01008424 */   addiu     $a0, $a0, 0x1
.L8002A09C:
/* 1289C 8002A09C B1B0000C */  jal        func_8002C2C4
/* 128A0 8002A0A0 FFFF0424 */   addiu     $a0, $zero, -0x1
/* 128A4 8002A0A4 0000038E */  lw         $v1, 0x0($s0)
/* 128A8 8002A0A8 00000000 */  nop
/* 128AC 8002A0AC 2A186200 */  slt        $v1, $v1, $v0
/* 128B0 8002A0B0 02006010 */  beqz       $v1, .L8002A0BC
/* 128B4 8002A0B4 FFFF0224 */   addiu     $v0, $zero, -0x1
/* 128B8 8002A0B8 FCFF02AE */  sw         $v0, -0x4($s0)
.L8002A0BC:
/* 128BC 8002A0BC FCFF028E */  lw         $v0, -0x4($s0)
/* 128C0 8002A0C0 00000000 */  nop
/* 128C4 8002A0C4 03004104 */  bgez       $v0, .L8002A0D4
/* 128C8 8002A0C8 00000000 */   nop
/* 128CC 8002A0CC 2BA7000C */  jal        func_80029CAC
/* 128D0 8002A0D0 00000000 */   nop
.L8002A0D4:
/* 128D4 8002A0D4 FCFF028E */  lw         $v0, -0x4($s0)
/* 128D8 8002A0D8 00000000 */  nop
/* 128DC 8002A0DC 03004014 */  bnez       $v0, .L8002A0EC
/* 128E0 8002A0E0 00000000 */   nop
/* 128E4 8002A0E4 49A8000C */  jal        func_8002A124
/* 128E8 8002A0E8 21200000 */   addu      $a0, $zero, $zero
.L8002A0EC:
/* 128EC 8002A0EC 05002016 */  bnez       $s1, .L8002A104
/* 128F0 8002A0F0 00000000 */   nop
/* 128F4 8002A0F4 FCFF028E */  lw         $v0, -0x4($s0)
/* 128F8 8002A0F8 00000000 */  nop
/* 128FC 8002A0FC DBFF401C */  bgtz       $v0, .L8002A06C
/* 12900 8002A100 00000000 */   nop
.L8002A104:
/* 12904 8002A104 FCFF028E */  lw         $v0, -0x4($s0)
/* 12908 8002A108 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1290C 8002A10C 1800B28F */  lw         $s2, 0x18($sp)
/* 12910 8002A110 1400B18F */  lw         $s1, 0x14($sp)
/* 12914 8002A114 1000B08F */  lw         $s0, 0x10($sp)
/* 12918 8002A118 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1291C 8002A11C 0800E003 */  jr         $ra
/* 12920 8002A120 00000000 */   nop
