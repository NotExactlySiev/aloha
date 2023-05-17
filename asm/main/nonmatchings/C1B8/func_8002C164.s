.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002C164
/* 14964 8002C164 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 14968 8002C168 0480033C */  lui        $v1, %hi(D_800473EC)
/* 1496C 8002C16C EC73638C */  lw         $v1, %lo(D_800473EC)($v1)
/* 14970 8002C170 07010234 */  ori        $v0, $zero, 0x107
/* 14974 8002C174 1400BFAF */  sw         $ra, 0x14($sp)
/* 14978 8002C178 1000B0AF */  sw         $s0, 0x10($sp)
/* 1497C 8002C17C 000062AC */  sw         $v0, 0x0($v1)
/* 14980 8002C180 EA8E000C */  jal        func_80023BA8
/* 14984 8002C184 21200000 */   addu      $a0, $zero, $zero
/* 14988 8002C188 03000434 */  ori        $a0, $zero, 0x3
/* 1498C 8002C18C 36AF000C */  jal        func_8002BCD8
/* 14990 8002C190 21280000 */   addu      $a1, $zero, $zero
/* 14994 8002C194 0480103C */  lui        $s0, %hi(D_800473F0)
/* 14998 8002C198 F0731026 */  addiu      $s0, $s0, %lo(D_800473F0)
/* 1499C 8002C19C 21200002 */  addu       $a0, $s0, $zero
/* 149A0 8002C1A0 A6B0000C */  jal        func_8002C298
/* 149A4 8002C1A4 02000534 */   ori       $a1, $zero, 0x2
/* 149A8 8002C1A8 0380053C */  lui        $a1, %hi(func_8002C214)
/* 149AC 8002C1AC 14C2A524 */  addiu      $a1, $a1, %lo(func_8002C214)
/* 149B0 8002C1B0 D4AD000C */  jal        func_8002B750
/* 149B4 8002C1B4 21200000 */   addu      $a0, $zero, $zero
/* 149B8 8002C1B8 0380023C */  lui        $v0, %hi(func_8002C260)
/* 149BC 8002C1BC 60C24224 */  addiu      $v0, $v0, %lo(func_8002C260)
/* 149C0 8002C1C0 01000334 */  ori        $v1, $zero, 0x1
/* 149C4 8002C1C4 000003A6 */  sh         $v1, 0x0($s0)
/* 149C8 8002C1C8 1400BF8F */  lw         $ra, 0x14($sp)
/* 149CC 8002C1CC 1000B08F */  lw         $s0, 0x10($sp)
/* 149D0 8002C1D0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 149D4 8002C1D4 0800E003 */  jr         $ra
/* 149D8 8002C1D8 00000000 */   nop
