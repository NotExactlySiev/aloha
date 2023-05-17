.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80019908
/* 2108 80019908 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 210C 8001990C 1000BFAF */  sw         $ra, 0x10($sp)
/* 2110 80019910 0180033C */  lui        $v1, %hi(D_80010000)
/* 2114 80019914 80280500 */  sll        $a1, $a1, 2
/* 2118 80019918 2118A300 */  addu       $v1, $a1, $v1
/* 211C 8001991C FF0F023C */  lui        $v0, (0xFFFFFFF >> 16)
/* 2120 80019920 FFFF4234 */  ori        $v0, $v0, (0xFFFFFFF & 0xFFFF)
/* 2124 80019924 24208200 */  and        $a0, $a0, $v0
/* 2128 80019928 0080023C */  lui        $v0, (0x80000000 >> 16)
/* 212C 8001992C 25208200 */  or         $a0, $a0, $v0
/* 2130 80019930 2166000C */  jal        func_80019884
/* 2134 80019934 000064AC */   sw        $a0, %lo(D_80010000)($v1)
/* 2138 80019938 1000BF8F */  lw         $ra, 0x10($sp)
/* 213C 8001993C 00000000 */  nop
/* 2140 80019940 0800E003 */  jr         $ra
/* 2144 80019944 1800BD27 */   addiu     $sp, $sp, 0x18
