.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001DE98
/* 6698 8001DE98 C0FFBD27 */  addiu      $sp, $sp, -0x40
/* 669C 8001DE9C 3800BFAF */  sw         $ra, 0x38($sp)
/* 66A0 8001DEA0 03000234 */  ori        $v0, $zero, 0x3
/* 66A4 8001DEA4 1000A2AF */  sw         $v0, 0x10($sp)
/* 66A8 8001DEA8 1400A0A7 */  sh         $zero, 0x14($sp)
/* 66AC 8001DEAC 1600A0A7 */  sh         $zero, 0x16($sp)
/* 66B0 8001DEB0 B477000C */  jal        func_8001DED0
/* 66B4 8001DEB4 1000A427 */   addiu     $a0, $sp, 0x10
/* 66B8 8001DEB8 0BB9000C */  jal        func_8002E42C
/* 66BC 8001DEBC 00000000 */   nop
/* 66C0 8001DEC0 3800BF8F */  lw         $ra, 0x38($sp)
/* 66C4 8001DEC4 00000000 */  nop
/* 66C8 8001DEC8 0800E003 */  jr         $ra
/* 66CC 8001DECC 4000BD27 */   addiu     $sp, $sp, 0x40
