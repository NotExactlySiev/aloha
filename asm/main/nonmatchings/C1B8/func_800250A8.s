.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800250A8
/* D8A8 800250A8 0480023C */  lui        $v0, %hi(D_80046EE0)
/* D8AC 800250AC E06E428C */  lw         $v0, %lo(D_80046EE0)($v0)
/* D8B0 800250B0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* D8B4 800250B4 1000B0AF */  sw         $s0, 0x10($sp)
/* D8B8 800250B8 21808000 */  addu       $s0, $a0, $zero
/* D8BC 800250BC 02004228 */  slti       $v0, $v0, 0x2
/* D8C0 800250C0 08004014 */  bnez       $v0, .L800250E4
/* D8C4 800250C4 1400BFAF */   sw        $ra, 0x14($sp)
/* D8C8 800250C8 0280043C */  lui        $a0, %hi(D_800182E0)
/* D8CC 800250CC E0828424 */  addiu      $a0, $a0, %lo(D_800182E0)
/* D8D0 800250D0 0480023C */  lui        $v0, %hi(D_80046EDC)
/* D8D4 800250D4 DC6E428C */  lw         $v0, %lo(D_80046EDC)($v0)
/* D8D8 800250D8 00000000 */  nop
/* D8DC 800250DC 09F84000 */  jalr       $v0
/* D8E0 800250E0 21280002 */   addu      $a1, $s0, $zero
.L800250E4:
/* D8E4 800250E4 0480023C */  lui        $v0, %hi(D_80046ED8)
/* D8E8 800250E8 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* D8EC 800250EC 00000000 */  nop
/* D8F0 800250F0 3C00428C */  lw         $v0, 0x3C($v0)
/* D8F4 800250F4 00000000 */  nop
/* D8F8 800250F8 09F84000 */  jalr       $v0
/* D8FC 800250FC 21200002 */   addu      $a0, $s0, $zero
/* D900 80025100 1400BF8F */  lw         $ra, 0x14($sp)
/* D904 80025104 1000B08F */  lw         $s0, 0x10($sp)
/* D908 80025108 1800BD27 */  addiu      $sp, $sp, 0x18
/* D90C 8002510C 0800E003 */  jr         $ra
/* D910 80025110 00000000 */   nop
