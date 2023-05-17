.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025BC8
/* E3C8 80025BC8 21108000 */  addu       $v0, $a0, $zero
/* E3CC 80025BCC 0580063C */  lui        $a2, %hi(D_800522E4)
/* E3D0 80025BD0 E422C624 */  addiu      $a2, $a2, %lo(D_800522E4)
/* E3D4 80025BD4 0300C388 */  lwl        $v1, 0x3($a2)
/* E3D8 80025BD8 0000C398 */  lwr        $v1, 0x0($a2)
/* E3DC 80025BDC 0700C488 */  lwl        $a0, 0x7($a2)
/* E3E0 80025BE0 0400C498 */  lwr        $a0, 0x4($a2)
/* E3E4 80025BE4 0B00C588 */  lwl        $a1, 0xB($a2)
/* E3E8 80025BE8 0800C598 */  lwr        $a1, 0x8($a2)
/* E3EC 80025BEC 030043A8 */  swl        $v1, 0x3($v0)
/* E3F0 80025BF0 000043B8 */  swr        $v1, 0x0($v0)
/* E3F4 80025BF4 070044A8 */  swl        $a0, 0x7($v0)
/* E3F8 80025BF8 040044B8 */  swr        $a0, 0x4($v0)
/* E3FC 80025BFC 0B0045A8 */  swl        $a1, 0xB($v0)
/* E400 80025C00 080045B8 */  swr        $a1, 0x8($v0)
/* E404 80025C04 0F00C388 */  lwl        $v1, 0xF($a2)
/* E408 80025C08 0C00C398 */  lwr        $v1, 0xC($a2)
/* E40C 80025C0C 1300C488 */  lwl        $a0, 0x13($a2)
/* E410 80025C10 1000C498 */  lwr        $a0, 0x10($a2)
/* E414 80025C14 0F0043A8 */  swl        $v1, 0xF($v0)
/* E418 80025C18 0C0043B8 */  swr        $v1, 0xC($v0)
/* E41C 80025C1C 130044A8 */  swl        $a0, 0x13($v0)
/* E420 80025C20 100044B8 */  swr        $a0, 0x10($v0)
/* E424 80025C24 0800E003 */  jr         $ra
/* E428 80025C28 00000000 */   nop
