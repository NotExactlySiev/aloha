.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80027B5C
/* 1035C 80027B5C 0400A010 */  beqz       $a1, .L80027B70
/* 10360 80027B60 00000000 */   nop
/* 10364 80027B64 07008290 */  lbu        $v0, 0x7($a0)
/* 10368 80027B68 DF9E0008 */  j          .L80027B7C
/* 1036C 80027B6C 02004234 */   ori       $v0, $v0, 0x2
.L80027B70:
/* 10370 80027B70 07008290 */  lbu        $v0, 0x7($a0)
/* 10374 80027B74 00000000 */  nop
/* 10378 80027B78 FD004230 */  andi       $v0, $v0, 0xFD
.L80027B7C:
/* 1037C 80027B7C 0800E003 */  jr         $ra
/* 10380 80027B80 070082A0 */   sb        $v0, 0x7($a0)
