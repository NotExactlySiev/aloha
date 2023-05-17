.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800241A8
/* C9A8 800241A8 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* C9AC 800241AC 0380033C */  lui        $v1, %hi(D_80034E70)
/* C9B0 800241B0 704E638C */  lw         $v1, %lo(D_80034E70)($v1)
/* C9B4 800241B4 1000023C */  lui        $v0, (0x100000 >> 16)
/* C9B8 800241B8 1800BFAF */  sw         $ra, 0x18($sp)
/* C9BC 800241BC 1000A2AF */  sw         $v0, 0x10($sp)
/* C9C0 800241C0 0000628C */  lw         $v0, 0x0($v1)
/* C9C4 800241C4 0001033C */  lui        $v1, (0x1000000 >> 16)
/* C9C8 800241C8 24104300 */  and        $v0, $v0, $v1
/* C9CC 800241CC 18004010 */  beqz       $v0, .L80024230
/* C9D0 800241D0 21100000 */   addu      $v0, $zero, $zero
/* C9D4 800241D4 FFFF0424 */  addiu      $a0, $zero, -0x1
.L800241D8:
/* C9D8 800241D8 1000A28F */  lw         $v0, 0x10($sp)
/* C9DC 800241DC 00000000 */  nop
/* C9E0 800241E0 FFFF4224 */  addiu      $v0, $v0, -0x1
/* C9E4 800241E4 1000A2AF */  sw         $v0, 0x10($sp)
/* C9E8 800241E8 1000A28F */  lw         $v0, 0x10($sp)
/* C9EC 800241EC 00000000 */  nop
/* C9F0 800241F0 07004414 */  bne        $v0, $a0, .L80024210
/* C9F4 800241F4 00000000 */   nop
/* C9F8 800241F8 0280043C */  lui        $a0, %hi(D_80018170)
/* C9FC 800241FC 70818424 */  addiu      $a0, $a0, %lo(D_80018170)
/* CA00 80024200 9090000C */  jal        func_80024240
/* CA04 80024204 00000000 */   nop
/* CA08 80024208 8C900008 */  j          .L80024230
/* CA0C 8002420C FFFF0224 */   addiu     $v0, $zero, -0x1
.L80024210:
/* CA10 80024210 0380023C */  lui        $v0, %hi(D_80034E70)
/* CA14 80024214 704E428C */  lw         $v0, %lo(D_80034E70)($v0)
/* CA18 80024218 00000000 */  nop
/* CA1C 8002421C 0000428C */  lw         $v0, 0x0($v0)
/* CA20 80024220 00000000 */  nop
/* CA24 80024224 24104300 */  and        $v0, $v0, $v1
/* CA28 80024228 EBFF4014 */  bnez       $v0, .L800241D8
/* CA2C 8002422C 21100000 */   addu      $v0, $zero, $zero
.L80024230:
/* CA30 80024230 1800BF8F */  lw         $ra, 0x18($sp)
/* CA34 80024234 2000BD27 */  addiu      $sp, $sp, 0x20
/* CA38 80024238 0800E003 */  jr         $ra
/* CA3C 8002423C 00000000 */   nop
