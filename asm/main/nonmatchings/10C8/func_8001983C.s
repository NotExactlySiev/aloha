.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001983C
/* 203C 8001983C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 2040 80019840 1400BFAF */  sw         $ra, 0x14($sp)
/* 2044 80019844 1000B0AF */  sw         $s0, 0x10($sp)
/* 2048 80019848 728E000C */  jal        func_800239C8
/* 204C 8001984C 21808000 */   addu      $s0, $a0, $zero
/* 2050 80019850 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 2054 80019854 D08E000C */  jal        func_80023B40
/* 2058 80019858 03008434 */   ori       $a0, $a0, (0xF2000003 & 0xFFFF)
/* 205C 8001985C 6A8E000C */  jal        k_CloseEvent
/* 2060 80019860 21200002 */   addu      $a0, $s0, $zero
/* 2064 80019864 068F000C */  jal        func_80023C18
/* 2068 80019868 00000000 */   nop
/* 206C 8001986C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2070 80019870 1000B08F */  lw         $s0, 0x10($sp)
/* 2074 80019874 0800E003 */  jr         $ra
/* 2078 80019878 1800BD27 */   addiu     $sp, $sp, 0x18
