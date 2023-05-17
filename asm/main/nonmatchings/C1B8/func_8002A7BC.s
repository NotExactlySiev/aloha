.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A7BC
/* 12FBC 8002A7BC E0FFBD27 */  addiu      $sp, $sp, -0x20
/* 12FC0 8002A7C0 1000B0AF */  sw         $s0, 0x10($sp)
/* 12FC4 8002A7C4 21808000 */  addu       $s0, $a0, $zero
/* 12FC8 8002A7C8 1800B2AF */  sw         $s2, 0x18($sp)
/* 12FCC 8002A7CC 2190E000 */  addu       $s2, $a3, $zero
/* 12FD0 8002A7D0 1400B1AF */  sw         $s1, 0x14($sp)
/* 12FD4 8002A7D4 3000B18F */  lw         $s1, 0x30($sp)
/* 12FD8 8002A7D8 1C00BFAF */  sw         $ra, 0x1C($sp)
/* 12FDC 8002A7DC 92AA000C */  jal        func_8002AA48
/* 12FE0 8002A7E0 01000434 */   ori       $a0, $zero, 0x1
/* 12FE4 8002A7E4 01001032 */  andi       $s0, $s0, 0x1
/* 12FE8 8002A7E8 0580013C */  lui        $at, %hi(D_800536A4)
/* 12FEC 8002A7EC A43620AC */  sw         $zero, %lo(D_800536A4)($at)
/* 12FF0 8002A7F0 0580013C */  lui        $at, %hi(D_800536C8)
/* 12FF4 8002A7F4 C83632AC */  sw         $s2, %lo(D_800536C8)($at)
/* 12FF8 8002A7F8 0580013C */  lui        $at, %hi(D_800536A0)
/* 12FFC 8002A7FC A03630AC */  sw         $s0, %lo(D_800536A0)($at)
/* 13000 8002A800 0580013C */  lui        $at, %hi(D_800536CC)
/* 13004 8002A804 CC3631AC */  sw         $s1, %lo(D_800536CC)($at)
/* 13008 8002A808 1C00BF8F */  lw         $ra, 0x1C($sp)
/* 1300C 8002A80C 1800B28F */  lw         $s2, 0x18($sp)
/* 13010 8002A810 1400B18F */  lw         $s1, 0x14($sp)
/* 13014 8002A814 1000B08F */  lw         $s0, 0x10($sp)
/* 13018 8002A818 2000BD27 */  addiu      $sp, $sp, 0x20
/* 1301C 8002A81C 0800E003 */  jr         $ra
/* 13020 8002A820 00000000 */   nop
