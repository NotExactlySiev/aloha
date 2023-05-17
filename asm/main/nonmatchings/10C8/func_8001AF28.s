.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AF28
/* 3728 8001AF28 0480073C */  lui        $a3, %hi(D_80047F2C)
/* 372C 8001AF2C 2C7FE794 */  lhu        $a3, %lo(D_80047F2C)($a3)
/* 3730 8001AF30 0580033C */  lui        $v1, %hi(D_8004D0F8)
/* 3734 8001AF34 F8D06324 */  addiu      $v1, $v1, %lo(D_8004D0F8)
/* 3738 8001AF38 40100700 */  sll        $v0, $a3, 1
/* 373C 8001AF3C 21104700 */  addu       $v0, $v0, $a3
/* 3740 8001AF40 80100200 */  sll        $v0, $v0, 2
/* 3744 8001AF44 21404300 */  addu       $t0, $v0, $v1
/* 3748 8001AF48 0480023C */  lui        $v0, %hi(D_80047DF4)
/* 374C 8001AF4C F47D428C */  lw         $v0, %lo(D_80047DF4)($v0)
/* 3750 8001AF50 01000334 */  ori        $v1, $zero, 0x1
/* 3754 8001AF54 30004310 */  beq        $v0, $v1, .L8001B018
/* 3758 8001AF58 21100000 */   addu      $v0, $zero, $zero
/* 375C 8001AF5C 0480023C */  lui        $v0, %hi(D_80047F3C)
/* 3760 8001AF60 3C7F4294 */  lhu        $v0, %lo(D_80047F3C)($v0)
/* 3764 8001AF64 00000000 */  nop
/* 3768 8001AF68 C100422C */  sltiu      $v0, $v0, 0xC1
/* 376C 8001AF6C 03004014 */  bnez       $v0, .L8001AF7C
/* 3770 8001AF70 00000000 */   nop
/* 3774 8001AF74 066C0008 */  j          .L8001B018
/* 3778 8001AF78 21100000 */   addu      $v0, $zero, $zero
.L8001AF7C:
/* 377C 8001AF7C 0480013C */  lui        $at, %hi(D_80047DF4)
/* 3780 8001AF80 F47D23AC */  sw         $v1, %lo(D_80047DF4)($at)
/* 3784 8001AF84 0100E324 */  addiu      $v1, $a3, 0x1
/* 3788 8001AF88 02006104 */  bgez       $v1, .L8001AF94
/* 378C 8001AF8C 21106000 */   addu      $v0, $v1, $zero
/* 3790 8001AF90 0001E224 */  addiu      $v0, $a3, 0x100
.L8001AF94:
/* 3794 8001AF94 03120200 */  sra        $v0, $v0, 8
/* 3798 8001AF98 00120200 */  sll        $v0, $v0, 8
/* 379C 8001AF9C 23106200 */  subu       $v0, $v1, $v0
/* 37A0 8001AFA0 40180200 */  sll        $v1, $v0, 1
/* 37A4 8001AFA4 21186200 */  addu       $v1, $v1, $v0
/* 37A8 8001AFA8 80180300 */  sll        $v1, $v1, 2
/* 37AC 8001AFAC FF000234 */  ori        $v0, $zero, 0xFF
/* 37B0 8001AFB0 0580013C */  lui        $at, %hi(D_8004D0F8)
/* 37B4 8001AFB4 F8D02124 */  addiu      $at, $at, %lo(D_8004D0F8)
/* 37B8 8001AFB8 21082300 */  addu       $at, $at, $v1
/* 37BC 8001AFBC 000022A0 */  sb         $v0, 0x0($at)
/* 37C0 8001AFC0 000004A1 */  sb         $a0, 0x0($t0)
/* 37C4 8001AFC4 040005AD */  sw         $a1, 0x4($t0)
/* 37C8 8001AFC8 080006AD */  sw         $a2, 0x8($t0)
/* 37CC 8001AFCC 0480013C */  lui        $at, %hi(D_80047DDC)
/* 37D0 8001AFD0 DC7D20AC */  sw         $zero, %lo(D_80047DDC)($at)
/* 37D4 8001AFD4 0480013C */  lui        $at, %hi(D_80047DF4)
/* 37D8 8001AFD8 F47D20AC */  sw         $zero, %lo(D_80047DF4)($at)
/* 37DC 8001AFDC 0480033C */  lui        $v1, %hi(D_80047F2C)
/* 37E0 8001AFE0 2C7F6394 */  lhu        $v1, %lo(D_80047F2C)($v1)
/* 37E4 8001AFE4 01000234 */  ori        $v0, $zero, 0x1
/* 37E8 8001AFE8 01006324 */  addiu      $v1, $v1, 0x1
/* 37EC 8001AFEC 0480013C */  lui        $at, %hi(D_80047F2C)
/* 37F0 8001AFF0 2C7F23A4 */  sh         $v1, %lo(D_80047F2C)($at)
/* 37F4 8001AFF4 0480033C */  lui        $v1, %hi(D_80047F3C)
/* 37F8 8001AFF8 3C7F6394 */  lhu        $v1, %lo(D_80047F3C)($v1)
/* 37FC 8001AFFC 0480043C */  lui        $a0, %hi(D_80047F2C)
/* 3800 8001B000 2C7F8490 */  lbu        $a0, %lo(D_80047F2C)($a0)
/* 3804 8001B004 01006324 */  addiu      $v1, $v1, 0x1
/* 3808 8001B008 0480013C */  lui        $at, %hi(D_80047F3C)
/* 380C 8001B00C 3C7F23A4 */  sh         $v1, %lo(D_80047F3C)($at)
/* 3810 8001B010 0480013C */  lui        $at, %hi(D_80047F2C)
/* 3814 8001B014 2C7F24A4 */  sh         $a0, %lo(D_80047F2C)($at)
.L8001B018:
/* 3818 8001B018 0800E003 */  jr         $ra
/* 381C 8001B01C 00000000 */   nop
