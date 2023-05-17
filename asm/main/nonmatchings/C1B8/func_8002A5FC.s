.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A5FC
/* 12DFC 8002A5FC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12E00 8002A600 1000BFAF */  sw         $ra, 0x10($sp)
/* 12E04 8002A604 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* 12E08 8002A608 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* 12E0C 8002A60C 89A9000C */  jal        func_8002A624
/* 12E10 8002A610 40000534 */   ori       $a1, $zero, 0x40
/* 12E14 8002A614 1000BF8F */  lw         $ra, 0x10($sp)
/* 12E18 8002A618 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12E1C 8002A61C 0800E003 */  jr         $ra
/* 12E20 8002A620 00000000 */   nop
