.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800281A8
/* 109A8 800281A8 1000A38F */  lw         $v1, 0x10($sp)
/* 109AC 800281AC 21108000 */  addu       $v0, $a0, $zero
/* 109B0 800281B0 000045A4 */  sh         $a1, 0x0($v0)
/* 109B4 800281B4 020046A4 */  sh         $a2, 0x2($v0)
/* 109B8 800281B8 040047A4 */  sh         $a3, 0x4($v0)
/* 109BC 800281BC 080040A4 */  sh         $zero, 0x8($v0)
/* 109C0 800281C0 0A0040A4 */  sh         $zero, 0xA($v0)
/* 109C4 800281C4 0C0040A4 */  sh         $zero, 0xC($v0)
/* 109C8 800281C8 0E0040A4 */  sh         $zero, 0xE($v0)
/* 109CC 800281CC 110040A0 */  sb         $zero, 0x11($v0)
/* 109D0 800281D0 100040A0 */  sb         $zero, 0x10($v0)
/* 109D4 800281D4 130040A0 */  sb         $zero, 0x13($v0)
/* 109D8 800281D8 120040A0 */  sb         $zero, 0x12($v0)
/* 109DC 800281DC 0800E003 */  jr         $ra
/* 109E0 800281E0 060043A4 */   sh        $v1, 0x6($v0)
