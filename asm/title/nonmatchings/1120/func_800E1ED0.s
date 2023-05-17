.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_800E1ED0
/* 26D0 800E1ED0 1A80033C */  lui        $v1, %hi(D_801A0FD8)
/* 26D4 800E1ED4 D80F638C */  lw         $v1, %lo(D_801A0FD8)($v1)
/* 26D8 800E1ED8 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 26DC 800E1EDC 1000BFAF */  sw         $ra, 0x10($sp)
/* 26E0 800E1EE0 E7006490 */  lbu        $a0, 0xE7($v1)
/* 26E4 800E1EE4 00000000 */  nop
/* 26E8 800E1EE8 0100822C */  sltiu      $v0, $a0, 0x1
/* 26EC 800E1EEC 21204000 */  addu       $a0, $v0, $zero
/* 26F0 800E1EF0 E70064A0 */  sb         $a0, 0xE7($v1)
/* 26F4 800E1EF4 0E80023C */  lui        $v0, %hi(D_800E7FA0)
/* 26F8 800E1EF8 A07F428C */  lw         $v0, %lo(D_800E7FA0)($v0)
/* 26FC 800E1EFC 00000000 */  nop
/* 2700 800E1F00 080C428C */  lw         $v0, 0xC08($v0)
/* 2704 800E1F04 00000000 */  nop
/* 2708 800E1F08 09F84000 */  jalr       $v0
/* 270C 800E1F0C 00000000 */   nop
/* 2710 800E1F10 D582030C */  jal        func_800E0B54
/* 2714 800E1F14 00260434 */   ori       $a0, $zero, 0x2600
/* 2718 800E1F18 1000BF8F */  lw         $ra, 0x10($sp)
/* 271C 800E1F1C 00000000 */  nop
/* 2720 800E1F20 0800E003 */  jr         $ra
/* 2724 800E1F24 1800BD27 */   addiu     $sp, $sp, 0x18
