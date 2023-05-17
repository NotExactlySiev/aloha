.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001972C
/* 1F2C 8001972C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1F30 80019730 1000BFAF */  sw         $ra, 0x10($sp)
/* 1F34 80019734 5A73000C */  jal        func_8001CD68
/* 1F38 80019738 00000000 */   nop
/* 1F3C 8001973C 376E000C */  jal        func_8001B8DC
/* 1F40 80019740 00000000 */   nop
/* 1F44 80019744 D369000C */  jal        func_8001A74C
/* 1F48 80019748 00000000 */   nop
/* 1F4C 8001974C 2383000C */  jal        func_80020C8C
/* 1F50 80019750 00000000 */   nop
/* 1F54 80019754 A677000C */  jal        func_8001DE98
/* 1F58 80019758 00000000 */   nop
/* 1F5C 8001975C F8AD000C */  jal        func_8002B7E0
/* 1F60 80019760 00000000 */   nop
/* 1F64 80019764 3BB0000C */  jal        func_8002C0EC
/* 1F68 80019768 00000000 */   nop
/* 1F6C 8001976C 0480043C */  lui        $a0, %hi(D_80047E74)
/* 1F70 80019770 747E848C */  lw         $a0, %lo(D_80047E74)($a0)
/* 1F74 80019774 0F66000C */  jal        func_8001983C
/* 1F78 80019778 00000000 */   nop
/* 1F7C 8001977C 0480043C */  lui        $a0, %hi(D_80047E7C)
/* 1F80 80019780 7C7E848C */  lw         $a0, %lo(D_80047E7C)($a0)
/* 1F84 80019784 6A8E000C */  jal        k_CloseEvent
/* 1F88 80019788 00000000 */   nop
/* 1F8C 8001978C D08E000C */  jal        func_80023B40
/* 1F90 80019790 00F2043C */   lui       $a0, (0xF2000000 >> 16)
/* 1F94 80019794 00F2043C */  lui        $a0, (0xF2000001 >> 16)
/* 1F98 80019798 D08E000C */  jal        func_80023B40
/* 1F9C 8001979C 01008434 */   ori       $a0, $a0, (0xF2000001 & 0xFFFF)
/* 1FA0 800197A0 00F2043C */  lui        $a0, (0xF2000002 >> 16)
/* 1FA4 800197A4 D08E000C */  jal        func_80023B40
/* 1FA8 800197A8 02008434 */   ori       $a0, $a0, (0xF2000002 & 0xFFFF)
/* 1FAC 800197AC 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 1FB0 800197B0 D08E000C */  jal        func_80023B40
/* 1FB4 800197B4 03008434 */   ori       $a0, $a0, (0xF2000003 & 0xFFFF)
/* 1FB8 800197B8 1000BF8F */  lw         $ra, 0x10($sp)
/* 1FBC 800197BC 00000000 */  nop
/* 1FC0 800197C0 0800E003 */  jr         $ra
/* 1FC4 800197C4 1800BD27 */   addiu     $sp, $sp, 0x18
