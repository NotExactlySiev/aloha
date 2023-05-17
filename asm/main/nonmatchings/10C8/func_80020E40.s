.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020E40
/* 9640 80020E40 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9644 80020E44 1000BFAF */  sw         $ra, 0x10($sp)
/* 9648 80020E48 FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 964C 80020E4C 3C7D000C */  jal        func_8001F4F0
/* 9650 80020E50 FFFF8434 */   ori       $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 9654 80020E54 1000BF8F */  lw         $ra, 0x10($sp)
/* 9658 80020E58 00000000 */  nop
/* 965C 80020E5C 0800E003 */  jr         $ra
/* 9660 80020E60 1800BD27 */   addiu     $sp, $sp, 0x18
