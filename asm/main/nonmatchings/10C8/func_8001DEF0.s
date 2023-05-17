.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DEF0
/* 66F0 8001DEF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 66F4 8001DEF4 1000BFAF */  sw         $ra, 0x10($sp)
/* 66F8 8001DEF8 FF00053C */  lui        $a1, (0xFFFFFF >> 16)
/* 66FC 8001DEFC 47C4000C */  jal        func_8003111C
/* 6700 8001DF00 FFFFA534 */   ori       $a1, $a1, (0xFFFFFF & 0xFFFF)
/* 6704 8001DF04 1000BF8F */  lw         $ra, 0x10($sp)
/* 6708 8001DF08 00000000 */  nop
/* 670C 8001DF0C 0800E003 */  jr         $ra
/* 6710 8001DF10 1800BD27 */   addiu     $sp, $sp, 0x18
