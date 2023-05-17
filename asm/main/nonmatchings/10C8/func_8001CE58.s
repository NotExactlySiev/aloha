.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001CE58
/* 5658 8001CE58 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 565C 8001CE5C 1000BFAF */  sw         $ra, 0x10($sp)
/* 5660 8001CE60 0480033C */  lui        $v1, %hi(D_80047DEC)
/* 5664 8001CE64 EC7D638C */  lw         $v1, %lo(D_80047DEC)($v1)
/* 5668 8001CE68 01000234 */  ori        $v0, $zero, 0x1
/* 566C 8001CE6C 08006214 */  bne        $v1, $v0, .L8001CE90
/* 5670 8001CE70 1B000434 */   ori       $a0, $zero, 0x1B
/* 5674 8001CE74 21280000 */  addu       $a1, $zero, $zero
/* 5678 8001CE78 086C000C */  jal        func_8001B020
/* 567C 8001CE7C 21300000 */   addu      $a2, $zero, $zero
/* 5680 8001CE80 F6000434 */  ori        $a0, $zero, 0xF6
/* 5684 8001CE84 21280000 */  addu       $a1, $zero, $zero
/* 5688 8001CE88 086C000C */  jal        func_8001B020
/* 568C 8001CE8C 21300000 */   addu      $a2, $zero, $zero
.L8001CE90:
/* 5690 8001CE90 1000BF8F */  lw         $ra, 0x10($sp)
/* 5694 8001CE94 00000000 */  nop
/* 5698 8001CE98 0800E003 */  jr         $ra
/* 569C 8001CE9C 1800BD27 */   addiu     $sp, $sp, 0x18
