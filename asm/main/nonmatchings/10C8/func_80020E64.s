.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80020E64
/* 9664 80020E64 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9668 80020E68 1000BFAF */  sw         $ra, 0x10($sp)
/* 966C 80020E6C FF00043C */  lui        $a0, (0xFFFFFF >> 16)
/* 9670 80020E70 5E7D000C */  jal        func_8001F578
/* 9674 80020E74 FFFF8434 */   ori       $a0, $a0, (0xFFFFFF & 0xFFFF)
/* 9678 80020E78 1000BF8F */  lw         $ra, 0x10($sp)
/* 967C 80020E7C 00000000 */  nop
/* 9680 80020E80 0800E003 */  jr         $ra
/* 9684 80020E84 1800BD27 */   addiu     $sp, $sp, 0x18
