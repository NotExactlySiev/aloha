.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A5D4
/* 12DD4 8002A5D4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12DD8 8002A5D8 1000BFAF */  sw         $ra, 0x10($sp)
/* 12DDC 8002A5DC 00F0043C */  lui        $a0, (0xF0000003 >> 16)
/* 12DE0 8002A5E0 03008434 */  ori        $a0, $a0, (0xF0000003 & 0xFFFF)
/* 12DE4 8002A5E4 89A9000C */  jal        func_8002A624
/* 12DE8 8002A5E8 40000534 */   ori       $a1, $zero, 0x40
/* 12DEC 8002A5EC 1000BF8F */  lw         $ra, 0x10($sp)
/* 12DF0 8002A5F0 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12DF4 8002A5F4 0800E003 */  jr         $ra
/* 12DF8 8002A5F8 00000000 */   nop
