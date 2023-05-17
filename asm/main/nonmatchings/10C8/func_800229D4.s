.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800229D4
/* B1D4 800229D4 E0FFBD27 */  addiu      $sp, $sp, -0x20
/* B1D8 800229D8 3000A28F */  lw         $v0, 0x30($sp)
/* B1DC 800229DC 1800BFAF */  sw         $ra, 0x18($sp)
/* B1E0 800229E0 6397000C */  jal        func_80025D8C
/* B1E4 800229E4 1000A2AF */   sw        $v0, 0x10($sp)
/* B1E8 800229E8 1800BF8F */  lw         $ra, 0x18($sp)
/* B1EC 800229EC 00000000 */  nop
/* B1F0 800229F0 0800E003 */  jr         $ra
/* B1F4 800229F4 2000BD27 */   addiu     $sp, $sp, 0x20
