.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80024F18
/* D718 80024F18 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D71C 80024F1C E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D720 80024F20 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* D724 80024F24 1400B1AF */  sw         $s1, 0x14($sp)
/* D728 80024F28 0480113C */  lui        $s1, %hi(D_80046EEC)
/* D72C 80024F2C EC6E318E */  lw         $s1, %lo(D_80046EEC)($s1)
/* D730 80024F30 1000B0AF */  sw         $s0, 0x10($sp)
/* D734 80024F34 21808000 */  addu       $s0, $a0, $zero
/* D738 80024F38 02004228 */  slti       $v0, $v0, 0x2
/* D73C 80024F3C 08004014 */  bnez       $v0, .L80024F60
/* D740 80024F40 1800BFAF */   sw        $ra, 0x18($sp)
/* D744 80024F44 0280043C */  lui        $a0, %hi(D_80018298)
/* D748 80024F48 98828424 */  addiu      $a0, $a0, %lo(D_80018298)
/* D74C 80024F4C 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D750 80024F50 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D754 80024F54 00000000 */  nop
/* D758 80024F58 09F84000 */  jalr       $v0
/* D75C 80024F5C 21280002 */   addu      $a1, $s0, $zero
.L80024F60:
/* D760 80024F60 0480023C */  lui        $v0, %hi(D_80046EEC)
/* D764 80024F64 EC6E428C */  lw         $v0, %lo(D_80046EEC)($v0)
/* D768 80024F68 00000000 */  nop
/* D76C 80024F6C 0B000212 */  beq        $s0, $v0, .L80024F9C
/* D770 80024F70 21102002 */   addu      $v0, $s1, $zero
/* D774 80024F74 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D778 80024F78 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D77C 80024F7C 00000000 */  nop
/* D780 80024F80 3400428C */  lw         $v0, 0x34($v0)
/* D784 80024F84 00000000 */  nop
/* D788 80024F88 09F84000 */  jalr       $v0
/* D78C 80024F8C 01000434 */   ori       $a0, $zero, 0x1
/* D790 80024F90 0480013C */  lui        $at, %hi(D_80046EEC)
/* D794 80024F94 EC6E30AC */  sw         $s0, %lo(D_80046EEC)($at)
/* D798 80024F98 21102002 */  addu       $v0, $s1, $zero
.L80024F9C:
/* D79C 80024F9C 1800BF8F */  lw         $ra, 0x18($sp)
/* D7A0 80024FA0 1400B18F */  lw         $s1, 0x14($sp)
/* D7A4 80024FA4 1000B08F */  lw         $s0, 0x10($sp)
/* D7A8 80024FA8 2000BD27 */  addiu      $sp, $sp, 0x20
/* D7AC 80024FAC 0800E003 */  jr         $ra
/* D7B0 80024FB0 00000000 */   nop
