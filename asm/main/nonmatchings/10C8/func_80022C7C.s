.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022C7C
/* B47C 80022C7C D8FFBD27 */  addiu      $sp, $sp, -0x28
/* B480 80022C80 3800A28F */  lw         $v0, 0x38($sp)
/* B484 80022C84 3C00A38F */  lw         $v1, 0x3C($sp)
/* B488 80022C88 4000A88F */  lw         $t0, 0x40($sp)
/* B48C 80022C8C 2000BFAF */  sw         $ra, 0x20($sp)
/* B490 80022C90 1000A2AF */  sw         $v0, 0x10($sp)
/* B494 80022C94 1400A3AF */  sw         $v1, 0x14($sp)
/* B498 80022C98 F19F000C */  jal        func_80027FC4
/* B49C 80022C9C 1800A8AF */   sw        $t0, 0x18($sp)
/* B4A0 80022CA0 2000BF8F */  lw         $ra, 0x20($sp)
/* B4A4 80022CA4 FFFF4230 */  andi       $v0, $v0, 0xFFFF
/* B4A8 80022CA8 0800E003 */  jr         $ra
/* B4AC 80022CAC 2800BD27 */   addiu     $sp, $sp, 0x28
