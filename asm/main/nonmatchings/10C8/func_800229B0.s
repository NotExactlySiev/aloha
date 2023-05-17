.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800229B0
/* B1B0 800229B0 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B1B4 800229B4 3000A28F */  lw         $v0, 0x30($sp)
/* B1B8 800229B8 1800BFAF */  sw         $ra, 0x18($sp)
/* B1BC 800229BC 46A0000C */  jal        func_80028118
/* B1C0 800229C0 1000A2AF */   sw        $v0, 0x10($sp)
/* B1C4 800229C4 1800BF8F */  lw         $ra, 0x18($sp)
/* B1C8 800229C8 00000000 */  nop
/* B1CC 800229CC 0800E003 */  jr         $ra
/* B1D0 800229D0 2000BD27 */   addiu     $sp, $sp, 0x20
