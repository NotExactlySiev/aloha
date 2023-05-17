.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020C8C
/* 948C 80020C8C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9490 80020C90 1000BFAF */  sw         $ra, 0x10($sp)
/* 9494 80020C94 728E000C */  jal        func_800239C8
/* 9498 80020C98 00000000 */   nop
/* 949C 80020C9C 0480043C */  lui        $a0, %hi(D_80047FB4)
/* 94A0 80020CA0 B47F848C */  lw         $a0, %lo(D_80047FB4)($a0)
/* 94A4 80020CA4 6A8E000C */  jal        k_CloseEvent
/* 94A8 80020CA8 00000000 */   nop
/* 94AC 80020CAC 0480043C */  lui        $a0, %hi(D_80047FBC)
/* 94B0 80020CB0 BC7F848C */  lw         $a0, %lo(D_80047FBC)($a0)
/* 94B4 80020CB4 6A8E000C */  jal        k_CloseEvent
/* 94B8 80020CB8 00000000 */   nop
/* 94BC 80020CBC 0480043C */  lui        $a0, %hi(D_80047FC4)
/* 94C0 80020CC0 C47F848C */  lw         $a0, %lo(D_80047FC4)($a0)
/* 94C4 80020CC4 6A8E000C */  jal        k_CloseEvent
/* 94C8 80020CC8 00000000 */   nop
/* 94CC 80020CCC 0480043C */  lui        $a0, %hi(D_80047FCC)
/* 94D0 80020CD0 CC7F848C */  lw         $a0, %lo(D_80047FCC)($a0)
/* 94D4 80020CD4 6A8E000C */  jal        k_CloseEvent
/* 94D8 80020CD8 00000000 */   nop
/* 94DC 80020CDC 0480043C */  lui        $a0, %hi(D_80047FD4)
/* 94E0 80020CE0 D47F848C */  lw         $a0, %lo(D_80047FD4)($a0)
/* 94E4 80020CE4 6A8E000C */  jal        k_CloseEvent
/* 94E8 80020CE8 00000000 */   nop
/* 94EC 80020CEC 0480043C */  lui        $a0, %hi(D_80047FDC)
/* 94F0 80020CF0 DC7F848C */  lw         $a0, %lo(D_80047FDC)($a0)
/* 94F4 80020CF4 6A8E000C */  jal        k_CloseEvent
/* 94F8 80020CF8 00000000 */   nop
/* 94FC 80020CFC 0480043C */  lui        $a0, %hi(D_80047FE4)
/* 9500 80020D00 E47F848C */  lw         $a0, %lo(D_80047FE4)($a0)
/* 9504 80020D04 6A8E000C */  jal        k_CloseEvent
/* 9508 80020D08 00000000 */   nop
/* 950C 80020D0C 0480043C */  lui        $a0, %hi(D_80047FEC)
/* 9510 80020D10 EC7F848C */  lw         $a0, %lo(D_80047FEC)($a0)
/* 9514 80020D14 6A8E000C */  jal        k_CloseEvent
/* 9518 80020D18 00000000 */   nop
/* 951C 80020D1C 0480043C */  lui        $a0, %hi(D_80047FF4)
/* 9520 80020D20 F47F848C */  lw         $a0, %lo(D_80047FF4)($a0)
/* 9524 80020D24 6A8E000C */  jal        k_CloseEvent
/* 9528 80020D28 00000000 */   nop
/* 952C 80020D2C 0480043C */  lui        $a0, %hi(D_80047FFC)
/* 9530 80020D30 FC7F848C */  lw         $a0, %lo(D_80047FFC)($a0)
/* 9534 80020D34 6A8E000C */  jal        k_CloseEvent
/* 9538 80020D38 00000000 */   nop
/* 953C 80020D3C 068F000C */  jal        func_80023C18
/* 9540 80020D40 00000000 */   nop
/* 9544 80020D44 3A8F000C */  jal        func_80023CE8
/* 9548 80020D48 00000000 */   nop
/* 954C 80020D4C 1000BF8F */  lw         $ra, 0x10($sp)
/* 9550 80020D50 00000000 */  nop
/* 9554 80020D54 0800E003 */  jr         $ra
/* 9558 80020D58 1800BD27 */   addiu     $sp, $sp, 0x18
