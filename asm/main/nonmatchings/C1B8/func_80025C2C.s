.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025C2C
/* E42C 80025C2C 0480023C */  lui        $v0, %hi(D_80046ED8)
/* E430 80025C30 D86E428C */  lw         $v0, %lo(D_80046ED8)($v0)
/* E434 80025C34 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* E438 80025C38 1000BFAF */  sw         $ra, 0x10($sp)
/* E43C 80025C3C 3800428C */  lw         $v0, 0x38($v0)
/* E440 80025C40 00000000 */  nop
/* E444 80025C44 09F84000 */  jalr       $v0
/* E448 80025C48 00000000 */   nop
/* E44C 80025C4C C2170200 */  srl        $v0, $v0, 31
/* E450 80025C50 1000BF8F */  lw         $ra, 0x10($sp)
/* E454 80025C54 1800BD27 */  addiu      $sp, $sp, 0x18
/* E458 80025C58 0800E003 */  jr         $ra
/* E45C 80025C5C 00000000 */   nop
