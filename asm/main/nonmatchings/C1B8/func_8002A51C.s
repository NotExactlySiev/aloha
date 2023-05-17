.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A51C
/* 12D1C 8002A51C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12D20 8002A520 1000B0AF */  sw         $s0, 0x10($sp)
/* 12D24 8002A524 04001034 */  ori        $s0, $zero, 0x4
/* 12D28 8002A528 1400B1AF */  sw         $s1, 0x14($sp)
/* 12D2C 8002A52C FFFF1124 */  addiu      $s1, $zero, -0x1
/* 12D30 8002A530 1800BFAF */  sw         $ra, 0x18($sp)
.L8002A534:
/* 12D34 8002A534 17A6000C */  jal        func_8002985C
/* 12D38 8002A538 00000000 */   nop
/* 12D3C 8002A53C 09004010 */  beqz       $v0, .L8002A564
/* 12D40 8002A540 FFFF1026 */   addiu     $s0, $s0, -0x1
/* 12D44 8002A544 FBFF1116 */  bne        $s0, $s1, .L8002A534
/* 12D48 8002A548 00000000 */   nop
/* 12D4C 8002A54C 0280043C */  lui        $a0, %hi(D_800186F4)
/* 12D50 8002A550 F4868424 */  addiu      $a0, $a0, %lo(D_800186F4)
/* 12D54 8002A554 1E8F000C */  jal        k_printf
/* 12D58 8002A558 00000000 */   nop
/* 12D5C 8002A55C 65A90008 */  j          .L8002A594
/* 12D60 8002A560 00000000 */   nop
.L8002A564:
/* 12D64 8002A564 0380043C */  lui        $a0, %hi(func_8002A5AC)
/* 12D68 8002A568 ACA58424 */  addiu      $a0, $a0, %lo(func_8002A5AC)
/* 12D6C 8002A56C B3A0000C */  jal        func_800282CC
/* 12D70 8002A570 00000000 */   nop
/* 12D74 8002A574 0380043C */  lui        $a0, %hi(func_8002A5D4)
/* 12D78 8002A578 D4A58424 */  addiu      $a0, $a0, %lo(func_8002A5D4)
/* 12D7C 8002A57C B9A0000C */  jal        func_800282E4
/* 12D80 8002A580 00000000 */   nop
/* 12D84 8002A584 0380043C */  lui        $a0, %hi(func_8002A5FC)
/* 12D88 8002A588 FCA58424 */  addiu      $a0, $a0, %lo(func_8002A5FC)
/* 12D8C 8002A58C BFA0000C */  jal        func_800282FC
/* 12D90 8002A590 00000000 */   nop
.L8002A594:
/* 12D94 8002A594 1800BF8F */  lw         $ra, 0x18($sp)
/* 12D98 8002A598 1400B18F */  lw         $s1, 0x14($sp)
/* 12D9C 8002A59C 1000B08F */  lw         $s0, 0x10($sp)
/* 12DA0 8002A5A0 2000BD27 */  addiu      $sp, $sp, 0x20
/* 12DA4 8002A5A4 0800E003 */  jr         $ra
/* 12DA8 8002A5A8 00000000 */   nop
