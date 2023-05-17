.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027B84
/* 10384 80027B84 0400A010 */  beqz       $a1, .L80027B98
/* 10388 80027B88 00000000 */   nop
/* 1038C 80027B8C 07008290 */  lbu        $v0, 0x7($a0)
/* 10390 80027B90 E99E0008 */  j          .L80027BA4
/* 10394 80027B94 01004234 */   ori       $v0, $v0, 0x1
.L80027B98:
/* 10398 80027B98 07008290 */  lbu        $v0, 0x7($a0)
/* 1039C 80027B9C 00000000 */  nop
/* 103A0 80027BA0 FE004230 */  andi       $v0, $v0, 0xFE
.L80027BA4:
/* 103A4 80027BA4 0800E003 */  jr         $ra
/* 103A8 80027BA8 070082A0 */   sb        $v0, 0x7($a0)
