.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

# Handwritten function
glabel func_800E9534
/* 9D34 800E9534 0F800E3C */  lui        $t6, %hi(D_800F05FC)
/* 9D38 800E9538 FC05CE8D */  lw         $t6, %lo(D_800F05FC)($t6)
/* 9D3C 800E953C 00000000 */  nop
/* 9D40 800E9540 8002C129 */  slti       $at, $t6, 0x280
/* 9D44 800E9544 0A002014 */  bnez       $at, .L800E9570
/* 9D48 800E9548 0F80013C */   lui       $at, %hi(D_800F05F0)
/* 9D4C 800E954C F0053FAC */  sw         $ra, %lo(D_800F05F0)($at)
/* 9D50 800E9550 0F80043C */  lui        $a0, %hi(D_800F0880)
/* 9D54 800E9554 1BA2030C */  jal        func_800E886C
/* 9D58 800E9558 80088424 */   addiu     $a0, $a0, %lo(D_800F0880)
/* 9D5C 800E955C 0F801F3C */  lui        $ra, %hi(D_800F05F0)
/* 9D60 800E9560 F005FF8F */  lw         $ra, %lo(D_800F05F0)($ra)
/* 9D64 800E9564 00000000 */  nop
/* 9D68 800E9568 0800E003 */  jr         $ra
/* 9D6C 800E956C 00000000 */   nop
.L800E9570:
/* 9D70 800E9570 0F800F3C */  lui        $t7, %hi(D_800F0600)
/* 9D74 800E9574 2178EE01 */  addu       $t7, $t7, $t6
/* 9D78 800E9578 0006EF25 */  addiu      $t7, $t7, %lo(D_800F0600)
/* 9D7C 800E957C 00004848 */  cfc2       $t0, $0 # handwritten instruction
/* 9D80 800E9580 00084948 */  cfc2       $t1, $1 # handwritten instruction
/* 9D84 800E9584 0000E8AD */  sw         $t0, 0x0($t7)
/* 9D88 800E9588 0400E9AD */  sw         $t1, 0x4($t7)
/* 9D8C 800E958C 00104848 */  cfc2       $t0, $2 # handwritten instruction
/* 9D90 800E9590 00184948 */  cfc2       $t1, $3 # handwritten instruction
/* 9D94 800E9594 0800E8AD */  sw         $t0, 0x8($t7)
/* 9D98 800E9598 0C00E9AD */  sw         $t1, 0xC($t7)
/* 9D9C 800E959C 00204848 */  cfc2       $t0, $4 # handwritten instruction
/* 9DA0 800E95A0 00000000 */  nop
/* 9DA4 800E95A4 1000E8AD */  sw         $t0, 0x10($t7)
/* 9DA8 800E95A8 00284848 */  cfc2       $t0, $5 # handwritten instruction
/* 9DAC 800E95AC 00304948 */  cfc2       $t1, $6 # handwritten instruction
/* 9DB0 800E95B0 00384A48 */  cfc2       $t2, $7 # handwritten instruction
/* 9DB4 800E95B4 1400E8AD */  sw         $t0, 0x14($t7)
/* 9DB8 800E95B8 1800E9AD */  sw         $t1, 0x18($t7)
/* 9DBC 800E95BC 1C00EAAD */  sw         $t2, 0x1C($t7)
/* 9DC0 800E95C0 2000CE21 */  addi       $t6, $t6, 0x20 # handwritten instruction
/* 9DC4 800E95C4 0F80013C */  lui        $at, %hi(D_800F05FC)
/* 9DC8 800E95C8 FC052EAC */  sw         $t6, %lo(D_800F05FC)($at)
/* 9DCC 800E95CC 0800E003 */  jr         $ra
/* 9DD0 800E95D0 00000000 */   nop
