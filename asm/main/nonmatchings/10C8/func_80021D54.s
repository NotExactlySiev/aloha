.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel func_80021D54
/* A554 80021D54 E8FFBD27 */  addiu      $sp, $sp, -0x18
/* A558 80021D58 1000BFAF */  sw         $ra, 0x10($sp)
/* A55C 80021D5C 0480013C */  lui        $at, %hi(D_80047E58)
/* A560 80021D60 587E20AC */  sw         $zero, %lo(D_80047E58)($at)
/* A564 80021D64 0280043C */  lui        $a0, %hi(func_80020D5C)
/* A568 80021D68 5C0D8424 */  addiu      $a0, $a0, %lo(func_80020D5C)
/* A56C 80021D6C 4266000C */  jal        func_80019908
/* A570 80021D70 00030534 */   ori       $a1, $zero, 0x300
/* A574 80021D74 0280043C */  lui        $a0, %hi(func_80020DC4)
/* A578 80021D78 C40D8424 */  addiu      $a0, $a0, %lo(func_80020DC4)
/* A57C 80021D7C 4266000C */  jal        func_80019908
/* A580 80021D80 01030534 */   ori       $a1, $zero, 0x301
/* A584 80021D84 0280043C */  lui        $a0, %hi(func_80020DE8)
/* A588 80021D88 E80D8424 */  addiu      $a0, $a0, %lo(func_80020DE8)
/* A58C 80021D8C 4266000C */  jal        func_80019908
/* A590 80021D90 02030534 */   ori       $a1, $zero, 0x302
/* A594 80021D94 0280043C */  lui        $a0, %hi(func_80020E30)
/* A598 80021D98 300E8424 */  addiu      $a0, $a0, %lo(func_80020E30)
/* A59C 80021D9C 4266000C */  jal        func_80019908
/* A5A0 80021DA0 03030534 */   ori       $a1, $zero, 0x303
/* A5A4 80021DA4 0280043C */  lui        $a0, %hi(func_80020E40)
/* A5A8 80021DA8 400E8424 */  addiu      $a0, $a0, %lo(func_80020E40)
/* A5AC 80021DAC 4266000C */  jal        func_80019908
/* A5B0 80021DB0 04030534 */   ori       $a1, $zero, 0x304
/* A5B4 80021DB4 0280043C */  lui        $a0, %hi(func_80020F48)
/* A5B8 80021DB8 480F8424 */  addiu      $a0, $a0, %lo(func_80020F48)
/* A5BC 80021DBC 4266000C */  jal        func_80019908
/* A5C0 80021DC0 05030534 */   ori       $a1, $zero, 0x305
/* A5C4 80021DC4 0280043C */  lui        $a0, %hi(func_80020F9C)
/* A5C8 80021DC8 9C0F8424 */  addiu      $a0, $a0, %lo(func_80020F9C)
/* A5CC 80021DCC 4266000C */  jal        func_80019908
/* A5D0 80021DD0 07030534 */   ori       $a1, $zero, 0x307
/* A5D4 80021DD4 0280043C */  lui        $a0, %hi(func_80020E88)
/* A5D8 80021DD8 880E8424 */  addiu      $a0, $a0, %lo(func_80020E88)
/* A5DC 80021DDC 4266000C */  jal        func_80019908
/* A5E0 80021DE0 08030534 */   ori       $a1, $zero, 0x308
/* A5E4 80021DE4 0280043C */  lui        $a0, %hi(func_80020EB4)
/* A5E8 80021DE8 B40E8424 */  addiu      $a0, $a0, %lo(func_80020EB4)
/* A5EC 80021DEC 4266000C */  jal        func_80019908
/* A5F0 80021DF0 09030534 */   ori       $a1, $zero, 0x309
/* A5F4 80021DF4 0280043C */  lui        $a0, %hi(func_80021320)
/* A5F8 80021DF8 20138424 */  addiu      $a0, $a0, %lo(func_80021320)
/* A5FC 80021DFC 4266000C */  jal        func_80019908
/* A600 80021E00 0A030534 */   ori       $a1, $zero, 0x30A
/* A604 80021E04 0280043C */  lui        $a0, %hi(func_80021490)
/* A608 80021E08 90148424 */  addiu      $a0, $a0, %lo(func_80021490)
/* A60C 80021E0C 4266000C */  jal        func_80019908
/* A610 80021E10 0B030534 */   ori       $a1, $zero, 0x30B
/* A614 80021E14 0280043C */  lui        $a0, %hi(func_80021740)
/* A618 80021E18 40178424 */  addiu      $a0, $a0, %lo(func_80021740)
/* A61C 80021E1C 4266000C */  jal        func_80019908
/* A620 80021E20 0C030534 */   ori       $a1, $zero, 0x30C
/* A624 80021E24 0280043C */  lui        $a0, %hi(func_800212FC)
/* A628 80021E28 FC128424 */  addiu      $a0, $a0, %lo(func_800212FC)
/* A62C 80021E2C 4266000C */  jal        func_80019908
/* A630 80021E30 0D030534 */   ori       $a1, $zero, 0x30D
/* A634 80021E34 0280043C */  lui        $a0, %hi(func_80021310)
/* A638 80021E38 10138424 */  addiu      $a0, $a0, %lo(func_80021310)
/* A63C 80021E3C 4266000C */  jal        func_80019908
/* A640 80021E40 0E030534 */   ori       $a1, $zero, 0x30E
/* A644 80021E44 0280043C */  lui        $a0, %hi(func_80021600)
/* A648 80021E48 00168424 */  addiu      $a0, $a0, %lo(func_80021600)
/* A64C 80021E4C 4266000C */  jal        func_80019908
/* A650 80021E50 0F030534 */   ori       $a1, $zero, 0x30F
/* A654 80021E54 0280043C */  lui        $a0, %hi(func_80021808)
/* A658 80021E58 08188424 */  addiu      $a0, $a0, %lo(func_80021808)
/* A65C 80021E5C 4266000C */  jal        func_80019908
/* A660 80021E60 20030534 */   ori       $a1, $zero, 0x320
/* A664 80021E64 0280043C */  lui        $a0, %hi(func_80020FC0)
/* A668 80021E68 C00F8424 */  addiu      $a0, $a0, %lo(func_80020FC0)
/* A66C 80021E6C 4266000C */  jal        func_80019908
/* A670 80021E70 30030534 */   ori       $a1, $zero, 0x330
/* A674 80021E74 0280043C */  lui        $a0, %hi(func_80021028)
/* A678 80021E78 28108424 */  addiu      $a0, $a0, %lo(func_80021028)
/* A67C 80021E7C 4266000C */  jal        func_80019908
/* A680 80021E80 31030534 */   ori       $a1, $zero, 0x331
/* A684 80021E84 0280043C */  lui        $a0, %hi(func_800210D4)
/* A688 80021E88 D4108424 */  addiu      $a0, $a0, %lo(func_800210D4)
/* A68C 80021E8C 4266000C */  jal        func_80019908
/* A690 80021E90 32030534 */   ori       $a1, $zero, 0x332
/* A694 80021E94 0280043C */  lui        $a0, %hi(func_800218DC)
/* A698 80021E98 DC188424 */  addiu      $a0, $a0, %lo(func_800218DC)
/* A69C 80021E9C 4266000C */  jal        func_80019908
/* A6A0 80021EA0 40030534 */   ori       $a1, $zero, 0x340
/* A6A4 80021EA4 0280043C */  lui        $a0, %hi(func_800219DC)
/* A6A8 80021EA8 DC198424 */  addiu      $a0, $a0, %lo(func_800219DC)
/* A6AC 80021EAC 4266000C */  jal        func_80019908
/* A6B0 80021EB0 41030534 */   ori       $a1, $zero, 0x341
/* A6B4 80021EB4 0280043C */  lui        $a0, %hi(func_80021BCC)
/* A6B8 80021EB8 CC1B8424 */  addiu      $a0, $a0, %lo(func_80021BCC)
/* A6BC 80021EBC 4266000C */  jal        func_80019908
/* A6C0 80021EC0 42030534 */   ori       $a1, $zero, 0x342
/* A6C4 80021EC4 0280043C */  lui        $a0, %hi(func_80021D08)
/* A6C8 80021EC8 081D8424 */  addiu      $a0, $a0, %lo(func_80021D08)
/* A6CC 80021ECC 4266000C */  jal        func_80019908
/* A6D0 80021ED0 43030534 */   ori       $a1, $zero, 0x343
/* A6D4 80021ED4 0280043C */  lui        $a0, %hi(func_800218A0)
/* A6D8 80021ED8 A0188424 */  addiu      $a0, $a0, %lo(func_800218A0)
/* A6DC 80021EDC 4266000C */  jal        func_80019908
/* A6E0 80021EE0 44030534 */   ori       $a1, $zero, 0x344
/* A6E4 80021EE4 1000BF8F */  lw         $ra, 0x10($sp)
/* A6E8 80021EE8 00000000 */  nop
/* A6EC 80021EEC 0800E003 */  jr         $ra
/* A6F0 80021EF0 1800BD27 */   addiu     $sp, $sp, 0x18
