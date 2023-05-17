.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002E3AC
/* 16BAC 8002E3AC 0480023C */  lui        $v0, %hi(D_80047D04)
/* 16BB0 8002E3B0 047D428C */  lw         $v0, %lo(D_80047D04)($v0)
/* 16BB4 8002E3B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 16BB8 8002E3B8 18004014 */  bnez       $v0, .L8002E41C
/* 16BBC 8002E3BC 1000BFAF */   sw        $ra, 0x10($sp)
/* 16BC0 8002E3C0 01000234 */  ori        $v0, $zero, 0x1
/* 16BC4 8002E3C4 0480013C */  lui        $at, %hi(D_80047D04)
/* 16BC8 8002E3C8 047D22AC */  sw         $v0, %lo(D_80047D04)($at)
/* 16BCC 8002E3CC 728E000C */  jal        func_800239C8
/* 16BD0 8002E3D0 00000000 */   nop
/* 16BD4 8002E3D4 21200000 */  addu       $a0, $zero, $zero
/* 16BD8 8002E3D8 BFBA000C */  jal        func_8002EAFC
/* 16BDC 8002E3DC 03000534 */   ori       $a1, $zero, 0x3
/* 16BE0 8002E3E0 00F0043C */  lui        $a0, (0xF0000009 >> 16)
/* 16BE4 8002E3E4 09008434 */  ori        $a0, $a0, (0xF0000009 & 0xFFFF)
/* 16BE8 8002E3E8 20000534 */  ori        $a1, $zero, 0x20
/* 16BEC 8002E3EC 00200634 */  ori        $a2, $zero, 0x2000
/* 16BF0 8002E3F0 0480013C */  lui        $at, %hi(D_800478DC)
/* 16BF4 8002E3F4 DC7822AC */  sw         $v0, %lo(D_800478DC)($at)
/* 16BF8 8002E3F8 FA8E000C */  jal        func_80023BE8
/* 16BFC 8002E3FC 21380000 */   addu      $a3, $zero, $zero
/* 16C00 8002E400 21204000 */  addu       $a0, $v0, $zero
/* 16C04 8002E404 0480013C */  lui        $at, %hi(D_800478F4)
/* 16C08 8002E408 F47824AC */  sw         $a0, %lo(D_800478F4)($at)
/* 16C0C 8002E40C 828E000C */  jal        func_80023A08
/* 16C10 8002E410 00000000 */   nop
/* 16C14 8002E414 068F000C */  jal        func_80023C18
/* 16C18 8002E418 00000000 */   nop
.L8002E41C:
/* 16C1C 8002E41C 1000BF8F */  lw         $ra, 0x10($sp)
/* 16C20 8002E420 1800BD27 */  addiu      $sp, $sp, 0x18
/* 16C24 8002E424 0800E003 */  jr         $ra
/* 16C28 8002E428 00000000 */   nop
