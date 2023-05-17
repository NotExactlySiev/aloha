.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FFD4
/* 87D4 8001FFD4 0480023C */  lui        $v0, %hi(D_80047E1C)
/* 87D8 8001FFD8 1C7E428C */  lw         $v0, %lo(D_80047E1C)($v0)
/* 87DC 8001FFDC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 87E0 8001FFE0 03004010 */  beqz       $v0, .L8001FFF0
/* 87E4 8001FFE4 1000BFAF */   sw        $ra, 0x10($sp)
/* 87E8 8001FFE8 09F84000 */  jalr       $v0
/* 87EC 8001FFEC 00000000 */   nop
.L8001FFF0:
/* 87F0 8001FFF0 1000BF8F */  lw         $ra, 0x10($sp)
/* 87F4 8001FFF4 00000000 */  nop
/* 87F8 8001FFF8 0800E003 */  jr         $ra
/* 87FC 8001FFFC 1800BD27 */   addiu     $sp, $sp, 0x18
