.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022BA4
/* B3A4 80022BA4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B3A8 80022BA8 1400BFAF */  sw         $ra, 0x14($sp)
/* B3AC 80022BAC E58A000C */  jal        func_80022B94
/* B3B0 80022BB0 1000B0AF */   sw        $s0, 0x10($sp)
/* B3B4 80022BB4 21804000 */  addu       $s0, $v0, $zero
.L80022BB8:
/* B3B8 80022BB8 E58A000C */  jal        func_80022B94
/* B3BC 80022BBC 00000000 */   nop
/* B3C0 80022BC0 FDFF0212 */  beq        $s0, $v0, .L80022BB8
/* B3C4 80022BC4 01000234 */   ori       $v0, $zero, 0x1
/* B3C8 80022BC8 1400BF8F */  lw         $ra, 0x14($sp)
/* B3CC 80022BCC 1000B08F */  lw         $s0, 0x10($sp)
/* B3D0 80022BD0 0800E003 */  jr         $ra
/* B3D4 80022BD4 1800BD27 */   addiu     $sp, $sp, 0x18
