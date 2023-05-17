.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025D64
/* E564 80025D64 02000234 */  ori        $v0, $zero, 0x2
/* E568 80025D68 030082A0 */  sb         $v0, 0x3($a0)
/* E56C 80025D6C 0200A010 */  beqz       $a1, .L80025D78
/* E570 80025D70 00E6033C */   lui       $v1, (0xE6000002 >> 16)
/* E574 80025D74 02006334 */  ori        $v1, $v1, (0xE6000002 & 0xFFFF)
.L80025D78:
/* E578 80025D78 2B100600 */  sltu       $v0, $zero, $a2
/* E57C 80025D7C 25106200 */  or         $v0, $v1, $v0
/* E580 80025D80 040082AC */  sw         $v0, 0x4($a0)
/* E584 80025D84 0800E003 */  jr         $ra
/* E588 80025D88 080080AC */   sw        $zero, 0x8($a0)
