.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80030A44
/* 19244 80030A44 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 19248 80030A48 03008104 */  bgez       $a0, .L80030A58
/* 1924C 80030A4C 1800BFAF */   sw        $ra, 0x18($sp)
/* 19250 80030A50 9CC20008 */  j          .L80030A70
/* 19254 80030A54 1000A0AF */   sw        $zero, 0x10($sp)
.L80030A58:
/* 19258 80030A58 40008228 */  slti       $v0, $a0, 0x40
/* 1925C 80030A5C 03004014 */  bnez       $v0, .L80030A6C
/* 19260 80030A60 3F000234 */   ori       $v0, $zero, 0x3F
/* 19264 80030A64 9CC20008 */  j          .L80030A70
/* 19268 80030A68 1000A2AF */   sw        $v0, 0x10($sp)
.L80030A6C:
/* 1926C 80030A6C 1000A4AF */  sw         $a0, 0x10($sp)
.L80030A70:
/* 19270 80030A70 50000534 */  ori        $a1, $zero, 0x50
/* 19274 80030A74 0480043C */  lui        $a0, %hi(D_800478DC)
/* 19278 80030A78 DC78848C */  lw         $a0, %lo(D_800478DC)($a0)
/* 1927C 80030A7C 10BD000C */  jal        func_8002F440
/* 19280 80030A80 1000A627 */   addiu     $a2, $sp, 0x10
/* 19284 80030A84 1000A28F */  lw         $v0, 0x10($sp)
/* 19288 80030A88 1800BF8F */  lw         $ra, 0x18($sp)
/* 1928C 80030A8C 2000BD27 */  addiu      $sp, $sp, 0x20
/* 19290 80030A90 0800E003 */  jr         $ra
/* 19294 80030A94 00000000 */   nop
