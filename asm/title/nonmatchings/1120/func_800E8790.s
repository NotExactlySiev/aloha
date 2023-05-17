.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E8790
/* 8F90 800E8790 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 8F94 800E8794 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 8F98 800E8798 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8F9C 800E879C 1000BFAF */  sw         $ra, 0x10($sp)
/* 8FA0 800E87A0 1400428C */  lw         $v0, 0x14($v0)
/* 8FA4 800E87A4 00000000 */  nop
/* 8FA8 800E87A8 09F84000 */  jalr       $v0
/* 8FAC 800E87AC 00000000 */   nop
/* 8FB0 800E87B0 000540AC */  sw         $zero, 0x500($v0)
/* 8FB4 800E87B4 01000334 */  ori        $v1, $zero, 0x1
/* 8FB8 800E87B8 080543A0 */  sb         $v1, 0x508($v0)
/* 8FBC 800E87BC 090540A0 */  sb         $zero, 0x509($v0)
/* 8FC0 800E87C0 0A0540A0 */  sb         $zero, 0x50A($v0)
/* 8FC4 800E87C4 0B0540A0 */  sb         $zero, 0x50B($v0)
/* 8FC8 800E87C8 03000334 */  ori        $v1, $zero, 0x3
/* 8FCC 800E87CC 1000BF8F */  lw         $ra, 0x10($sp)
/* 8FD0 800E87D0 040543AC */  sw         $v1, 0x504($v0)
/* 8FD4 800E87D4 0800E003 */  jr         $ra
/* 8FD8 800E87D8 1800BD27 */   addiu     $sp, $sp, 0x18
