.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024FD4
/* D7D4 80024FD4 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D7D8 80024FD8 E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D7DC 80024FDC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* D7E0 80024FE0 1000B0AF */  sw         $s0, 0x10($sp)
/* D7E4 80024FE4 21808000 */  addu       $s0, $a0, $zero
/* D7E8 80024FE8 02004228 */  slti       $v0, $v0, 0x2
/* D7EC 80024FEC 07004014 */  bnez       $v0, .L8002500C
/* D7F0 80024FF0 1400BFAF */   sw        $ra, 0x14($sp)
/* D7F4 80024FF4 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D7F8 80024FF8 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D7FC 80024FFC 0280043C */  lui        $a0, %hi(D_800182B0)
/* D800 80025000 B0828424 */  addiu      $a0, $a0, %lo(D_800182B0)
/* D804 80025004 09F84000 */  jalr       $v0
/* D808 80025008 21280002 */   addu      $a1, $s0, $zero
.L8002500C:
/* D80C 8002500C 0480023C */  lui        $v0, %hi(D_80046EF0)
/* D810 80025010 F06E428C */  lw         $v0, %lo(D_80046EF0)($v0)
/* D814 80025014 0480013C */  lui        $at, %hi(D_80046EF0)
/* D818 80025018 F06E30AC */  sw         $s0, %lo(D_80046EF0)($at)
/* D81C 8002501C 1400BF8F */  lw         $ra, 0x14($sp)
/* D820 80025020 1000B08F */  lw         $s0, 0x10($sp)
/* D824 80025024 1800BD27 */  addiu      $sp, $sp, 0x18
/* D828 80025028 0800E003 */  jr         $ra
/* D82C 8002502C 00000000 */   nop
