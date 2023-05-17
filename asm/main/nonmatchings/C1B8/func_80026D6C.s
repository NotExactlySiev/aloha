.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80026D6C
/* F56C 80026D6C 0004033C */  lui        $v1, (0x4000002 >> 16)
/* F570 80026D70 0480023C */  lui        $v0, %hi(D_80046EF8)
/* F574 80026D74 F86E428C */  lw         $v0, %lo(D_80046EF8)($v0)
/* F578 80026D78 02006334 */  ori        $v1, $v1, (0x4000002 & 0xFFFF)
/* F57C 80026D7C 000043AC */  sw         $v1, 0x0($v0)
/* F580 80026D80 0480023C */  lui        $v0, %hi(D_80046EFC)
/* F584 80026D84 FC6E428C */  lw         $v0, %lo(D_80046EFC)($v0)
/* F588 80026D88 00000000 */  nop
/* F58C 80026D8C 000044AC */  sw         $a0, 0x0($v0)
/* F590 80026D90 0480023C */  lui        $v0, %hi(D_80046F00)
/* F594 80026D94 006F428C */  lw         $v0, %lo(D_80046F00)($v0)
/* F598 80026D98 0001033C */  lui        $v1, (0x1000401 >> 16)
/* F59C 80026D9C 000040AC */  sw         $zero, 0x0($v0)
/* F5A0 80026DA0 0480023C */  lui        $v0, %hi(D_80046F04)
/* F5A4 80026DA4 046F428C */  lw         $v0, %lo(D_80046F04)($v0)
/* F5A8 80026DA8 01046334 */  ori        $v1, $v1, (0x1000401 & 0xFFFF)
/* F5AC 80026DAC 000043AC */  sw         $v1, 0x0($v0)
/* F5B0 80026DB0 0800E003 */  jr         $ra
/* F5B4 80026DB4 00000000 */   nop
