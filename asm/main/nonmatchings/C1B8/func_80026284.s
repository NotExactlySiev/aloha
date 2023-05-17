.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026284
/* EA84 80026284 0480023C */  lui        $v0, %hi(D_80046EE4)
/* EA88 80026288 E46E428C */  lw         $v0, %lo(D_80046EE4)($v0)
/* EA8C 8002628C 00000000 */  nop
/* EA90 80026290 05004014 */  bnez       $v0, .L800262A8
/* EA94 80026294 FF0FA330 */   andi      $v1, $a1, 0xFFF
/* EA98 80026298 FF07A330 */  andi       $v1, $a1, 0x7FF
/* EA9C 8002629C C01A0300 */  sll        $v1, $v1, 11
/* EAA0 800262A0 AC980008 */  j          .L800262B0
/* EAA4 800262A4 FF078230 */   andi      $v0, $a0, 0x7FF
.L800262A8:
/* EAA8 800262A8 001B0300 */  sll        $v1, $v1, 12
/* EAAC 800262AC FF0F8230 */  andi       $v0, $a0, 0xFFF
.L800262B0:
/* EAB0 800262B0 00E5043C */  lui        $a0, (0xE5000000 >> 16)
/* EAB4 800262B4 25104400 */  or         $v0, $v0, $a0
/* EAB8 800262B8 0800E003 */  jr         $ra
/* EABC 800262BC 25106200 */   or        $v0, $v1, $v0
