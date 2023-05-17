.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80030A98
/* 19298 80030A98 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 1929C 80030A9C 1800BFAF */  sw         $ra, 0x18($sp)
/* 192A0 80030AA0 08008010 */  beqz       $a0, .L80030AC4
/* 192A4 80030AA4 2400A5AF */   sw        $a1, 0x24($sp)
/* 192A8 80030AA8 01000234 */  ori        $v0, $zero, 0x1
/* 192AC 80030AAC 0B008214 */  bne        $a0, $v0, .L80030ADC
/* 192B0 80030AB0 53000534 */   ori       $a1, $zero, 0x53
/* 192B4 80030AB4 0480043C */  lui        $a0, %hi(D_800478DC)
/* 192B8 80030AB8 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 192BC 80030ABC B4C20008 */  j          .L80030AD0
/* 192C0 80030AC0 52000534 */   ori       $a1, $zero, 0x52
.L80030AC4:
/* 192C4 80030AC4 0480043C */  lui        $a0, %hi(D_800478DC)
/* 192C8 80030AC8 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 192CC 80030ACC 54000534 */  ori        $a1, $zero, 0x54
.L80030AD0:
/* 192D0 80030AD0 10BD000C */  jal        func_8002F440
/* 192D4 80030AD4 2400A627 */   addiu     $a2, $sp, 0x24
/* 192D8 80030AD8 53000534 */  ori        $a1, $zero, 0x53
.L80030ADC:
/* 192DC 80030ADC 0480043C */  lui        $a0, %hi(D_800478DC)
/* 192E0 80030AE0 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 192E4 80030AE4 10BD000C */  jal        func_8002F440
/* 192E8 80030AE8 1000A627 */   addiu     $a2, $sp, 0x10
/* 192EC 80030AEC 1000A28F */  lw         $v0, 0x10($sp)
/* 192F0 80030AF0 1800BF8F */  lw         $ra, 0x18($sp)
/* 192F4 80030AF4 2000BD27 */  addiu      $sp, $sp, 0x20
/* 192F8 80030AF8 0800E003 */  jr         $ra
/* 192FC 80030AFC 00000000 */   nop
