.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001FD8C
/* 858C 8001FD8C 0480043C */  lui        $a0, %hi(D_80047FDC)
/* 8590 8001FD90 DC7F848C */  lw         $a0, %lo(D_80047FDC)($a0)
/* 8594 8001FD94 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 8598 8001FD98 1000BFAF */  sw         $ra, 0x10($sp)
/* 859C 8001FD9C 028F000C */  jal        func_80023C08
/* 85A0 8001FDA0 00000000 */   nop
/* 85A4 8001FDA4 0480043C */  lui        $a0, %hi(D_80047FE4)
/* 85A8 8001FDA8 E47F848C */  lw         $a0, %lo(D_80047FE4)($a0)
/* 85AC 8001FDAC 028F000C */  jal        func_80023C08
/* 85B0 8001FDB0 00000000 */   nop
/* 85B4 8001FDB4 0480043C */  lui        $a0, %hi(D_80047FEC)
/* 85B8 8001FDB8 EC7F848C */  lw         $a0, %lo(D_80047FEC)($a0)
/* 85BC 8001FDBC 028F000C */  jal        func_80023C08
/* 85C0 8001FDC0 00000000 */   nop
/* 85C4 8001FDC4 0480043C */  lui        $a0, %hi(D_80047FF4)
/* 85C8 8001FDC8 F47F848C */  lw         $a0, %lo(D_80047FF4)($a0)
/* 85CC 8001FDCC 028F000C */  jal        func_80023C08
/* 85D0 8001FDD0 00000000 */   nop
/* 85D4 8001FDD4 0480043C */  lui        $a0, %hi(D_80047FFC)
/* 85D8 8001FDD8 FC7F848C */  lw         $a0, %lo(D_80047FFC)($a0)
/* 85DC 8001FDDC 028F000C */  jal        func_80023C08
/* 85E0 8001FDE0 00000000 */   nop
/* 85E4 8001FDE4 1000BF8F */  lw         $ra, 0x10($sp)
/* 85E8 8001FDE8 00000000 */  nop
/* 85EC 8001FDEC 0800E003 */  jr         $ra
/* 85F0 8001FDF0 1800BD27 */   addiu     $sp, $sp, 0x18
