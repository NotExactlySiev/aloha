.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031254
/* 19A54 80031254 0480023C */  lui        $v0, %hi(D_800478E0)
/* 19A58 80031258 E078428C */  lw         $v0, %lo(D_800478E0)($v0)
/* 19A5C 8003125C E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 19A60 80031260 1400B1AF */  sw         $s1, 0x14($sp)
/* 19A64 80031264 21888000 */  addu       $s1, $a0, $zero
/* 19A68 80031268 1000B0AF */  sw         $s0, 0x10($sp)
/* 19A6C 8003126C 01001034 */  ori        $s0, $zero, 0x1
/* 19A70 80031270 06005010 */  beq        $v0, $s0, .L8003128C
/* 19A74 80031274 1800BFAF */   sw        $ra, 0x18($sp)
/* 19A78 80031278 0580023C */  lui        $v0, %hi(D_80054704)
/* 19A7C 8003127C 0447428C */  lw         $v0, %lo(D_80054704)($v0)
/* 19A80 80031280 00000000 */  nop
/* 19A84 80031284 03005014 */  bne        $v0, $s0, .L80031294
/* 19A88 80031288 00000000 */   nop
.L8003128C:
/* 19A8C 8003128C BCC40008 */  j          .L800312F0
/* 19A90 80031290 01000234 */   ori       $v0, $zero, 0x1
.L80031294:
/* 19A94 80031294 0480043C */  lui        $a0, %hi(D_800478F4)
/* 19A98 80031298 F478848C */  lw         $a0, %lo(D_800478F4)($a0)
/* 19A9C 8003129C 028F000C */  jal        func_80023C08
/* 19AA0 800312A0 00000000 */   nop
/* 19AA4 800312A4 0E003016 */  bne        $s1, $s0, .L800312E0
/* 19AA8 800312A8 21184000 */   addu      $v1, $v0, $zero
/* 19AAC 800312AC 08006014 */  bnez       $v1, .L800312D0
/* 19AB0 800312B0 01000234 */   ori       $v0, $zero, 0x1
.L800312B4:
/* 19AB4 800312B4 0480043C */  lui        $a0, %hi(D_800478F4)
/* 19AB8 800312B8 F478848C */  lw         $a0, %lo(D_800478F4)($a0)
/* 19ABC 800312BC 028F000C */  jal        func_80023C08
/* 19AC0 800312C0 00000000 */   nop
/* 19AC4 800312C4 21184000 */  addu       $v1, $v0, $zero
/* 19AC8 800312C8 FAFF6010 */  beqz       $v1, .L800312B4
/* 19ACC 800312CC 01000234 */   ori       $v0, $zero, 0x1
.L800312D0:
/* 19AD0 800312D0 0580013C */  lui        $at, %hi(D_80054704)
/* 19AD4 800312D4 044722AC */  sw         $v0, %lo(D_80054704)($at)
/* 19AD8 800312D8 BCC40008 */  j          .L800312F0
/* 19ADC 800312DC 21106000 */   addu      $v0, $v1, $zero
.L800312E0:
/* 19AE0 800312E0 03007014 */  bne        $v1, $s0, .L800312F0
/* 19AE4 800312E4 21106000 */   addu      $v0, $v1, $zero
/* 19AE8 800312E8 0580013C */  lui        $at, %hi(D_80054704)
/* 19AEC 800312EC 044723AC */  sw         $v1, %lo(D_80054704)($at)
.L800312F0:
/* 19AF0 800312F0 1800BF8F */  lw         $ra, 0x18($sp)
/* 19AF4 800312F4 1400B18F */  lw         $s1, 0x14($sp)
/* 19AF8 800312F8 1000B08F */  lw         $s0, 0x10($sp)
/* 19AFC 800312FC 2000BD27 */  addiu      $sp, $sp, 0x20
/* 19B00 80031300 0800E003 */  jr         $ra
/* 19B04 80031304 00000000 */   nop
