.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1BCC
/* 23CC 800E1BCC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 23D0 800E1BD0 1000BFAF */  sw         $ra, 0x10($sp)
/* 23D4 800E1BD4 0983030C */  jal        func_800E0C24
/* 23D8 800E1BD8 00000000 */   nop
/* 23DC 800E1BDC 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 23E0 800E1BE0 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 23E4 800E1BE4 00000000 */  nop
/* 23E8 800E1BE8 640A428C */  lw         $v0, 0xA64($v0)
/* 23EC 800E1BEC 00000000 */  nop
/* 23F0 800E1BF0 09F84000 */  jalr       $v0
/* 23F4 800E1BF4 21200000 */   addu      $a0, $zero, $zero
/* 23F8 800E1BF8 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 23FC 800E1BFC A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 2400 800E1C00 00000000 */  nop
/* 2404 800E1C04 040A428C */  lw         $v0, 0xA04($v0)
/* 2408 800E1C08 00000000 */  nop
/* 240C 800E1C0C 09F84000 */  jalr       $v0
/* 2410 800E1C10 21200000 */   addu      $a0, $zero, $zero
/* 2414 800E1C14 1000BF8F */  lw         $ra, 0x10($sp)
/* 2418 800E1C18 00000000 */  nop
/* 241C 800E1C1C 0800E003 */  jr         $ra
/* 2420 800E1C20 1800BD27 */   addiu     $sp, $sp, 0x18
