.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FC34
/* 8434 8001FC34 1F008430 */  andi       $a0, $a0, 0x1F
/* 8438 8001FC38 00210400 */  sll        $a0, $a0, 4
/* 843C 8001FC3C 0580013C */  lui        $at, %hi(D_8005206F)
/* 8440 8001FC40 6F202124 */  addiu      $at, $at, %lo(D_8005206F)
/* 8444 8001FC44 21082400 */  addu       $at, $at, $a0
/* 8448 8001FC48 00002290 */  lbu        $v0, 0x0($at)
/* 844C 8001FC4C 00000000 */  nop
/* 8450 8001FC50 01004238 */  xori       $v0, $v0, 0x1
/* 8454 8001FC54 0800E003 */  jr         $ra
/* 8458 8001FC58 0100422C */   sltiu     $v0, $v0, 0x1
