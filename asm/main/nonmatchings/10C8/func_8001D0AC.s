.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001D0AC
/* 58AC 8001D0AC 0480023C */  lui        $v0, %hi(D_80047E00)
/* 58B0 8001D0B0 007E428C */  lw         $v0, %lo(D_80047E00)($v0)
/* 58B4 8001D0B4 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 58B8 8001D0B8 1000BFAF */  sw         $ra, 0x10($sp)
/* 58BC 8001D0BC 0480013C */  lui        $at, %hi(D_80047F4C)
/* 58C0 8001D0C0 4C7F24AC */  sw         $a0, %lo(D_80047F4C)($at)
/* 58C4 8001D0C4 0480013C */  lui        $at, %hi(D_80047F44)
/* 58C8 8001D0C8 447F20AC */  sw         $zero, %lo(D_80047F44)($at)
/* 58CC 8001D0CC 0480013C */  lui        $at, %hi(D_80047F54)
/* 58D0 8001D0D0 547F20AC */  sw         $zero, %lo(D_80047F54)($at)
/* 58D4 8001D0D4 07004104 */  bgez       $v0, .L8001D0F4
/* 58D8 8001D0D8 00000000 */   nop
/* 58DC 8001D0DC 0280043C */  lui        $a0, %hi(func_8001CEC8)
/* 58E0 8001D0E0 C8CE8424 */  addiu      $a0, $a0, %lo(func_8001CEC8)
/* 58E4 8001D0E4 628C000C */  jal        func_80023188
/* 58E8 8001D0E8 21280000 */   addu      $a1, $zero, $zero
/* 58EC 8001D0EC 0480013C */  lui        $at, %hi(D_80047E00)
/* 58F0 8001D0F0 007E22AC */  sw         $v0, %lo(D_80047E00)($at)
.L8001D0F4:
/* 58F4 8001D0F4 1000BF8F */  lw         $ra, 0x10($sp)
/* 58F8 8001D0F8 00000000 */  nop
/* 58FC 8001D0FC 0800E003 */  jr         $ra
/* 5900 8001D100 1800BD27 */   addiu     $sp, $sp, 0x18
