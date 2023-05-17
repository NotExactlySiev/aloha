.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A5AC
/* 12DAC 8002A5AC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12DB0 8002A5B0 1000BFAF */  sw         $ra, 0x10($sp)
/* 12DB4 8002A5B4 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* 12DB8 8002A5B8 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* 12DBC 8002A5BC 89A9000C */  jal        func_8002A624
/* 12DC0 8002A5C0 20000534 */   ori       $a1, $zero, 0x20
/* 12DC4 8002A5C4 1000BF8F */  lw         $ra, 0x10($sp)
/* 12DC8 8002A5C8 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12DCC 8002A5CC 0800E003 */  jr         $ra
/* 12DD0 8002A5D0 00000000 */   nop
