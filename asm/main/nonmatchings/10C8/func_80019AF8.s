.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019AF8
/* 22F8 80019AF8 0480033C */  lui        $v1, %hi(D_80047D54)
/* 22FC 80019AFC 547D638C */  lw         $v1, %lo(D_80047D54)($v1)
/* 2300 80019B00 00000000 */  nop
/* 2304 80019B04 03006010 */  beqz       $v1, .L80019B14
/* 2308 80019B08 21100000 */   addu      $v0, $zero, $zero
/* 230C 80019B0C 0580023C */  lui        $v0, %hi(D_80048048)
/* 2310 80019B10 48804224 */  addiu      $v0, $v0, %lo(D_80048048)
.L80019B14:
/* 2314 80019B14 0800E003 */  jr         $ra
/* 2318 80019B18 00000000 */   nop
