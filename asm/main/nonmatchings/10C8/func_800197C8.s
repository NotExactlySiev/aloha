.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800197C8
/* 1FC8 800197C8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 1FCC 800197CC 1400BFAF */  sw         $ra, 0x14($sp)
/* 1FD0 800197D0 1000B0AF */  sw         $s0, 0x10($sp)
/* 1FD4 800197D4 728E000C */  jal        func_800239C8
/* 1FD8 800197D8 21808000 */   addu      $s0, $a0, $zero
/* 1FDC 800197DC 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 1FE0 800197E0 03008434 */  ori        $a0, $a0, (0xF2000003 & 0xFFFF)
/* 1FE4 800197E4 02000534 */  ori        $a1, $zero, 0x2
/* 1FE8 800197E8 00100634 */  ori        $a2, $zero, 0x1000
/* 1FEC 800197EC FA8E000C */  jal        func_80023BE8
/* 1FF0 800197F0 21380002 */   addu      $a3, $s0, $zero
/* 1FF4 800197F4 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 1FF8 800197F8 03008434 */  ori        $a0, $a0, (0xF2000003 & 0xFFFF)
/* 1FFC 800197FC 01000534 */  ori        $a1, $zero, 0x1
/* 2000 80019800 00100634 */  ori        $a2, $zero, 0x1000
/* 2004 80019804 8E8E000C */  jal        func_80023A38
/* 2008 80019808 21804000 */   addu      $s0, $v0, $zero
/* 200C 8001980C 00F2043C */  lui        $a0, (0xF2000003 >> 16)
/* 2010 80019810 C38E000C */  jal        func_80023B0C
/* 2014 80019814 03008434 */   ori       $a0, $a0, (0xF2000003 & 0xFFFF)
/* 2018 80019818 828E000C */  jal        func_80023A08
/* 201C 8001981C 21200002 */   addu      $a0, $s0, $zero
/* 2020 80019820 068F000C */  jal        func_80023C18
/* 2024 80019824 00000000 */   nop
/* 2028 80019828 21100002 */  addu       $v0, $s0, $zero
/* 202C 8001982C 1400BF8F */  lw         $ra, 0x14($sp)
/* 2030 80019830 1000B08F */  lw         $s0, 0x10($sp)
/* 2034 80019834 0800E003 */  jr         $ra
/* 2038 80019838 1800BD27 */   addiu     $sp, $sp, 0x18
