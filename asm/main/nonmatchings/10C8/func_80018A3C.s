.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80018A3C
/* 123C 80018A3C 2B008228 */  slti       $v0, $a0, 0x2B
/* 1240 80018A40 07004010 */  beqz       $v0, .L80018A60
/* 1244 80018A44 C0100400 */   sll       $v0, $a0, 3
/* 1248 80018A48 0380013C */  lui        $at, %hi(D_800318BC)
/* 124C 80018A4C BC182124 */  addiu      $at, $at, %lo(D_800318BC)
/* 1250 80018A50 21082200 */  addu       $at, $at, $v0
/* 1254 80018A54 0000228C */  lw         $v0, 0x0($at)
/* 1258 80018A58 99620008 */  j          .L80018A64
/* 125C 80018A5C 00000000 */   nop
.L80018A60:
/* 1260 80018A60 21100000 */  addu       $v0, $zero, $zero
.L80018A64:
/* 1264 80018A64 0800E003 */  jr         $ra
/* 1268 80018A68 00000000 */   nop
