.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E3168
/* 3968 800E3168 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 396C 800E316C 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 3970 800E3170 1800B2AF */  sw         $s2, 0x18($sp)
/* 3974 800E3174 1400B1AF */  sw         $s1, 0x14($sp)
/* 3978 800E3178 1000B0AF */  sw         $s0, 0x10($sp)
/* 397C 800E317C 21808000 */  addu       $s0, $a0, $zero
/* 3980 800E3180 2188A000 */  addu       $s1, $a1, $zero
/* 3984 800E3184 B493030C */  jal        func_800E4ED0
/* 3988 800E3188 21200000 */   addu      $a0, $zero, $zero
/* 398C 800E318C 0F80033C */  lui        $v1, %hi(D_800F4D70)
/* 3990 800E3190 704D638C */  lw         $v1, %lo(D_800F4D70)($v1)
/* 3994 800E3194 00000000 */  nop
/* 3998 800E3198 05007110 */  beq        $v1, $s1, .L800E31B0
/* 399C 800E319C 21904000 */   addu      $s2, $v0, $zero
/* 39A0 800E31A0 0F80013C */  lui        $at, %hi(D_800F4D6C)
/* 39A4 800E31A4 6C4D20AC */  sw         $zero, %lo(D_800F4D6C)($at)
/* 39A8 800E31A8 0F80013C */  lui        $at, %hi(D_800F4D68)
/* 39AC 800E31AC 684D20AC */  sw         $zero, %lo(D_800F4D68)($at)
.L800E31B0:
/* 39B0 800E31B0 80101000 */  sll        $v0, $s0, 2
/* 39B4 800E31B4 0F80013C */  lui        $at, %hi(D_800EB8CC)
/* 39B8 800E31B8 CCB82124 */  addiu      $at, $at, %lo(D_800EB8CC)
/* 39BC 800E31BC 21082200 */  addu       $at, $at, $v0
/* 39C0 800E31C0 0000248C */  lw         $a0, 0x0($at)
/* 39C4 800E31C4 00000000 */  nop
/* 39C8 800E31C8 06008284 */  lh         $v0, 0x6($a0)
/* 39CC 800E31CC 04008484 */  lh         $a0, 0x4($a0)
/* 39D0 800E31D0 21105100 */  addu       $v0, $v0, $s1
/* 39D4 800E31D4 40180200 */  sll        $v1, $v0, 1
/* 39D8 800E31D8 21186200 */  addu       $v1, $v1, $v0
/* 39DC 800E31DC 0F80023C */  lui        $v0, %hi(D_800F4E30)
/* 39E0 800E31E0 304E428C */  lw         $v0, %lo(D_800F4E30)($v0)
/* 39E4 800E31E4 C0280400 */  sll        $a1, $a0, 3
/* 39E8 800E31E8 0F004014 */  bnez       $v0, .L800E3228
/* 39EC 800E31EC 80300300 */   sll       $a2, $v1, 2
/* 39F0 800E31F0 0F80033C */  lui        $v1, %hi(D_800F4E38)
/* 39F4 800E31F4 384E638C */  lw         $v1, %lo(D_800F4E38)($v1)
/* 39F8 800E31F8 08000234 */  ori        $v0, $zero, 0x8
/* 39FC 800E31FC 0A006214 */  bne        $v1, $v0, .L800E3228
/* 3A00 800E3200 0400C624 */   addiu     $a2, $a2, 0x4
/* 3A04 800E3204 0F80023C */  lui        $v0, %hi(D_800F4D68)
/* 3A08 800E3208 684D428C */  lw         $v0, %lo(D_800F4D68)($v0)
/* 3A0C 800E320C 00000000 */  nop
/* 3A10 800E3210 0F80013C */  lui        $at, %hi(D_800F4D64)
/* 3A14 800E3214 644D2124 */  addiu      $at, $at, %lo(D_800F4D64)
/* 3A18 800E3218 21082200 */  addu       $at, $at, $v0
/* 3A1C 800E321C 00002490 */  lbu        $a0, 0x0($at)
/* 3A20 800E3220 EF96030C */  jal        func_800E5BBC
/* 3A24 800E3224 21380000 */   addu      $a3, $zero, $zero
.L800E3228:
/* 3A28 800E3228 0F80023C */  lui        $v0, %hi(D_800F4D6C)
/* 3A2C 800E322C 6C4D428C */  lw         $v0, %lo(D_800F4D6C)($v0)
/* 3A30 800E3230 0F80043C */  lui        $a0, %hi(D_800F4CC4)
/* 3A34 800E3234 C44C848C */  lw         $a0, %lo(D_800F4CC4)($a0)
/* 3A38 800E3238 0F80033C */  lui        $v1, %hi(D_800F4EC8)
/* 3A3C 800E323C C84E638C */  lw         $v1, %lo(D_800F4EC8)($v1)
/* 3A40 800E3240 21104400 */  addu       $v0, $v0, $a0
/* 3A44 800E3244 0F80013C */  lui        $at, %hi(D_800F4D6C)
/* 3A48 800E3248 6C4D22AC */  sw         $v0, %lo(D_800F4D6C)($at)
/* 3A4C 800E324C 2A186200 */  slt        $v1, $v1, $v0
/* 3A50 800E3250 08006010 */  beqz       $v1, .L800E3274
/* 3A54 800E3254 00000000 */   nop
/* 3A58 800E3258 0F80023C */  lui        $v0, %hi(D_800F4D68)
/* 3A5C 800E325C 684D428C */  lw         $v0, %lo(D_800F4D68)($v0)
/* 3A60 800E3260 0F80013C */  lui        $at, %hi(D_800F4D6C)
/* 3A64 800E3264 6C4D20AC */  sw         $zero, %lo(D_800F4D6C)($at)
/* 3A68 800E3268 01004224 */  addiu      $v0, $v0, 0x1
/* 3A6C 800E326C 0F80013C */  lui        $at, %hi(D_800F4D68)
/* 3A70 800E3270 684D22AC */  sw         $v0, %lo(D_800F4D68)($at)
.L800E3274:
/* 3A74 800E3274 0F80023C */  lui        $v0, %hi(D_800F4D68)
/* 3A78 800E3278 684D428C */  lw         $v0, %lo(D_800F4D68)($v0)
/* 3A7C 800E327C 00000000 */  nop
/* 3A80 800E3280 04004228 */  slti       $v0, $v0, 0x4
/* 3A84 800E3284 03004014 */  bnez       $v0, .L800E3294
/* 3A88 800E3288 00000000 */   nop
/* 3A8C 800E328C 0F80013C */  lui        $at, %hi(D_800F4D68)
/* 3A90 800E3290 684D20AC */  sw         $zero, %lo(D_800F4D68)($at)
.L800E3294:
/* 3A94 800E3294 B493030C */  jal        func_800E4ED0
/* 3A98 800E3298 FF004432 */   andi      $a0, $s2, 0xFF
/* 3A9C 800E329C 0F80013C */  lui        $at, %hi(D_800F4D70)
/* 3AA0 800E32A0 704D31AC */  sw         $s1, %lo(D_800F4D70)($at)
/* 3AA4 800E32A4 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 3AA8 800E32A8 1800B28F */  lw         $s2, 0x18($sp)
/* 3AAC 800E32AC 1400B18F */  lw         $s1, 0x14($sp)
/* 3AB0 800E32B0 1000B08F */  lw         $s0, 0x10($sp)
/* 3AB4 800E32B4 0800E003 */  jr         $ra
/* 3AB8 800E32B8 2000BD27 */   addiu     $sp, $sp, 0x20
