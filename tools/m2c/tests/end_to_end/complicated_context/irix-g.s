.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_decl
/* 0000B0 004000B0 3C010041 */  lui   $at, %hi(globali)
/* 0000B4 004000B4 AC200140 */  sw    $zero, %lo(globali)($at)
/* 0000B8 004000B8 03E00008 */  jr    $ra
/* 0000BC 004000BC 00000000 */   nop

/* 0000C0 004000C0 03E00008 */  jr    $ra
/* 0000C4 004000C4 00000000 */   nop

glabel test
/* 0000C8 004000C8 27BDFFF8 */  addiu $sp, $sp, -8
/* 0000CC 004000CC AFA60010 */  sw    $a2, 0x10($sp)
/* 0000D0 004000D0 AFA70014 */  sw    $a3, 0x14($sp)
/* 0000D4 004000D4 30A500FF */  andi  $a1, $a1, 0xff
/* 0000D8 004000D8 D7A40010 */  ldc1  $f4, 0x10($sp)
/* 0000DC 004000DC F7A40000 */  sdc1  $f4, ($sp)
/* 0000E0 004000E0 10A00009 */  beqz  $a1, .L00400108
/* 0000E4 004000E4 00000000 */   nop
/* 0000E8 004000E8 C4860004 */  lwc1  $f6, 4($a0)
/* 0000EC 004000EC 3C010041 */  lui   $at, %hi(globalf)
/* 0000F0 004000F0 E4260144 */  swc1  $f6, %lo(globalf)($at)
/* 0000F4 004000F4 8C8E0000 */  lw    $t6, ($a0)
/* 0000F8 004000F8 3C010041 */  lui   $at, %hi(globali)
/* 0000FC 004000FC AC2E0140 */  sw    $t6, %lo(globali)($at)
/* 000100 00400100 10000006 */  b     .L0040011C
/* 000104 00400104 A0850010 */   sb    $a1, 0x10($a0)
.L00400108:
/* 000108 00400108 AC800008 */  sw    $zero, 8($a0)
/* 00010C 0040010C 44804800 */  mtc1  $zero, $f9
/* 000110 00400110 44804000 */  mtc1  $zero, $f8
/* 000114 00400114 00000000 */  nop
/* 000118 00400118 F4880010 */  sdc1  $f8, 0x10($a0)
.L0040011C:
/* 00011C 0040011C 10000003 */  b     .L0040012C
/* 000120 00400120 84820002 */   lh    $v0, 2($a0)
/* 000124 00400124 10000001 */  b     .L0040012C
/* 000128 00400128 00000000 */   nop
.L0040012C:
/* 00012C 0040012C 03E00008 */  jr    $ra
/* 000130 00400130 27BD0008 */   addiu $sp, $sp, 8

/* 000134 00400134 00000000 */  nop
/* 000138 00400138 00000000 */  nop
/* 00013C 0040013C 00000000 */  nop
