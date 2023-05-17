.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80031798
/* 19F98 80031798 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 19F9C 8003179C 0B008010 */  beqz       $a0, .L800317CC
/* 19FA0 800317A0 1000BFAF */   sw        $ra, 0x10($sp)
/* 19FA4 800317A4 0480043C */  lui        $a0, %hi(D_800478EC)
/* 19FA8 800317A8 EC78848C */  lw         $a0, %lo(D_800478EC)($a0)
/* 19FAC 800317AC 1EB8000C */  jal        func_8002E078
/* 19FB0 800317B0 00000000 */   nop
/* 19FB4 800317B4 05004014 */  bnez       $v0, .L800317CC
/* 19FB8 800317B8 01000234 */   ori       $v0, $zero, 0x1
/* 19FBC 800317BC 0480013C */  lui        $at, %hi(D_800478E8)
/* 19FC0 800317C0 E87822AC */  sw         $v0, %lo(D_800478E8)($at)
/* 19FC4 800317C4 F6C50008 */  j          .L800317D8
/* 19FC8 800317C8 00000000 */   nop
.L800317CC:
/* 19FCC 800317CC 0480013C */  lui        $at, %hi(D_800478E8)
/* 19FD0 800317D0 E87820AC */  sw         $zero, %lo(D_800478E8)($at)
/* 19FD4 800317D4 21100000 */  addu       $v0, $zero, $zero
.L800317D8:
/* 19FD8 800317D8 1000BF8F */  lw         $ra, 0x10($sp)
/* 19FDC 800317DC 1800BD27 */  addiu      $sp, $sp, 0x18
/* 19FE0 800317E0 0800E003 */  jr         $ra
/* 19FE4 800317E4 00000000 */   nop
