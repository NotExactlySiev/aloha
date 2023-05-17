.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_8001AED8
/* 36D8 8001AED8 0480013C */  lui        $at, %hi(D_80047F2C)
/* 36DC 8001AEDC 2C7F20A4 */  sh         $zero, %lo(D_80047F2C)($at)
/* 36E0 8001AEE0 0480013C */  lui        $at, %hi(D_80047F34)
/* 36E4 8001AEE4 347F20A4 */  sh         $zero, %lo(D_80047F34)($at)
/* 36E8 8001AEE8 0480013C */  lui        $at, %hi(D_80047E94)
/* 36EC 8001AEEC 947E20AC */  sw         $zero, %lo(D_80047E94)($at)
/* 36F0 8001AEF0 01000234 */  ori        $v0, $zero, 0x1
/* 36F4 8001AEF4 0480013C */  lui        $at, %hi(D_80047DD8)
/* 36F8 8001AEF8 D87D22AC */  sw         $v0, %lo(D_80047DD8)($at)
/* 36FC 8001AEFC 0480013C */  lui        $at, %hi(D_80047DDC)
/* 3700 8001AF00 DC7D22AC */  sw         $v0, %lo(D_80047DDC)($at)
/* 3704 8001AF04 0480013C */  lui        $at, %hi(D_80047DE0)
/* 3708 8001AF08 E07D20AC */  sw         $zero, %lo(D_80047DE0)($at)
/* 370C 8001AF0C FF000234 */  ori        $v0, $zero, 0xFF
/* 3710 8001AF10 0580013C */  lui        $at, %hi(D_8004D0F8)
/* 3714 8001AF14 F8D022A0 */  sb         $v0, %lo(D_8004D0F8)($at)
/* 3718 8001AF18 0480013C */  lui        $at, %hi(D_80047F3C)
/* 371C 8001AF1C 3C7F20A4 */  sh         $zero, %lo(D_80047F3C)($at)
/* 3720 8001AF20 0800E003 */  jr         $ra
/* 3724 8001AF24 00000000 */   nop
