.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8002A6DC
/* 12EDC 8002A6DC E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 12EE0 8002A6E0 1000BFAF */  sw         $ra, 0x10($sp)
/* 12EE4 8002A6E4 728E000C */  jal        func_800239C8
/* 12EE8 8002A6E8 00000000 */   nop
/* 12EEC 8002A6EC C4A1000C */  jal        func_80028710
/* 12EF0 8002A6F0 21200000 */   addu      $a0, $zero, $zero
/* 12EF4 8002A6F4 B9A0000C */  jal        func_800282E4
/* 12EF8 8002A6F8 21200000 */   addu      $a0, $zero, $zero
/* 12EFC 8002A6FC 0480023C */  lui        $v0, %hi(D_800472CC)
/* 12F00 8002A700 CC72428C */  lw         $v0, %lo(D_800472CC)($v0)
/* 12F04 8002A704 00000000 */  nop
/* 12F08 8002A708 000040A0 */  sb         $zero, 0x0($v0)
/* 12F0C 8002A70C 0480023C */  lui        $v0, %hi(D_800472D8)
/* 12F10 8002A710 D872428C */  lw         $v0, %lo(D_800472D8)($v0)
/* 12F14 8002A714 00000000 */  nop
/* 12F18 8002A718 000040A0 */  sb         $zero, 0x0($v0)
/* 12F1C 8002A71C 068F000C */  jal        func_80023C18
/* 12F20 8002A720 00000000 */   nop
/* 12F24 8002A724 1000BF8F */  lw         $ra, 0x10($sp)
/* 12F28 8002A728 1800BD27 */  addiu      $sp, $sp, 0x18
/* 12F2C 8002A72C 0800E003 */  jr         $ra
/* 12F30 8002A730 00000000 */   nop
