.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024EB0
/* D6B0 80024EB0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* D6B4 80024EB4 1000B0AF */  sw         $s0, 0x10($sp)
/* D6B8 80024EB8 0480103C */  lui        $s0, %hi(D_80046EE0)
/* D6BC 80024EBC E06E108E */  lw         $s0, %lo(D_80046EE0)($s0)
/* D6C0 80024EC0 21288000 */  addu       $a1, $a0, $zero
/* D6C4 80024EC4 1400BFAF */  sw         $ra, 0x14($sp)
/* D6C8 80024EC8 0480013C */  lui        $at, %hi(D_80046EE0)
/* D6CC 80024ECC E06E25AC */  sw         $a1, %lo(D_80046EE0)($at)
/* D6D0 80024ED0 0C00A010 */  beqz       $a1, .L80024F04
/* D6D4 80024ED4 21100002 */   addu      $v0, $s0, $zero
/* D6D8 80024ED8 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D6DC 80024EDC DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D6E0 80024EE0 0480063C */  lui        $a2, %hi(D_80046EE4)
/* D6E4 80024EE4 E46EC68C */  lw         $a2, %lo(D_80046EE4)($a2)
/* D6E8 80024EE8 0480073C */  lui        $a3, %hi(D_80046EE8)
/* D6EC 80024EEC E86EE78C */  lw         $a3, %lo(D_80046EE8)($a3)
/* D6F0 80024EF0 0280043C */  lui        $a0, %hi(D_8001826C)
/* D6F4 80024EF4 6C828424 */  addiu      $a0, $a0, %lo(D_8001826C)
/* D6F8 80024EF8 09F84000 */  jalr       $v0
/* D6FC 80024EFC 00000000 */   nop
/* D700 80024F00 21100002 */  addu       $v0, $s0, $zero
.L80024F04:
/* D704 80024F04 1400BF8F */  lw         $ra, 0x14($sp)
/* D708 80024F08 1000B08F */  lw         $s0, 0x10($sp)
/* D70C 80024F0C 1800BD27 */  addiu      $sp, $sp, 0x18
/* D710 80024F10 0800E003 */  jr         $ra
/* D714 80024F14 00000000 */   nop
