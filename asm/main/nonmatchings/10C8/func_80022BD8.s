.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022BD8
/* B3D8 80022BD8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3DC 80022BDC 1000BFAF */  sw         $ra, 0x10($sp)
/* B3E0 80022BE0 0480023C */  lui        $v0, %hi(D_80047E68)
/* B3E4 80022BE4 687E428C */  lw         $v0, %lo(D_80047E68)($v0)
/* B3E8 80022BE8 00000000 */  nop
/* B3EC 80022BEC 07004014 */  bnez       $v0, .L80022C0C
/* B3F0 80022BF0 01000334 */   ori       $v1, $zero, 0x1
/* B3F4 80022BF4 AC93000C */  jal        func_80024EB0
/* B3F8 80022BF8 00000000 */   nop
/* B3FC 80022BFC 21184000 */  addu       $v1, $v0, $zero
/* B400 80022C00 01000234 */  ori        $v0, $zero, 0x1
/* B404 80022C04 0480013C */  lui        $at, %hi(D_80047E68)
/* B408 80022C08 687E22AC */  sw         $v0, %lo(D_80047E68)($at)
.L80022C0C:
/* B40C 80022C0C 1000BF8F */  lw         $ra, 0x10($sp)
/* B410 80022C10 21106000 */  addu       $v0, $v1, $zero
/* B414 80022C14 0800E003 */  jr         $ra
/* B418 80022C18 1800BD27 */   addiu     $sp, $sp, 0x18
