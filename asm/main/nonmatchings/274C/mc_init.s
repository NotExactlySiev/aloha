.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */

glabel mc_init
/* 912C 8002092C E8FFBD27 */  addiu      $sp, $sp, -0x18
/* 9130 80020930 1000BFAF */  sw         $ra, 0x10($sp)
/* 9134 80020934 368F000C */  jal         InitCARD2
/* 9138 80020938 01000434 */   ori       $a0, $zero, 0x1
/* 913C 8002093C 3E8F000C */  jal         StartCARD2
/* 9140 80020940 00000000 */   nop
/* 9144 80020944 428F000C */  jal         _bu_init
/* 9148 80020948 00000000 */   nop
/* 914C 8002094C 2E8F000C */  jal         _card_auto
/* 9150 80020950 21200000 */   addu      $a0, $zero, $zero
/* 9154 80020954 0480013C */  lui        $at, %hi(D_80047E1C)
/* 9158 80020958 1C7E20AC */  sw         $zero, %lo(D_80047E1C)($at)
/* 915C 8002095C 728E000C */  jal         EnterCriticalSection
/* 9160 80020960 00000000 */   nop
/* 9164 80020964 00F4043C */  lui        $a0, (0xF4000001 >> 16)
/* 9168 80020968 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
/* 916C 8002096C 04000534 */  ori        $a1, $zero, 0x4
/* 9170 80020970 00200634 */  ori        $a2, $zero, 0x2000
/* 9174 80020974 FA8E000C */  jal         OpenEvent
/* 9178 80020978 21380000 */   addu      $a3, $zero, $zero
/* 917C 8002097C 0480013C */  lui        $at, %hi(D_80047FB4)
/* 9180 80020980 B47F22AC */  sw         $v0, %lo(D_80047FB4)($at)
/* 9184 80020984 00F4043C */  lui        $a0, (0xF4000001 >> 16)
/* 9188 80020988 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
/* 918C 8002098C 00800534 */  ori        $a1, $zero, 0x8000
/* 9190 80020990 00200634 */  ori        $a2, $zero, 0x2000
/* 9194 80020994 FA8E000C */  jal         OpenEvent
/* 9198 80020998 21380000 */   addu      $a3, $zero, $zero
/* 919C 8002099C 0480013C */  lui        $at, %hi(D_80047FBC)
/* 91A0 800209A0 BC7F22AC */  sw         $v0, %lo(D_80047FBC)($at)
/* 91A4 800209A4 00F4043C */  lui        $a0, (0xF4000001 >> 16)
/* 91A8 800209A8 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
/* 91AC 800209AC 00010534 */  ori        $a1, $zero, 0x100
/* 91B0 800209B0 00200634 */  ori        $a2, $zero, 0x2000
/* 91B4 800209B4 FA8E000C */  jal         OpenEvent
/* 91B8 800209B8 21380000 */   addu      $a3, $zero, $zero
/* 91BC 800209BC 0480013C */  lui        $at, %hi(D_80047FC4)
/* 91C0 800209C0 C47F22AC */  sw         $v0, %lo(D_80047FC4)($at)
/* 91C4 800209C4 00F4043C */  lui        $a0, (0xF4000001 >> 16)
/* 91C8 800209C8 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
/* 91CC 800209CC 00200534 */  ori        $a1, $zero, 0x2000
/* 91D0 800209D0 00200634 */  ori        $a2, $zero, 0x2000
/* 91D4 800209D4 FA8E000C */  jal         OpenEvent
/* 91D8 800209D8 21380000 */   addu      $a3, $zero, $zero
/* 91DC 800209DC 0480013C */  lui        $at, %hi(D_80047FCC)
/* 91E0 800209E0 CC7F22AC */  sw         $v0, %lo(D_80047FCC)($at)
/* 91E4 800209E4 00F4043C */  lui        $a0, (0xF4000001 >> 16)
/* 91E8 800209E8 01008434 */  ori        $a0, $a0, (0xF4000001 & 0xFFFF)
/* 91EC 800209EC 00020534 */  ori        $a1, $zero, 0x200
/* 91F0 800209F0 00200634 */  ori        $a2, $zero, 0x2000
/* 91F4 800209F4 FA8E000C */  jal         OpenEvent
/* 91F8 800209F8 21380000 */   addu      $a3, $zero, $zero
/* 91FC 800209FC 0480013C */  lui        $at, %hi(D_80047FD4)
/* 9200 80020A00 D47F22AC */  sw         $v0, %lo(D_80047FD4)($at)
/* 9204 80020A04 00F0043C */  lui        $a0, (0xF0000011 >> 16)
/* 9208 80020A08 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
/* 920C 80020A0C 04000534 */  ori        $a1, $zero, 0x4
/* 9210 80020A10 00200634 */  ori        $a2, $zero, 0x2000
/* 9214 80020A14 FA8E000C */  jal         OpenEvent
/* 9218 80020A18 21380000 */   addu      $a3, $zero, $zero
/* 921C 80020A1C 0480013C */  lui        $at, %hi(D_80047FDC)
/* 9220 80020A20 DC7F22AC */  sw         $v0, %lo(D_80047FDC)($at)
/* 9224 80020A24 00F0043C */  lui        $a0, (0xF0000011 >> 16)
/* 9228 80020A28 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
/* 922C 80020A2C 00800534 */  ori        $a1, $zero, 0x8000
/* 9230 80020A30 00200634 */  ori        $a2, $zero, 0x2000
/* 9234 80020A34 FA8E000C */  jal         OpenEvent
/* 9238 80020A38 21380000 */   addu      $a3, $zero, $zero
/* 923C 80020A3C 0480013C */  lui        $at, %hi(D_80047FE4)
/* 9240 80020A40 E47F22AC */  sw         $v0, %lo(D_80047FE4)($at)
/* 9244 80020A44 00F0043C */  lui        $a0, (0xF0000011 >> 16)
/* 9248 80020A48 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
/* 924C 80020A4C 00010534 */  ori        $a1, $zero, 0x100
/* 9250 80020A50 00200634 */  ori        $a2, $zero, 0x2000
/* 9254 80020A54 FA8E000C */  jal         OpenEvent
/* 9258 80020A58 21380000 */   addu      $a3, $zero, $zero
/* 925C 80020A5C 0480013C */  lui        $at, %hi(D_80047FEC)
/* 9260 80020A60 EC7F22AC */  sw         $v0, %lo(D_80047FEC)($at)
/* 9264 80020A64 00F0043C */  lui        $a0, (0xF0000011 >> 16)
/* 9268 80020A68 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
/* 926C 80020A6C 00200534 */  ori        $a1, $zero, 0x2000
/* 9270 80020A70 00200634 */  ori        $a2, $zero, 0x2000
/* 9274 80020A74 FA8E000C */  jal         OpenEvent
/* 9278 80020A78 21380000 */   addu      $a3, $zero, $zero
/* 927C 80020A7C 0480013C */  lui        $at, %hi(D_80047FF4)
/* 9280 80020A80 F47F22AC */  sw         $v0, %lo(D_80047FF4)($at)
/* 9284 80020A84 00F0043C */  lui        $a0, (0xF0000011 >> 16)
/* 9288 80020A88 11008434 */  ori        $a0, $a0, (0xF0000011 & 0xFFFF)
/* 928C 80020A8C 00020534 */  ori        $a1, $zero, 0x200
/* 9290 80020A90 00200634 */  ori        $a2, $zero, 0x2000
/* 9294 80020A94 FA8E000C */  jal         OpenEvent
/* 9298 80020A98 21380000 */   addu      $a3, $zero, $zero
/* 929C 80020A9C 0480043C */  lui        $a0, %hi(D_80047FB4)
/* 92A0 80020AA0 B47F848C */  lw         $a0, %lo(D_80047FB4)($a0)
/* 92A4 80020AA4 0480013C */  lui        $at, %hi(D_80047FFC)
/* 92A8 80020AA8 FC7F22AC */  sw         $v0, %lo(D_80047FFC)($at)
/* 92AC 80020AAC 828E000C */  jal         EnableEvent
/* 92B0 80020AB0 00000000 */   nop
/* 92B4 80020AB4 0480043C */  lui        $a0, %hi(D_80047FBC)
/* 92B8 80020AB8 BC7F848C */  lw         $a0, %lo(D_80047FBC)($a0)
/* 92BC 80020ABC 828E000C */  jal         EnableEvent
/* 92C0 80020AC0 00000000 */   nop
/* 92C4 80020AC4 0480043C */  lui        $a0, %hi(D_80047FC4)
/* 92C8 80020AC8 C47F848C */  lw         $a0, %lo(D_80047FC4)($a0)
/* 92CC 80020ACC 828E000C */  jal         EnableEvent
/* 92D0 80020AD0 00000000 */   nop
/* 92D4 80020AD4 0480043C */  lui        $a0, %hi(D_80047FCC)
/* 92D8 80020AD8 CC7F848C */  lw         $a0, %lo(D_80047FCC)($a0)
/* 92DC 80020ADC 828E000C */  jal         EnableEvent
/* 92E0 80020AE0 00000000 */   nop
/* 92E4 80020AE4 0480043C */  lui        $a0, %hi(D_80047FD4)
/* 92E8 80020AE8 D47F848C */  lw         $a0, %lo(D_80047FD4)($a0)
/* 92EC 80020AEC 828E000C */  jal         EnableEvent
/* 92F0 80020AF0 00000000 */   nop
/* 92F4 80020AF4 0480043C */  lui        $a0, %hi(D_80047FDC)
/* 92F8 80020AF8 DC7F848C */  lw         $a0, %lo(D_80047FDC)($a0)
/* 92FC 80020AFC 828E000C */  jal         EnableEvent
/* 9300 80020B00 00000000 */   nop
/* 9304 80020B04 0480043C */  lui        $a0, %hi(D_80047FE4)
/* 9308 80020B08 E47F848C */  lw         $a0, %lo(D_80047FE4)($a0)
/* 930C 80020B0C 828E000C */  jal         EnableEvent
/* 9310 80020B10 00000000 */   nop
/* 9314 80020B14 0480043C */  lui        $a0, %hi(D_80047FEC)
/* 9318 80020B18 EC7F848C */  lw         $a0, %lo(D_80047FEC)($a0)
/* 931C 80020B1C 828E000C */  jal         EnableEvent
/* 9320 80020B20 00000000 */   nop
/* 9324 80020B24 0480043C */  lui        $a0, %hi(D_80047FF4)
/* 9328 80020B28 F47F848C */  lw         $a0, %lo(D_80047FF4)($a0)
/* 932C 80020B2C 828E000C */  jal         EnableEvent
/* 9330 80020B30 00000000 */   nop
/* 9334 80020B34 0480043C */  lui        $a0, %hi(D_80047FFC)
/* 9338 80020B38 FC7F848C */  lw         $a0, %lo(D_80047FFC)($a0)
/* 933C 80020B3C 828E000C */  jal         EnableEvent
/* 9340 80020B40 00000000 */   nop
/* 9344 80020B44 068F000C */  jal         ExitCriticalSection
/* 9348 80020B48 00000000 */   nop
/* 934C 80020B4C 0280043C */  lui        $a0, %hi(func_8001FC5C)
/* 9350 80020B50 5CFC8424 */  addiu      $a0, $a0, %lo(func_8001FC5C)
/* 9354 80020B54 4266000C */  jal        jt_set
/* 9358 80020B58 80020534 */   ori       $a1, $zero, 0x280
/* 935C 80020B5C 0280043C */  lui        $a0, %hi(func_80020000)
/* 9360 80020B60 00008424 */  addiu      $a0, $a0, %lo(func_80020000)
/* 9364 80020B64 4266000C */  jal        jt_set
/* 9368 80020B68 81020534 */   ori       $a1, $zero, 0x281
/* 936C 80020B6C 0280043C */  lui        $a0, %hi(func_800200C8)
/* 9370 80020B70 C8008424 */  addiu      $a0, $a0, %lo(func_800200C8)
/* 9374 80020B74 4266000C */  jal        jt_set
/* 9378 80020B78 82020534 */   ori       $a1, $zero, 0x282
/* 937C 80020B7C 0280043C */  lui        $a0, %hi(func_80020434)
/* 9380 80020B80 34048424 */  addiu      $a0, $a0, %lo(func_80020434)
/* 9384 80020B84 4266000C */  jal        jt_set
/* 9388 80020B88 83020534 */   ori       $a1, $zero, 0x283
/* 938C 80020B8C 0280043C */  lui        $a0, %hi(func_80020808)
/* 9390 80020B90 08088424 */  addiu      $a0, $a0, %lo(func_80020808)
/* 9394 80020B94 4266000C */  jal        jt_set
/* 9398 80020B98 84020534 */   ori       $a1, $zero, 0x284
/* 939C 80020B9C 0280043C */  lui        $a0, %hi(func_800206E4)
/* 93A0 80020BA0 E4068424 */  addiu      $a0, $a0, %lo(func_800206E4)
/* 93A4 80020BA4 4266000C */  jal        jt_set
/* 93A8 80020BA8 85020534 */   ori       $a1, $zero, 0x285
/* 93AC 80020BAC 0280043C */  lui        $a0, %hi(func_8001FFC4)
/* 93B0 80020BB0 C4FF8424 */  addiu      $a0, $a0, %lo(func_8001FFC4)
/* 93B4 80020BB4 4266000C */  jal        jt_set
/* 93B8 80020BB8 86020534 */   ori       $a1, $zero, 0x286
/* 93BC 80020BBC 0280043C */  lui        $a0, %hi(mc_file_create)
/* 93C0 80020BC0 1C018424 */  addiu      $a0, $a0, %lo(mc_file_create)
/* 93C4 80020BC4 4266000C */  jal        jt_set
/* 93C8 80020BC8 90020534 */   ori       $a1, $zero, 0x290
/* 93CC 80020BCC 0280043C */  lui        $a0, %hi(mc_file_open)
/* 93D0 80020BD0 A0018424 */  addiu      $a0, $a0, %lo(mc_file_open)
/* 93D4 80020BD4 4266000C */  jal        jt_set
/* 93D8 80020BD8 91020534 */   ori       $a1, $zero, 0x291
/* 93DC 80020BDC 0280043C */  lui        $a0, %hi(mc_file_close)
/* 93E0 80020BE0 08028424 */  addiu      $a0, $a0, %lo(mc_file_close)
/* 93E4 80020BE4 4266000C */  jal        jt_set
/* 93E8 80020BE8 92020534 */   ori       $a1, $zero, 0x292
/* 93EC 80020BEC 0280043C */  lui        $a0, %hi(func_800202FC)
/* 93F0 80020BF0 FC028424 */  addiu      $a0, $a0, %lo(func_800202FC)
/* 93F4 80020BF4 4266000C */  jal        jt_set
/* 93F8 80020BF8 93020534 */   ori       $a1, $zero, 0x293
/* 93FC 80020BFC 0280043C */  lui        $a0, %hi(func_8002026C)
/* 9400 80020C00 6C028424 */  addiu      $a0, $a0, %lo(func_8002026C)
/* 9404 80020C04 4266000C */  jal        jt_set
/* 9408 80020C08 94020534 */   ori       $a1, $zero, 0x294
/* 940C 80020C0C 0280043C */  lui        $a0, %hi(func_80020414)
/* 9410 80020C10 14048424 */  addiu      $a0, $a0, %lo(func_80020414)
/* 9414 80020C14 4266000C */  jal        jt_set
/* 9418 80020C18 95020534 */   ori       $a1, $zero, 0x295
/* 941C 80020C1C 0280043C */  lui        $a0, %hi(mc_file_delete)
/* 9420 80020C20 28028424 */  addiu      $a0, $a0, %lo(mc_file_delete)
/* 9424 80020C24 4266000C */  jal        jt_set
/* 9428 80020C28 96020534 */   ori       $a1, $zero, 0x296
/* 942C 80020C2C 0280043C */  lui        $a0, %hi(func_800205C4)
/* 9430 80020C30 C4058424 */  addiu      $a0, $a0, %lo(func_800205C4)
/* 9434 80020C34 4266000C */  jal        jt_set
/* 9438 80020C38 97020534 */   ori       $a1, $zero, 0x297
/* 943C 80020C3C 0280043C */  lui        $a0, %hi(func_80020610)
/* 9440 80020C40 10068424 */  addiu      $a0, $a0, %lo(func_80020610)
/* 9444 80020C44 4266000C */  jal        jt_set
/* 9448 80020C48 98020534 */   ori       $a1, $zero, 0x298
/* 944C 80020C4C 0280043C */  lui        $a0, %hi(func_80020630)
/* 9450 80020C50 30068424 */  addiu      $a0, $a0, %lo(func_80020630)
/* 9454 80020C54 4266000C */  jal        jt_set
/* 9458 80020C58 99020534 */   ori       $a1, $zero, 0x299
/* 945C 80020C5C 0280043C */  lui        $a0, %hi(func_800203AC)
/* 9460 80020C60 AC038424 */  addiu      $a0, $a0, %lo(func_800203AC)
/* 9464 80020C64 4266000C */  jal        jt_set
/* 9468 80020C68 A0020534 */   ori       $a1, $zero, 0x2A0
/* 946C 80020C6C 0280043C */  lui        $a0, %hi(func_800202A0)
/* 9470 80020C70 A0028424 */  addiu      $a0, $a0, %lo(func_800202A0)
/* 9474 80020C74 4266000C */  jal        jt_set
/* 9478 80020C78 A1020534 */   ori       $a1, $zero, 0x2A1
/* 947C 80020C7C 1000BF8F */  lw         $ra, 0x10($sp)
/* 9480 80020C80 00000000 */  nop
/* 9484 80020C84 0800E003 */  jr         $ra
/* 9488 80020C88 1800BD27 */   addiu     $sp, $sp, 0x18
