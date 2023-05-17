.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0C74
/* 1474 800E0C74 0F80033C */  lui        $v1, %hi(D_800F4D00)
/* 1478 800E0C78 004D638C */  lw         $v1, %lo(D_800F4D00)($v1)
/* 147C 800E0C7C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1480 800E0C80 11006004 */  bltz       $v1, .L800E0CC8
/* 1484 800E0C84 1000BFAF */   sw        $ra, 0x10($sp)
/* 1488 800E0C88 1F006228 */  slti       $v0, $v1, 0x1F
/* 148C 800E0C8C 0B004014 */  bnez       $v0, .L800E0CBC
/* 1490 800E0C90 00000000 */   nop
/* 1494 800E0C94 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 1498 800E0C98 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 149C 800E0C9C 0F80043C */  lui        $a0, %hi(D_800F4CFC)
/* 14A0 800E0CA0 FC4C8494 */  lhu        $a0, %lo(D_800F4CFC)($a0)
/* 14A4 800E0CA4 680C428C */  lw         $v0, 0xC68($v0)
/* 14A8 800E0CA8 00000000 */  nop
/* 14AC 800E0CAC 09F84000 */  jalr       $v0
/* 14B0 800E0CB0 00000000 */   nop
/* 14B4 800E0CB4 30830308 */  j          .L800E0CC0
/* 14B8 800E0CB8 FFFF0224 */   addiu     $v0, $zero, -0x1
.L800E0CBC:
/* 14BC 800E0CBC 01006224 */  addiu      $v0, $v1, 0x1
.L800E0CC0:
/* 14C0 800E0CC0 0F80013C */  lui        $at, %hi(D_800F4D00)
/* 14C4 800E0CC4 004D22AC */  sw         $v0, %lo(D_800F4D00)($at)
.L800E0CC8:
/* 14C8 800E0CC8 1000BF8F */  lw         $ra, 0x10($sp)
/* 14CC 800E0CCC 00000000 */  nop
/* 14D0 800E0CD0 0800E003 */  jr         $ra
/* 14D4 800E0CD4 1800BD27 */   addiu     $sp, $sp, 0x18
