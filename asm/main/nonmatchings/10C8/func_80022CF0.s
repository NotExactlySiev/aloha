.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80022CF0
/* B4F0 80022CF0 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* B4F4 80022CF4 1000BFAF */  sw         $ra, 0x10($sp)
/* B4F8 80022CF8 0280043C */  lui        $a0, %hi(func_80022B00)
/* B4FC 80022CFC 002B8424 */  addiu      $a0, $a0, %lo(func_80022B00)
/* B500 80022D00 4266000C */  jal        func_80019908
/* B504 80022D04 80010534 */   ori       $a1, $zero, 0x180
/* B508 80022D08 0280043C */  lui        $a0, %hi(func_80022B54)
/* B50C 80022D0C 542B8424 */  addiu      $a0, $a0, %lo(func_80022B54)
/* B510 80022D10 4266000C */  jal        func_80019908
/* B514 80022D14 81010534 */   ori       $a1, $zero, 0x181
/* B518 80022D18 0280043C */  lui        $a0, %hi(func_80022BD8)
/* B51C 80022D1C D82B8424 */  addiu      $a0, $a0, %lo(func_80022BD8)
/* B520 80022D20 4266000C */  jal        func_80019908
/* B524 80022D24 82010534 */   ori       $a1, $zero, 0x182
/* B528 80022D28 0280043C */  lui        $a0, %hi(func_80022C1C)
/* B52C 80022D2C 1C2C8424 */  addiu      $a0, $a0, %lo(func_80022C1C)
/* B530 80022D30 4266000C */  jal        func_80019908
/* B534 80022D34 83010534 */   ori       $a1, $zero, 0x183
/* B538 80022D38 0280043C */  lui        $a0, %hi(func_80022B94)
/* B53C 80022D3C 942B8424 */  addiu      $a0, $a0, %lo(func_80022B94)
/* B540 80022D40 4266000C */  jal        func_80019908
/* B544 80022D44 84010534 */   ori       $a1, $zero, 0x184
/* B548 80022D48 0280043C */  lui        $a0, %hi(func_80022AA0)
/* B54C 80022D4C A02A8424 */  addiu      $a0, $a0, %lo(func_80022AA0)
/* B550 80022D50 4266000C */  jal        func_80019908
/* B554 80022D54 85010534 */   ori       $a1, $zero, 0x185
/* B558 80022D58 0280043C */  lui        $a0, %hi(func_80022AC0)
/* B55C 80022D5C C02A8424 */  addiu      $a0, $a0, %lo(func_80022AC0)
/* B560 80022D60 4266000C */  jal        func_80019908
/* B564 80022D64 86010534 */   ori       $a1, $zero, 0x186
/* B568 80022D68 0280043C */  lui        $a0, %hi(func_80022A40)
/* B56C 80022D6C 402A8424 */  addiu      $a0, $a0, %lo(func_80022A40)
/* B570 80022D70 4266000C */  jal        func_80019908
/* B574 80022D74 87010534 */   ori       $a1, $zero, 0x187
/* B578 80022D78 0280043C */  lui        $a0, %hi(func_80022A60)
/* B57C 80022D7C 602A8424 */  addiu      $a0, $a0, %lo(func_80022A60)
/* B580 80022D80 4266000C */  jal        func_80019908
/* B584 80022D84 88010534 */   ori       $a1, $zero, 0x188
/* B588 80022D88 0280043C */  lui        $a0, %hi(func_80022A80)
/* B58C 80022D8C 802A8424 */  addiu      $a0, $a0, %lo(func_80022A80)
/* B590 80022D90 4266000C */  jal        func_80019908
/* B594 80022D94 89010534 */   ori       $a1, $zero, 0x189
/* B598 80022D98 0280043C */  lui        $a0, %hi(func_80022A20)
/* B59C 80022D9C 202A8424 */  addiu      $a0, $a0, %lo(func_80022A20)
/* B5A0 80022DA0 4266000C */  jal        func_80019908
/* B5A4 80022DA4 8A010534 */   ori       $a1, $zero, 0x18A
/* B5A8 80022DA8 0280043C */  lui        $a0, %hi(func_800229F8)
/* B5AC 80022DAC F8298424 */  addiu      $a0, $a0, %lo(func_800229F8)
/* B5B0 80022DB0 4266000C */  jal        func_80019908
/* B5B4 80022DB4 8B010534 */   ori       $a1, $zero, 0x18B
/* B5B8 80022DB8 0280043C */  lui        $a0, %hi(func_80022AE0)
/* B5BC 80022DBC E02A8424 */  addiu      $a0, $a0, %lo(func_80022AE0)
/* B5C0 80022DC0 4266000C */  jal        func_80019908
/* B5C4 80022DC4 8C010534 */   ori       $a1, $zero, 0x18C
/* B5C8 80022DC8 0280043C */  lui        $a0, %hi(func_800229D4)
/* B5CC 80022DCC D4298424 */  addiu      $a0, $a0, %lo(func_800229D4)
/* B5D0 80022DD0 4266000C */  jal        func_80019908
/* B5D4 80022DD4 8D010534 */   ori       $a1, $zero, 0x18D
/* B5D8 80022DD8 0280043C */  lui        $a0, %hi(func_80022954)
/* B5DC 80022DDC 54298424 */  addiu      $a0, $a0, %lo(func_80022954)
/* B5E0 80022DE0 4266000C */  jal        func_80019908
/* B5E4 80022DE4 8E010534 */   ori       $a1, $zero, 0x18E
/* B5E8 80022DE8 0280043C */  lui        $a0, %hi(func_800229B0)
/* B5EC 80022DEC B0298424 */  addiu      $a0, $a0, %lo(func_800229B0)
/* B5F0 80022DF0 4266000C */  jal        func_80019908
/* B5F4 80022DF4 8F010534 */   ori       $a1, $zero, 0x18F
/* B5F8 80022DF8 0280043C */  lui        $a0, %hi(func_80022934)
/* B5FC 80022DFC 34298424 */  addiu      $a0, $a0, %lo(func_80022934)
/* B600 80022E00 4266000C */  jal        func_80019908
/* B604 80022E04 90010534 */   ori       $a1, $zero, 0x190
/* B608 80022E08 0280043C */  lui        $a0, %hi(func_80022B74)
/* B60C 80022E0C 742B8424 */  addiu      $a0, $a0, %lo(func_80022B74)
/* B610 80022E10 4266000C */  jal        func_80019908
/* B614 80022E14 91010534 */   ori       $a1, $zero, 0x191
/* B618 80022E18 0280043C */  lui        $a0, %hi(func_80022894)
/* B61C 80022E1C 94288424 */  addiu      $a0, $a0, %lo(func_80022894)
/* B620 80022E20 4266000C */  jal        func_80019908
/* B624 80022E24 92010534 */   ori       $a1, $zero, 0x192
/* B628 80022E28 0280043C */  lui        $a0, %hi(func_800228B4)
/* B62C 80022E2C B4288424 */  addiu      $a0, $a0, %lo(func_800228B4)
/* B630 80022E30 4266000C */  jal        func_80019908
/* B634 80022E34 93010534 */   ori       $a1, $zero, 0x193
/* B638 80022E38 0280043C */  lui        $a0, %hi(func_800228D4)
/* B63C 80022E3C D4288424 */  addiu      $a0, $a0, %lo(func_800228D4)
/* B640 80022E40 4266000C */  jal        func_80019908
/* B644 80022E44 94010534 */   ori       $a1, $zero, 0x194
/* B648 80022E48 0280043C */  lui        $a0, %hi(func_800228F4)
/* B64C 80022E4C F4288424 */  addiu      $a0, $a0, %lo(func_800228F4)
/* B650 80022E50 4266000C */  jal        func_80019908
/* B654 80022E54 95010534 */   ori       $a1, $zero, 0x195
/* B658 80022E58 0280043C */  lui        $a0, %hi(func_80022914)
/* B65C 80022E5C 14298424 */  addiu      $a0, $a0, %lo(func_80022914)
/* B660 80022E60 4266000C */  jal        func_80019908
/* B664 80022E64 96010534 */   ori       $a1, $zero, 0x196
/* B668 80022E68 0280043C */  lui        $a0, %hi(func_80022854)
/* B66C 80022E6C 54288424 */  addiu      $a0, $a0, %lo(func_80022854)
/* B670 80022E70 4266000C */  jal        func_80019908
/* B674 80022E74 97010534 */   ori       $a1, $zero, 0x197
/* B678 80022E78 0280043C */  lui        $a0, %hi(func_80022874)
/* B67C 80022E7C 74288424 */  addiu      $a0, $a0, %lo(func_80022874)
/* B680 80022E80 4266000C */  jal        func_80019908
/* B684 80022E84 98010534 */   ori       $a1, $zero, 0x198
/* B688 80022E88 0280043C */  lui        $a0, %hi(func_80022C3C)
/* B68C 80022E8C 3C2C8424 */  addiu      $a0, $a0, %lo(func_80022C3C)
/* B690 80022E90 4266000C */  jal        func_80019908
/* B694 80022E94 99010534 */   ori       $a1, $zero, 0x199
/* B698 80022E98 0280043C */  lui        $a0, %hi(func_80022C7C)
/* B69C 80022E9C 7C2C8424 */  addiu      $a0, $a0, %lo(func_80022C7C)
/* B6A0 80022EA0 4266000C */  jal        func_80019908
/* B6A4 80022EA4 9A010534 */   ori       $a1, $zero, 0x19A
/* B6A8 80022EA8 0280043C */  lui        $a0, %hi(func_80022C5C)
/* B6AC 80022EAC 5C2C8424 */  addiu      $a0, $a0, %lo(func_80022C5C)
/* B6B0 80022EB0 4266000C */  jal        func_80019908
/* B6B4 80022EB4 9B010534 */   ori       $a1, $zero, 0x19B
/* B6B8 80022EB8 0280043C */  lui        $a0, %hi(func_80022CB0)
/* B6BC 80022EBC B02C8424 */  addiu      $a0, $a0, %lo(func_80022CB0)
/* B6C0 80022EC0 4266000C */  jal        func_80019908
/* B6C4 80022EC4 9C010534 */   ori       $a1, $zero, 0x19C
/* B6C8 80022EC8 0280043C */  lui        $a0, %hi(func_80022CD0)
/* B6CC 80022ECC D02C8424 */  addiu      $a0, $a0, %lo(func_80022CD0)
/* B6D0 80022ED0 4266000C */  jal        func_80019908
/* B6D4 80022ED4 9D010534 */   ori       $a1, $zero, 0x19D
/* B6D8 80022ED8 1000BF8F */  lw         $ra, 0x10($sp)
/* B6DC 80022EDC 00000000 */  nop
/* B6E0 80022EE0 0800E003 */  jr         $ra
/* B6E4 80022EE4 1800BD27 */   addiu     $sp, $sp, 0x18
