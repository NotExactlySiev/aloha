.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002609C
/* E89C 8002609C 0480023C */  lui        $v0, %hi(D_80046EE4)
/* E8A0 800260A0 E46E428C */  lw         $v0, %lo(D_80046EE4)($v0)
/* E8A4 800260A4 00000000 */  nop
/* E8A8 800260A8 08004010 */  beqz       $v0, .L800260CC
/* E8AC 800260AC 00000000 */   nop
/* E8B0 800260B0 0200A010 */  beqz       $a1, .L800260BC
/* E8B4 800260B4 00E1033C */   lui       $v1, (0xE1000800 >> 16)
/* E8B8 800260B8 00086334 */  ori        $v1, $v1, (0xE1000800 & 0xFFFF)
.L800260BC:
/* E8BC 800260BC 09008010 */  beqz       $a0, .L800260E4
/* E8C0 800260C0 FF27C230 */   andi      $v0, $a2, 0x27FF
/* E8C4 800260C4 39980008 */  j          .L800260E4
/* E8C8 800260C8 00104234 */   ori       $v0, $v0, 0x1000
.L800260CC:
/* E8CC 800260CC 0200A010 */  beqz       $a1, .L800260D8
/* E8D0 800260D0 00E1033C */   lui       $v1, (0xE1000200 >> 16)
/* E8D4 800260D4 00026334 */  ori        $v1, $v1, (0xE1000200 & 0xFFFF)
.L800260D8:
/* E8D8 800260D8 02008010 */  beqz       $a0, .L800260E4
/* E8DC 800260DC FF01C230 */   andi      $v0, $a2, 0x1FF
/* E8E0 800260E0 00044234 */  ori        $v0, $v0, 0x400
.L800260E4:
/* E8E4 800260E4 0800E003 */  jr         $ra
/* E8E8 800260E8 25106200 */   or        $v0, $v1, $v0
