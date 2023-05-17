.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020F48
/* 9748 80020F48 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 974C 80020F4C 1400BFAF */  sw         $ra, 0x14($sp)
/* 9750 80020F50 1000B0AF */  sw         $s0, 0x10($sp)
/* 9754 80020F54 0480103C */  lui        $s0, %hi(D_80047E24)
/* 9758 80020F58 247E1096 */  lhu        $s0, %lo(D_80047E24)($s0)
/* 975C 80020F5C 21108000 */  addu       $v0, $a0, $zero
/* 9760 80020F60 0480013C */  lui        $at, %hi(D_80047E24)
/* 9764 80020F64 247E22A4 */  sh         $v0, %lo(D_80047E24)($at)
/* 9768 80020F68 0480013C */  lui        $at, %hi(D_80047E26)
/* 976C 80020F6C 267E22A4 */  sh         $v0, %lo(D_80047E26)($at)
/* 9770 80020F70 00240400 */  sll        $a0, $a0, 16
/* 9774 80020F74 0480053C */  lui        $a1, %hi(D_80047E48)
/* 9778 80020F78 487EA58C */  lw         $a1, %lo(D_80047E48)($a1)
/* 977C 80020F7C BC83000C */  jal        func_80020EF0
/* 9780 80020F80 03240400 */   sra       $a0, $a0, 16
/* 9784 80020F84 00841000 */  sll        $s0, $s0, 16
/* 9788 80020F88 03141000 */  sra        $v0, $s0, 16
/* 978C 80020F8C 1400BF8F */  lw         $ra, 0x14($sp)
/* 9790 80020F90 1000B08F */  lw         $s0, 0x10($sp)
/* 9794 80020F94 0800E003 */  jr         $ra
/* 9798 80020F98 1800BD27 */   addiu     $sp, $sp, 0x18
