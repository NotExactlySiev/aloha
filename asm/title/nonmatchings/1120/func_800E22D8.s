.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E22D8
/* 2AD8 800E22D8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 2ADC 800E22DC 1800BFAF */  sw         $ra, 0x18($sp)
/* 2AE0 800E22E0 80200400 */  sll        $a0, $a0, 2
/* 2AE4 800E22E4 0F80013C */  lui        $at, %hi(D_800EB8CC)
/* 2AE8 800E22E8 CCB82124 */  addiu      $at, $at, %lo(D_800EB8CC)
/* 2AEC 800E22EC 21082400 */  addu       $at, $at, $a0
/* 2AF0 800E22F0 0000268C */  lw         $a2, 0x0($at)
/* 2AF4 800E22F4 0F80053C */  lui        $a1, %hi(D_800F4E38)
/* 2AF8 800E22F8 384EA58C */  lw         $a1, %lo(D_800F4E38)($a1)
/* 2AFC 800E22FC 1600C784 */  lh         $a3, 0x16($a2)
/* 2B00 800E2300 1A00C484 */  lh         $a0, 0x1A($a2)
/* 2B04 800E2304 1400C884 */  lh         $t0, 0x14($a2)
/* 2B08 800E2308 1800C984 */  lh         $t1, 0x18($a2)
/* 2B0C 800E230C 2800A010 */  beqz       $a1, .L800E23B0
/* 2B10 800E2310 0800A228 */   slti      $v0, $a1, 0x8
/* 2B14 800E2314 12004010 */  beqz       $v0, .L800E2360
/* 2B18 800E2318 C2170400 */   srl       $v0, $a0, 31
/* 2B1C 800E231C 21108200 */  addu       $v0, $a0, $v0
/* 2B20 800E2320 43100200 */  sra        $v0, $v0, 1
/* 2B24 800E2324 18004500 */  mult       $v0, $a1
/* 2B28 800E2328 12180000 */  mflo       $v1
/* 2B2C 800E232C 00000000 */  nop
/* 2B30 800E2330 00000000 */  nop
/* 2B34 800E2334 02006104 */  bgez       $v1, .L800E2340
/* 2B38 800E2338 2138E200 */   addu      $a3, $a3, $v0
/* 2B3C 800E233C 07006324 */  addiu      $v1, $v1, 0x7
.L800E2340:
/* 2B40 800E2340 18008500 */  mult       $a0, $a1
/* 2B44 800E2344 12200000 */  mflo       $a0
/* 2B48 800E2348 00000000 */  nop
/* 2B4C 800E234C C3100300 */  sra        $v0, $v1, 3
/* 2B50 800E2350 02008104 */  bgez       $a0, .L800E235C
/* 2B54 800E2354 2338E200 */   subu      $a3, $a3, $v0
/* 2B58 800E2358 07008424 */  addiu      $a0, $a0, 0x7
.L800E235C:
/* 2B5C 800E235C C3200400 */  sra        $a0, $a0, 3
.L800E2360:
/* 2B60 800E2360 1000A8A7 */  sh         $t0, 0x10($sp)
/* 2B64 800E2364 1200A7A7 */  sh         $a3, 0x12($sp)
/* 2B68 800E2368 1400A9A7 */  sh         $t1, 0x14($sp)
/* 2B6C 800E236C 1600A4A7 */  sh         $a0, 0x16($sp)
/* 2B70 800E2370 1800C284 */  lh         $v0, 0x18($a2)
/* 2B74 800E2374 00000000 */  nop
/* 2B78 800E2378 0D004010 */  beqz       $v0, .L800E23B0
/* 2B7C 800E237C 02000225 */   addiu     $v0, $t0, 0x2
/* 2B80 800E2380 0F80053C */  lui        $a1, %hi(D_800F4E38)
/* 2B84 800E2384 384EA58C */  lw         $a1, %lo(D_800F4E38)($a1)
/* 2B88 800E2388 1000A2A7 */  sh         $v0, 0x10($sp)
/* 2B8C 800E238C 0400E224 */  addiu      $v0, $a3, 0x4
/* 2B90 800E2390 1200A2A7 */  sh         $v0, 0x12($sp)
/* 2B94 800E2394 0C002225 */  addiu      $v0, $t1, 0xC
/* 2B98 800E2398 1400A2A7 */  sh         $v0, 0x14($sp)
/* 2B9C 800E239C 10008224 */  addiu      $v0, $a0, 0x10
/* 2BA0 800E23A0 1600A2A7 */  sh         $v0, 0x16($sp)
/* 2BA4 800E23A4 1000A427 */  addiu      $a0, $sp, 0x10
/* 2BA8 800E23A8 509A030C */  jal        func_800E6940
/* 2BAC 800E23AC 80280500 */   sll       $a1, $a1, 2
.L800E23B0:
/* 2BB0 800E23B0 1800BF8F */  lw         $ra, 0x18($sp)
/* 2BB4 800E23B4 00000000 */  nop
/* 2BB8 800E23B8 0800E003 */  jr         $ra
/* 2BBC 800E23BC 2000BD27 */   addiu     $sp, $sp, 0x20
