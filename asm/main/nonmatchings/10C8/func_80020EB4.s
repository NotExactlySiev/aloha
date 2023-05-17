.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020EB4
/* 96B4 80020EB4 0480043C */  lui        $a0, %hi(D_80047E24)
/* 96B8 80020EB8 247E8494 */  lhu        $a0, %lo(D_80047E24)($a0)
/* 96BC 80020EBC 0480053C */  lui        $a1, %hi(D_80047E48)
/* 96C0 80020EC0 487EA58C */  lw         $a1, %lo(D_80047E48)($a1)
/* 96C4 80020EC4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 96C8 80020EC8 1000BFAF */  sw         $ra, 0x10($sp)
/* 96CC 80020ECC 0480013C */  lui        $at, %hi(D_80047E26)
/* 96D0 80020ED0 267E24A4 */  sh         $a0, %lo(D_80047E26)($at)
/* 96D4 80020ED4 00240400 */  sll        $a0, $a0, 16
/* 96D8 80020ED8 BC83000C */  jal        func_80020EF0
/* 96DC 80020EDC 03240400 */   sra       $a0, $a0, 16
/* 96E0 80020EE0 1000BF8F */  lw         $ra, 0x10($sp)
/* 96E4 80020EE4 00000000 */  nop
/* 96E8 80020EE8 0800E003 */  jr         $ra
/* 96EC 80020EEC 1800BD27 */   addiu     $sp, $sp, 0x18
