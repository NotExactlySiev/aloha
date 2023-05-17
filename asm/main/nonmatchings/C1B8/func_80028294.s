.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80028294
/* 10A94 80028294 FF008430 */  andi       $a0, $a0, 0xFF
/* 10A98 80028298 0700822C */  sltiu      $v0, $a0, 0x7
/* 10A9C 8002829C 07004010 */  beqz       $v0, .L800282BC
/* 10AA0 800282A0 80100400 */   sll       $v0, $a0, 2
/* 10AA4 800282A4 0480013C */  lui        $at, %hi(D_8004702C)
/* 10AA8 800282A8 2C702124 */  addiu      $at, $at, %lo(D_8004702C)
/* 10AAC 800282AC 21082200 */  addu       $at, $at, $v0
/* 10AB0 800282B0 0000228C */  lw         $v0, 0x0($at)
/* 10AB4 800282B4 B1A00008 */  j          .L800282C4
/* 10AB8 800282B8 00000000 */   nop
.L800282BC:
/* 10ABC 800282BC 0280023C */  lui        $v0, %hi(D_800184D8)
/* 10AC0 800282C0 D8844224 */  addiu      $v0, $v0, %lo(D_800184D8)
.L800282C4:
/* 10AC4 800282C4 0800E003 */  jr         $ra
/* 10AC8 800282C8 00000000 */   nop
