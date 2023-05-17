.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80025720
/* DF20 80025720 21408000 */  addu       $t0, $a0, $zero
/* DF24 80025724 21380001 */  addu       $a3, $t0, $zero
/* DF28 80025728 0580063C */  lui        $a2, %hi(D_80052288)
/* DF2C 8002572C 8822C624 */  addiu      $a2, $a2, %lo(D_80052288)
/* DF30 80025730 5000C924 */  addiu      $t1, $a2, 0x50
.L80025734:
/* DF34 80025734 0000C28C */  lw         $v0, 0x0($a2)
/* DF38 80025738 0400C38C */  lw         $v1, 0x4($a2)
/* DF3C 8002573C 0800C48C */  lw         $a0, 0x8($a2)
/* DF40 80025740 0C00C58C */  lw         $a1, 0xC($a2)
/* DF44 80025744 0000E2AC */  sw         $v0, 0x0($a3)
/* DF48 80025748 0400E3AC */  sw         $v1, 0x4($a3)
/* DF4C 8002574C 0800E4AC */  sw         $a0, 0x8($a3)
/* DF50 80025750 0C00E5AC */  sw         $a1, 0xC($a3)
/* DF54 80025754 1000C624 */  addiu      $a2, $a2, 0x10
/* DF58 80025758 F6FFC914 */  bne        $a2, $t1, .L80025734
/* DF5C 8002575C 1000E724 */   addiu     $a3, $a3, 0x10
/* DF60 80025760 0000C28C */  lw         $v0, 0x0($a2)
/* DF64 80025764 0400C38C */  lw         $v1, 0x4($a2)
/* DF68 80025768 0800C48C */  lw         $a0, 0x8($a2)
/* DF6C 8002576C 0000E2AC */  sw         $v0, 0x0($a3)
/* DF70 80025770 0400E3AC */  sw         $v1, 0x4($a3)
/* DF74 80025774 0800E4AC */  sw         $a0, 0x8($a3)
/* DF78 80025778 0800E003 */  jr         $ra
/* DF7C 8002577C 21100001 */   addu      $v0, $t0, $zero
