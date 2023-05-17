.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E0C24
/* 1424 800E0C24 0F80023C */  lui        $v0, %hi(D_800F4D00)
/* 1428 800E0C28 004D428C */  lw         $v0, %lo(D_800F4D00)($v0)
/* 142C 800E0C2C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1430 800E0C30 0C004004 */  bltz       $v0, .L800E0C64
/* 1434 800E0C34 1000BFAF */   sw        $ra, 0x10($sp)
/* 1438 800E0C38 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 143C 800E0C3C A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 1440 800E0C40 0F80043C */  lui        $a0, %hi(D_800F4CFC)
/* 1444 800E0C44 FC4C8494 */  lhu        $a0, %lo(D_800F4CFC)($a0)
/* 1448 800E0C48 680C428C */  lw         $v0, 0xC68($v0)
/* 144C 800E0C4C 00000000 */  nop
/* 1450 800E0C50 09F84000 */  jalr       $v0
/* 1454 800E0C54 00000000 */   nop
/* 1458 800E0C58 FFFF0224 */  addiu      $v0, $zero, -0x1
/* 145C 800E0C5C 0F80013C */  lui        $at, %hi(D_800F4D00)
/* 1460 800E0C60 004D22AC */  sw         $v0, %lo(D_800F4D00)($at)
.L800E0C64:
/* 1464 800E0C64 1000BF8F */  lw         $ra, 0x10($sp)
/* 1468 800E0C68 00000000 */  nop
/* 146C 800E0C6C 0800E003 */  jr         $ra
/* 1470 800E0C70 1800BD27 */   addiu     $sp, $sp, 0x18
